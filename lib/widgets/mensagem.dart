import 'package:flutter/material.dart';

enum TipoMensagem { erro, sucesso }

class MensagemFeedback extends StatelessWidget {
  final String mensagem;
  final TipoMensagem tipo;

  const MensagemFeedback({
    super.key,
    required this.mensagem,
    required this.tipo,
  });

  @override
  Widget build(BuildContext context) {
    final bool isErro = tipo == TipoMensagem.erro;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isErro
            ? const Color(0xFFFEE2E2)
            : const Color(0xFFDCFCE7),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isErro
              ? const Color(0xFFFCA5A5)
              : const Color(0xFF86EFAC),
        ),
      ),
      child: Row(
        children: [
          Icon(
            isErro ? Icons.error_outline : Icons.check_circle_outline,
            color: isErro ? const Color(0xFFDC2626) : const Color(0xFF16A34A),
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              mensagem,
              style: TextStyle(
                color: isErro ? const Color(0xFFDC2626) : const Color(0xFF16A34A),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}