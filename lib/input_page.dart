import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Iconcard.dart';
import 'IconContent.dart';
import 'result.dart';

const boxBackground = Color(0xFF1D1E33);
const inactiveBackground = Color(0XFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 90;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? boxBackground
                        : inactiveBackground,
                    cardChild: (IconContent(
                        gender: 'Male', genderIcon: FontAwesomeIcons.mars)),
                  ),
                ),
                Expanded(
                  child: ResusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? boxBackground
                        : inactiveBackground,
                    cardChild: (IconContent(
                        gender: 'Female', genderIcon: FontAwesomeIcons.venus)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResusableCard(
              color: boxBackground,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    activeColor: Colors.purple,
                    max: 220.0,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: ResusableCard(
                color: boxBackground,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('weight',style: TextStyle(
                        fontSize: 20.0
                    )),
                    SizedBox(height: 20.0),
                    Text(weight.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       RoundIconButton(icon : FontAwesomeIcons.plus,onPresses:
                       (){
                         setState(() {
                           weight++;
                         });
                       },
                       ),
                        RoundIconButton(icon : FontAwesomeIcons.minus,onPresses: (){
                          setState(() {
                            weight--;
                          });
                        },),

                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ResusableCard(
                color: boxBackground,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Age',style: TextStyle(
                      fontSize: 20.0
                    ),
                    ),
                    SizedBox(height: 20.0),
                    Text(age.toString()),
                    SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundIconButton(icon : FontAwesomeIcons.plus,onPresses:
                            (){
                          setState(() {
                            age++;
                          });
                        },
                        ),
                        RoundIconButton(icon : FontAwesomeIcons.minus,onPresses: (){
                          setState(() {
                            age--;
                          });
                        },),

                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          Container(
            height: 60.0,
            color: Colors.purple,
            width: double.infinity,
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  Result()),
                  );
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {

  RoundIconButton({required this.icon,required this.onPresses});

  final IconData icon;
  final VoidCallback onPresses;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.purple,
      child: Icon(icon),
      onPressed:onPresses,


    );
  }
}

