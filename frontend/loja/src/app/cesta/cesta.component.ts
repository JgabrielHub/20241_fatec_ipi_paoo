import { Component } from '@angular/core';
import { Item } from '../model/item';
import { Pedido } from '../model/pedido';
import { PedidoService } from '../service/pedido.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-cesta',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './cesta.component.html',
  styleUrls: ['./cesta.component.css']
})
export class CestaComponent {
  public lista: Item[] = [];
  public mensagem: string = '';
  public totalCesta: number = 0;
  public pedido: Pedido = new Pedido();

  constructor(private pedidoService: PedidoService) {
    this.carregarCesta();
  }

  private carregarCesta(): void {
    let json = localStorage.getItem('cesta');
    if (json == null) {
      this.mensagem = 'Sua cesta de compras está vazia !!!';
    } else {
      this.lista = JSON.parse(json);
      this.calcularTotalCesta();
    }
  }

  private calcularTotalCesta(): void {
    this.totalCesta = this.lista.reduce((sum, item) => sum + item.total, 0);
  }

  limparCesta(): void {
    this.lista = [];
    localStorage.removeItem('cesta');
    this.totalCesta = 0;
    this.mensagem = 'Sua cesta de compras está vazia.';
  }

  removeItem(item: Item): void {
    const index = this.lista.findIndex(existingItem => existingItem.codigoProduto === item.codigoProduto);
    if (index !== -1) {
      this.lista.splice(index, 1);
      this.calcularTotalCesta();
      localStorage.setItem('cesta', JSON.stringify(this.lista));
      this.mensagem = this.lista.length === 0 ? 'Sua cesta de compras está vazia.' : '';
    } else {
      console.warn('Item not found in the cart:', item);
    }
  }

  atualizarQuantidade(item: Item): void {
    const index = this.lista.findIndex(existingItem => existingItem.codigoProduto === item.codigoProduto);
    if (index !== -1) {
      item.total = item.qtd * item.valor;
      this.calcularTotalCesta();
      localStorage.setItem('cesta', JSON.stringify(this.lista));
    } else {
      console.warn('Item not found in the cart:', item);
    }
  }

  gravarPedido(): void {
    try {
      this.mensagem = 'Pedido gravado com sucesso!';
      this.pedido.codigoCliente = 123; // Substitua pelo código real do cliente
      this.pedido.total = this.totalCesta;
      this.pedido.status = 'Novo';
      this.pedido.entrega = 'Padrão'; // Substitua pela forma de entrega desejada
      this.pedido.dataPedido = new Date();

      this.pedidoService.gravar(this.pedido).subscribe(
        response => {
          console.log('Pedido gravado com sucesso!', response);
          this.limparCesta();
        },
        error => {
          console.error('Erro ao gravar o pedido:', error);
          this.mensagem = 'Erro ao gravar o pedido. Tente novamente mais tarde.';
        }
      );
    } catch (erro) {
      this.mensagem = 'Ocorreu um erro durante a gravação!';
    }
  }

  limpar(): void {
    this.pedido = new Pedido();
    this.lista = [];
    this.totalCesta = 0;
    this.mensagem = '';
  }
}
