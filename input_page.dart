import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'ResultsPage.dart';
import 'calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selectedgender;
  int height=180;
  int weight=60;
  int age=19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(IconContent(FontAwesomeIcons.mars, 'MALE'), selectedgender == Gender.male ? activecardcolour : inactivecardcolour,
      (){
        setState((){
          selectedgender = Gender.male;
        });
      },),
                ),
                Expanded(
                  child: ReusableCard(IconContent(FontAwesomeIcons.venus, 'FEMALE'), selectedgender == Gender.female ? activecardcolour : inactivecardcolour,
    (){
    setState((){
    selectedgender = Gender.female;
    });
    },),
                ),
              ],
            ),
          ),

          Expanded(
            child: ReusableCard(
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Height',style:labeltextstyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),style:fontweight),
                    Text('cm',style:labeltextstyle),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0XFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0XFFEB1555),
                    overlayColor: Color(0X29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child:Slider(value: height.toDouble(), min: 120,max:220,onChanged: (double newValue){
                    setState((){
                      height=newValue.round();
                    });

                  },),
                )
              ],
            ),
              activecardcolour,
                  ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',style:labeltextstyle),
                        Text(weight.toString(),style:fontweight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                weight--;
                              },
                              backgroundColor: Color(0XFF4C4F5E),
                              child:Icon(FontAwesomeIcons.minus,color:Colors.white),
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton(
                              onPressed: () {
                                weight++;
                              },
                              backgroundColor: Color(0XFF4C4F5E),
                              child:Icon(Icons.add,color:Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                    ,activecardcolour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',style:labeltextstyle),
                        Text(weight.toString(),style:fontweight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                age--;
                              },
                              backgroundColor: Color(0XFF4C4F5E),
                              child:Icon(FontAwesomeIcons.minus,color:Colors.white),
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton(
                              onPressed: () {
                                age++;
                              },
                              backgroundColor: Color(0XFF4C4F5E),
                              child:Icon(FontAwesomeIcons.plus,color:Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                  ,activecardcolour,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){

              Calculator calc=Calculator(height, weight);

              Navigator.push(context,MaterialPageRoute(builder: (context){
                return ResultsPage(
                    bmi:calc.calculateBMI(),
                    result:calc.getResult(),
                ),
              },),);
            },
            child: Container(
              child: Center(child: Text('CALCULATE',style:largebutton)),
              color: bottomcontainercolour,
              margin: EdgeInsets.only(top: 10),
              height: bottomcontainerheight,
              padding: EdgeInsets.only(bottom: 20),
            ),
          ),
        ],
      ),
    );
  }
}


