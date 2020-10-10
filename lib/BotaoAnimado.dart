import 'package:flutter/material.dart';

class BotaoAnimado extends StatelessWidget {
  BotaoAnimado({@required this.controller})
      : largura = Tween<double>(
          /* dps do : quando chamo o botao animado eu ja chamo a largura automaticamente*/
          begin: 0,
          end: 500,
        ).animate(CurvedAnimation(parent: controller, curve: Interval(0.5, 1))),
        altura = Tween<double>(
          /* dps do : quando chamo o botao animado eu ja chamo a largura automaticamente*/
          begin: 0,
          end: 50,
        ).animate(
            CurvedAnimation(parent: controller, curve: Interval(0.5, 0.7))),
        radius = Tween<double>(
          /* dps do : quando chamo o botao animado eu ja chamo a largura automaticamente*/
          begin: 0,
          end: 20,
        ).animate(CurvedAnimation(parent: controller, curve: Interval(0.6, 1))),
        opacidade = Tween<double>(
          /* dps do : quando chamo o botao animado eu ja chamo a largura automaticamente*/
          begin: 0,
          end: 1,
        ).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(
                0.6,
                /* entre 0.6 à 0.8 ele vai executar a animacao de opacidade e só depois vai fazer outra coisa, nesse caso o texto vai aparecer antes da largura ficar completa*/
                0.8)));
  AnimationController controller;
  Animation<double> largura;
  Animation<double> opacidade;
  Animation<double> altura;
  Animation<double> radius;

  Widget _buildAnimation(BuildContext context, Widget widget) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: altura.value,
        width: largura.value,
        child: Center(
          child: FadeTransition(
            opacity: opacidade,
            child: Text(
              "entar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.value),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 100, 127, 1),
              Color.fromRGBO(255, 123, 145, 1),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return /* InkWell é um widget que permite clicar sobre ele, parecido como gesturedetector, só que aplicamos em um objeto retangular, funciona como botão  */
        AnimatedBuilder(
      animation: this.controller,
      builder: _buildAnimation,
    );
  }
}
