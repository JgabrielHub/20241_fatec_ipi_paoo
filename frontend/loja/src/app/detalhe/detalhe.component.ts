import { Component, OnInit } from '@angular/core';
import { Produto } from '../model/produto';
import { Item } from '../model/item';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ProdutoService } from '../service/produto.service';

@Component({
  selector: 'app-detalhe',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './detalhe.component.html',
  styleUrls: ['./detalhe.component.css']
})
export class DetalheComponent implements OnInit {
  public mensagem: string = '';
  public obj: Produto = new Produto();
  public quantidade: number = 1;

  constructor(private service: ProdutoService) {}

  ngOnInit(): void {
    let codigo = localStorage.getItem('detalhe');
    if (codigo == null) {
      this.mensagem = 'Produto não encontrado!!!';
    } else {
      this.service.carregar(codigo).subscribe(
        (data: Produto) => {
          if (data == null) {
            this.mensagem = 'Produto não encontrado!';
          } else {
            this.obj = data;
          }
        },
        (error) => {
          this.mensagem = 'Ocorreu um erro no carregamento do detalhe: ' + error;
        }
      );
    }
  }

  public comprar(produto: Produto) {
    this.adicionarItemAoCarrinho(produto, true);
  }

  public adicionarCesta(produto: Produto) {
    this.adicionarItemAoCarrinho(produto, false);
  }

  private adicionarItemAoCarrinho(produto: Produto, redirecionar: boolean) {
    let novo: Item = new Item();
    novo.codigoProduto = produto.codigo;
    novo.nomeProduto = produto.nome;
    novo.valor = produto.valor;
    novo.qtd = this.quantidade;
    novo.total = produto.valor * this.quantidade;
    let lista: Item[] = [];
    let json = localStorage.getItem("cesta");
    if (json == null) {
      lista.push(novo);
    } else {
      lista = JSON.parse(json);
      lista.push(novo);
    }
    localStorage.setItem("cesta", JSON.stringify(lista));
    if (redirecionar) {
      window.location.href = "./cesta";
    }
  }
}
