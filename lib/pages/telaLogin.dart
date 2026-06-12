import 'package:flutter/material.dart';
import '../widgets/textBox.dart';
import '../widgets/mensagem.dart';
import 'package:projeto/widgets/auth.dart';
import '../widgets/icones.dart';
import '../widgets/cadastro.dart';
import '../pages/home.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  String _mensagemErro = '';
  bool _mostrarSenha = false;

  void _validarLogin() {
    final email = _emailController.text.trim();
    final senha = _senhaController.text;

      final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      );

    setState(() {
      if (email.isEmpty) {
        _mensagemErro = 'Digite seu email';
      } else if (!emailRegex.hasMatch(email)) {
        _mensagemErro = 'Digite um email válido';
      } else if (senha.isEmpty) {
        _mensagemErro = 'Digite sua senha';
      } else {
        _mensagemErro = '';
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TelaHome()),
        );
      }
    });
  }

  void _irParaCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TelaCadastro()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0FF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: AuthCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CabecalhoIcone(
                    icone: Icons.lock_rounded,
                    titulo: 'Login',
                    subtitulo: 'Bem-vindo! Entre com sua conta para continuar.',
                  ),
                  const SizedBox(height: 28),

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
                    hint: 'Sua Senha',
                    icone: Icons.lock_outline,
                    obscureText: !_mostrarSenha,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _mostrarSenha ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () =>
                          setState(() => _mostrarSenha = !_mostrarSenha),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Mensagem de erro
                  if (_mensagemErro.isNotEmpty) ...[
                    MensagemFeedback(
                      mensagem: _mensagemErro,
                      tipo: TipoMensagem.erro,
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Botão Entrar
                  ElevatedButton(
                    onPressed: _validarLogin,
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(height: 12),

                  // Botão Criar conta
                  OutlinedButton(
                    onPressed: _irParaCadastro,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Color(0xFF4F46E5)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      foregroundColor: const Color(0xFF4F46E5),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: const Text('Criar conta'),
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
