import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-contato',
  templateUrl: './contato.component.html',
  styleUrls: ['./contato.component.css']
})
export class ContatoComponent {
  public contatoForm: FormGroup;
  public mensagem: string = '';

  constructor(private fb: FormBuilder) {
    this.contatoForm = this.fb.group({
      nome: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      assunto: ['', Validators.required],
      mensagem: ['', Validators.required]
    });
  }

  public enviar(): void {
    if (this.contatoForm.valid) {
      // Lógica para enviar a mensagem (e.g., serviço de email)
      console.log(this.contatoForm.value);
      this.mensagem = 'Sua mensagem foi enviada com sucesso!';
      this.contatoForm.reset();
    } else {
      this.mensagem = 'Por favor, preencha todos os campos corretamente.';
    }
  }
}
