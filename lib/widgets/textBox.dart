import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icone;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const CampoTexto({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icone,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icone, color: const Color(0xFF4F46E5)),
        suffixIcon: suffixIcon,
      ),
    );
  }
}