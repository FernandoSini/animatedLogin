import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ishow_app/InputCustomizado.dart';
import 'package:flutter/scheduler.dart' as timeDilation;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animationBlur;
  Animation<double> _animationFade;
  Animation<double> _animationSize;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animationBlur = Tween<double>(
      begin: 5,
      end: 0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );
    _animationFade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuint),
    );
    _animationSize = Tween<double>(
      begin: 0,
      end: 500,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    /* fazendo a execução da animação ser em camera lenta */
    timeDilation.timeDilation = 8;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _animationBlur,
                builder: (context, widget) {
                  return Container(
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('imagens/fundo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: BackdropFilter(
                      /* aplicando o blur no na imagem */
                      filter: ImageFilter.blur(
                        sigmaX: _animationBlur.value,
                        sigmaY: _animationBlur.value,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            child: FadeTransition(
                              opacity: _animationFade,
                              child: Image.asset('imagens/detalhe1.png'),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            child: FadeTransition(
                              opacity: _animationFade,
                              child: Image.asset('imagens/detalhe2.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _animationSize,
                      builder: (context, widget) {
                        return Container(
                          width: _animationSize.value,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              InputCustomizado(
                                hint: "Email",
                                icon: Icon(Icons.person),
                              ),
                              InputCustomizado(
                                hint: "Senha",
                                obscure: true,
                                icon: Icon(Icons.lock),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    /* InkWell é um widget que permite clicar sobre ele, parecido como gesturedetector, só que aplicamos em um objeto retangular, funciona como botão  */
                    AnimatedBuilder(
                      animation: _animationSize,
                      builder: (context, widget) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: _animationSize.value,
                            child: Center(
                              child: Text(
                                "entar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(255, 100, 127, 1),
                                  Color.fromRGBO(255, 123, 145, 1),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeTransition(
                      opacity: _animationFade,
                      child: Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 100, 127, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
