import { Component } from '@angular/core';
import { Cliente } from '../model/cliente';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ClienteService } from '../service/cliente.service';

@Component({
  selector: 'app-esqueci',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './esqueci.component.html',
  styleUrls: ['./esqueci.component.css']
})
export class EsqueciComponent {
  public mensagem: string = "Informe seu email para redefinir a senha";
  public obj: Cliente = new Cliente();

  constructor(private service: ClienteService) {}

  public enviarEmail() {
    if (!this.obj.email) {
      this.mensagem = "Por favor, informe um email válido.";
      return;
    }
    
    this.service.reenvioSenha(this.obj.email).subscribe(
      (response) => {
        this.mensagem = "Verifique o seu email." + response;
      },
      (error) => {
        this.mensagem = error.status === 404 ? "Email não encontrado." : "Verifique o seu email.";
        console.log(error);
      }
    );
  }
}
