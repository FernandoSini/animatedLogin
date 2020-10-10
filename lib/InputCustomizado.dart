import 'package:flutter/material.dart';

class InputCustomizado extends StatelessWidget {
  InputCustomizado(
      {@required this.hint,
      this.obscure = false,
      this.icon = const Icon(Icons.person)});
  final String hint;
  final bool obscure;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: TextField(
              obscureText: this.obscure,
              decoration: InputDecoration(
                  icon: this.icon,
                  border: InputBorder.none,
                  hintText: this.hint,
                  hintStyle: TextStyle(color: Colors.grey[600], fontSize: 18)),
            ),
          ),
        ],
      ),
      /*  decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 15,
                            spreadRadius: 4,
                          ),
                        ],
                      ), */
    );
  }
}
