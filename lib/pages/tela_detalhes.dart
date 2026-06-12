import 'package:flutter/material.dart';
import 'package:projeto/widgets/telaAnimatedContainer.dart';

class TelaDetalhes extends StatelessWidget {
  const TelaDetalhes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animação'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(
                  Icons.school,
                  size: 80,
                  color: Colors.blue,
                ),

                const Text(
                  'Animação Implicita e Explicita',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Escolha um tipo de animação',
                  textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const TelaAnimatedContainer();
                        })
                      );
                    }, 
                    icon: const Icon(Icons.animation),
                    label: const Text('AnimatedContainer'),
                  
                    )
              ],
            ),
            ),
          
        )
        ),
    );
  }

}