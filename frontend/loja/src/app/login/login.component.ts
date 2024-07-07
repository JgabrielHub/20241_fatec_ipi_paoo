import { Component } from '@angular/core';
import { Cliente } from '../model/cliente';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ClienteService } from '../service/cliente.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  public mensagem: String = "";
  public obj: Cliente = new Cliente();

  constructor(private service: ClienteService){   
  }

  public entrar(){
    this.service.login(this.obj).subscribe(
      (data: Cliente) => {  
        if(data!=null){
          localStorage.setItem("cliente", JSON.stringify(data));
          window.location.href="./cadastro";
        }  else {
          this.mensagem = "Email ou senha invalidos !!!";
        }
      }, 
      (error) => {
        this.mensagem = "Ocorreu um erro, tente mais tarde !!!";
        console.log(error);
      }
    );


  }

}
