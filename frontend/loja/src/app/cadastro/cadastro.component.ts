import { Component } from '@angular/core';
import { Cliente } from '../model/cliente';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { json } from 'stream/consumers';
import { ClienteService } from '../service/cliente.service';

@Component({
  selector: 'app-cadastro',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './cadastro.component.html',
  styleUrl: './cadastro.component.css'
})
export class CadastroComponent {
  public mensagem: string = "";
  public obj: Cliente = new Cliente(); 

  public constructor(private clienteService: ClienteService){
    let json = localStorage.getItem("cliente");
    if(json==null){
      this.mensagem = "Você ainda não tem cadastro!!!";
    } else {
      this.obj = JSON.parse(json);
    } 
  }

  public gravar(){
   /* this.mensagem = "Cliente cadastrado com sucesso!"; 
    console.log(JSON.stringify(this.obj));   
    localStorage.setItem("cadastro", 
                        JSON.stringify(this.obj));*/

    try{
      this.mensagem = "Regristro gravado com sucesso!";
      this.clienteService.gravar(this.obj); 
      this.limpar();
    }catch(erro){
      this.mensagem = "Ocorreu um erro durante a gravação!";
    }                    
  }


  public alterar(){
    try{
      this.mensagem = "Registro alterado com sucesso!";
      this.clienteService.alterar(this.obj); 
      this.limpar();
    }catch(erro){
      this.mensagem = "Ocorreu um erro durante a gravação!";
    }
 }

 public limpar(){
  this.obj.codigo = 0;
  this.obj.nome = "";
  this.obj.email = "";
  this.obj.telefone = "";
  this.obj.documento = "";
  this.obj.cidade = "";
  this.obj.complemento = "";
  this.obj.estado = "";
  this.obj.logradouro = "";
  this.obj.senha = "";
  this.obj.cep="";
 }

 public remover(){
  try{
    this.mensagem = "Registro removido com sucesso!";
    this.clienteService.remover(this.obj); 
    this.limpar();
  }catch(erro){
    this.mensagem = "Ocorreu um erro durante a exclusão";
  }
}


  public carregar(){
    this.mensagem = "";
      this.clienteService.carregar(this.obj.codigo).subscribe(
        (data: Cliente) => {    
          if(data==null){
            this.mensagem = "Registro não encontrado!";
            this.limpar();
          } else {        
            this.obj= data;
          }
        } , 
        (error) => {
          this.mensagem = "ocorreu um erro no carregamento do usuario !"+ error;
          this.limpar();
        }
      )        
  }
}
