
import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {

  final String name;
  final Color color;
  VoidCallback onPress;


   RoundButton({ required this.name,this.color= const Color(0xff3b3b3b),required this.onPress});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Center(
        child: InkWell(
          onTap: onPress,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(

              height: 67,
              width: 80,


              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.rectangle,


              ),
              child:Center(child: Text(name,style: TextStyle(fontSize: 20,color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }
}


