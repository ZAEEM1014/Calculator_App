
import 'package:calculator_app/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userinput='';
  var answer='';
  bool hasCalculated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
body: SafeArea(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(

      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top:0,bottom: 35,left: 260,right: 0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(userinput.toString(),style: const TextStyle(fontSize: 40,color: Colors.white),),
                const SizedBox(height: 10,),
                Text(answer.toString(),style: const TextStyle(fontSize: 30,color: Colors.grey),)

              ],
            ),
          ),
        ),

        Expanded(
          flex: 2,
          child: Column(
            children: [
              Row(
                children: [
                  RoundButton(color: const Color(0xff000080),name:'AC',onPress: (){
                    userinput='';
                    answer='';
                    setState(() {

                    });
                  },),
                  RoundButton(color: const Color(0xff000080),name:'^',onPress: (){
                    addOperator('^');

                    setState(() {

                    });
                  },),
                  RoundButton(color: const Color(0xff000080),name:'%',onPress: (){
                    addOperator('%');
                    setState(() {

                    });
                  },),
                  RoundButton(color: const Color(0xff000080),name:'DEL',onPress: (){

                    if (userinput.isNotEmpty) {
                      userinput = userinput.substring(0, userinput.length - 1);
                    }
                    setState(() {});
                  },),


                ],
              ),
              Row(
                children: [
                  RoundButton(name:'7',onPress: (){
                    userinput+='7';
                    hasCalculated = false;
                    setState(() {

                    });
                  },),
                  RoundButton(name:'8',onPress: (){
                    userinput+='8';
                    hasCalculated = false;
                    setState(() {

                    });
                  },),
                  RoundButton(name:'9',onPress: (){
                    userinput+='9';
                    hasCalculated = false;
                    setState(() {

                    });
                  },),
                  RoundButton(color: const Color(0xff000080),name:'x',onPress: (){
                    addOperator('x');
                    setState(() {

                    });
                  },),

                ],
              ),
              Row(
                children: [
                  RoundButton(name:'4',onPress: (){
                    userinput+='4';
                    hasCalculated = false;
                    setState(() {

                    });
                  },),
                  RoundButton(name:'5',onPress: (){
                    userinput+='5';
                    hasCalculated = false;
                    setState(() {

                    });
                  },),
                  RoundButton(name:'6',onPress: (){
                    userinput+='6';
                    hasCalculated = false;
                    setState(() {

                    });
                  },),
                  RoundButton(color: const Color(0xff000080),name:'-',onPress: (){
                    addOperator('-');
                    hasCalculated = false;
                    setState(() {

                    });
                  },),

                ],
              ),
              Row(
                children: [
                  RoundButton(name:'1',onPress: (){
                    userinput+='1';
                    hasCalculated = false;
                    setState(() {

                    });
                  },),
                  RoundButton(name:'2',onPress: (){
                    userinput+='2';
                    hasCalculated = false;
                    setState(() {

                    });
                  },),
                  RoundButton(name:'3',onPress: (){
                    userinput+='3';
                    hasCalculated = false;
                    setState(() {

                    });
                  },),
                  RoundButton(color: const Color(0xff000080),name:'+',onPress: (){
                    addOperator('+');
                    setState(() {

                    });
                  },),

                ],
              ),
              Row(
                children: [
                  RoundButton(name:'0',onPress: (){
                    userinput+='0';
                    hasCalculated = false;
                    setState(() {

                    });
                  },),
                  RoundButton(name:'.',onPress: (){
                    userinput+='.';
                    hasCalculated = false;
                    setState(() {

                    });
                  },
                  ),
                  RoundButton(color: const Color(0xff8B0000),name:'=',onPress: (){

                    equalPress();
                    setState(() {

                    });

                  },),
                  RoundButton(color: const Color(0xff000080),name:'/',onPress: (){
                    addOperator('/');
                    setState(() {

                    });
                  },),


                ],
              ),
            ],
          ),
        )





      ],
    ),
  ),
),
    );
  }
  void addOperator(String operator) {
    if (userinput.isNotEmpty) {
      final lastChar = userinput[userinput.length - 1];
      if (isOperator(lastChar)) {
        userinput = userinput.substring(0, userinput.length - 1);
      }
    } else if (hasCalculated) {
      // If hasCalculated is true, start with the answer
      userinput = answer;
      hasCalculated = false; // Reset calculation state
    }
    userinput += operator; // Add new operator
    setState(() {});
  }

  bool isOperator(String char) {
    return char == '+' || char == '-' || char == '*' || char == '/'|| char == '^';
  }

  void equalPress() {
    if (hasCalculated) {
      return; // Do nothing if equals was pressed again
    }
    try {
      Parser p = Parser();
      Expression expression = p.parse(userinput.replaceAll('x', '*'));
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      answer = eval.toString();
      userinput = ''; // Clear userinput after calculating
      hasCalculated = true; // Set flag indicating a calculation has been done
    } catch (e) {
      answer = '';
    }
    setState(() {});
  }

}

