import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final Color;
  final txtcolor;
  final buttontxt;
  final buttontapped;

  Mybutton({this.Color, this.txtcolor, this.buttontxt, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: Color,
            child: Center(
                child: Text(
              buttontxt,
              style: TextStyle(
                  color: txtcolor, fontSize: 33, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
