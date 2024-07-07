import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Produto } from '../model/produto';
import { Item } from '../model/item';
import { ProdutoService } from '../service/produto.service';

@Component({
  selector: 'app-vitrine',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './vitrine.component.html',
  styleUrl: './vitrine.component.css'
})
export class VitrineComponent {
  public mensagem:String;
  public lista: Produto[] = []; 
 /* [{codigo:1,nome:"furadeira",valor:100, descritivo:"",
    promo:90, estoque:10, destaque:1},
    {codigo:2,nome:"serra",valor:100, descritivo:"",
    promo:90, estoque:10, destaque:1},
    {codigo:3,nome:"parafusadeira",valor:100, descritivo:"",
    promo:90, estoque:10, destaque:1}
  ];*/

  public constructor(private service: ProdutoService){
    this.mensagem = "";
    this.service.listar().subscribe(
      (data: Produto[]) => {    
        if(data==null){
          this.mensagem = "Produtos não encontrados!";
        } else {        
          this.lista = data;
        }
      } , 
      (error) => {
        this.mensagem = "ocorreu um erro no carregamento da vitrine !"+ error;
      }
    )        

  }

  public comprar(produto: Produto){
    let novo: Item = new Item();
    novo.codigoProduto = produto.codigo;
    novo.nomeProduto = produto.nome;
    novo.valor = produto.valor;
    novo.qtd = 1;
    novo.total = produto.valor;
    let lista : Item[] = [];
    let json = localStorage.getItem("cesta");
    if(json==null){
      lista.push(novo);  
      console.log(JSON.stringify(lista));
    } else {
      lista = JSON.parse(json);
      lista.push(novo);
    }  
    localStorage.setItem("cesta",JSON.stringify(lista));
    window.location.href="./cesta";
  }
  
  public abrirDetalhe(produto: Produto){
    localStorage.setItem("detalhe",JSON.stringify(produto.codigo));
    window.location.href="./detalhe";
  }
}
