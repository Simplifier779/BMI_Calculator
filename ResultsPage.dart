import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi/reusable_card.dart';
class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;

  ResultsPage(this.bmiResult,this.resultText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                child: Text('Your Result',style: titlestyle,),
              ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard())
        ],
      ),
    );
  }
}
