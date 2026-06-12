import 'package:flutter/material.dart';
import 'textBox.dart';
import 'mensagem.dart';
import 'auth.dart';
import 'icones.dart';
import '../pages/home.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();

  String _mensagem = '';
  TipoMensagem _tipoMensagem = TipoMensagem.erro;
  bool _mostrarSenha = false;
  bool _mostrarConfirmarSenha = false;

  void _validarCadastro() {
    final nome = _nomeController.text.trim();
    final email = _emailController.text.trim();
    final senha = _senhaController.text;
    final confirmarSenha = _confirmarSenhaController.text;

    setState(() {
      if (nome.isEmpty) {
        _mensagem = 'Digite seu nome';
        _tipoMensagem = TipoMensagem.erro;
      } else if (email.isEmpty) {
        _mensagem = 'Digite seu email';
        _tipoMensagem = TipoMensagem.erro;
      } else if (!email.contains('@')) {
        _mensagem = 'Digite um email válido';
        _tipoMensagem = TipoMensagem.erro;
      } else if (senha.isEmpty) {
        _mensagem = 'Digite sua senha';
        _tipoMensagem = TipoMensagem.erro;
      } else if (senha.length < 6) {
        _mensagem = 'A senha precisa ter pelo menos 6 caracteres';
        _tipoMensagem = TipoMensagem.erro;
      } else if (confirmarSenha != senha) {
        _mensagem = 'As senhas não são iguais';
        _tipoMensagem = TipoMensagem.erro;
      } else {
        _mensagem = 'Cadastro realizado com sucesso!';
        _tipoMensagem = TipoMensagem.sucesso;

        Future.delayed(const Duration(milliseconds: 800), () {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const TelaHome()),
            );
          }
        });
      }
    });
  }

  void _voltarParaLogin() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0FF),
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: AuthCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CabecalhoIcone(
                    icone: Icons.person_add_rounded,
                    titulo: 'Criar Conta',
                    subtitulo: 'Preencha os dados para criar sua conta.',
                  ),
                  const SizedBox(height: 28),

                  // Campo nome
                  CampoTexto(
                    controller: _nomeController,
                    label: 'Nome',
                    hint: 'Seu nome completo',
                    icone: Icons.person_outline,
                  ),
                  const SizedBox(height: 14),

                  // Campo email
                  CampoTexto(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'seu@email.com',
                    icone: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 14),

                  // Campo senha
                  CampoTexto(
                    controller: _senhaController,
                    label: 'Senha',
                    hint: 'Mínimo 6 caracteres',
                    icone: Icons.lock_outline,
                    obscureText: !_mostrarSenha,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _mostrarSenha ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () => setState(() => _mostrarSenha = !_mostrarSenha),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Campo confirmar senha
                  CampoTexto(
                    controller: _confirmarSenhaController,
                    label: 'Confirmar senha',
                    hint: 'Repita a senha',
                    icone: Icons.lock_reset_outlined,
                    obscureText: !_mostrarConfirmarSenha,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _mostrarConfirmarSenha ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () => setState(() => _mostrarConfirmarSenha = !_mostrarConfirmarSenha),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Mensagem de erro/sucesso
                  if (_mensagem.isNotEmpty) ...[
                    MensagemFeedback(
                      mensagem: _mensagem,
                      tipo: _tipoMensagem,
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Botão Cadastrar
                  ElevatedButton(
                    onPressed: _validarCadastro,
                    child: const Text('Cadastrar'),
                  ),
                  const SizedBox(height: 12),

                  // Botão Voltar para Login
                  TextButton(
                    onPressed: _voltarParaLogin,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF4F46E5),
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Text('← Voltar para Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}