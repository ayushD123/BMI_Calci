import 'package:bmi_calci/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calci/style.dart';
import 'Brain.dart';
import 'package:page_transition/page_transition.dart';
import 'package:bmi_calci/result.dart';
const activecolor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool _lightIsOn = false;
  int height = 160;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          // Toggle light when tapped.
                          _lightIsOn = !_lightIsOn;
                        });
                      },
                      child: card(
                          _lightIsOn ? Color(0xFF111328) : Color(0xFF1D1E33),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.mars,
                                size: 80,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF8D8E98)),
                              )
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          // Toggle light when tapped.
                          _lightIsOn = !_lightIsOn;
                        });
                      },
                      child: card(
                          _lightIsOn ? Color(0xFF1D1E33) : Color(0xFF111328),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.venus,
                                size: 80,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF8D8E98)),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: card(
                    Color(0xFF1D1E33),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: ktextlayout,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$height',
                              style: kvaltext,
                            ),
                            Text(
                              'cm',
                              style: ktextlayout,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30),
                              overlayColor: Color(0x29EB1555)),
                          child: Slider(
                              value: height.toDouble(),
                              min: 100,
                              max: 220,
                              activeColor: Color(0xFFEB1555),
                              inactiveColor: Color(0xFF8D8E98),
                              //thumbColor: Colors.green,
                              onChanged: (double newval) {
                                setState(() {
                                  height = newval.round();
                                });
                              }),
                        )
                      ],
                    ))),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: card(
                          Color(0xFF1D1E33),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WEIGHT', style: ktextlayout),
                              Text(
                                '$weight',
                                style: kvaltext,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  roundbutt(
                                      icon: FontAwesomeIcons.minus,
                                      onpress: () {
                                        setState(() {
                                          weight--;
                                        });
                                      }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  roundbutt(
                                      icon: FontAwesomeIcons.plus,
                                      onpress: () {
                                        setState(() {
                                          weight++;
                                        });
                                      })
                                ],
                              )
                            ],
                          ))),
                  Expanded(
                      child: card(
                          Color(0xFF1D1E33),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE', style: ktextlayout),
                              Text(
                                '$age',
                                style: kvaltext,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  roundbutt(
                                      icon: FontAwesomeIcons.minus,
                                      onpress: () {
                                        setState(() {
                                          age--;
                                        });
                                      }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  roundbutt(
                                      icon: FontAwesomeIcons.plus,
                                      onpress: () {
                                        setState(() {
                                          age++;
                                        });
                                      })
                                ],
                              )
                            ],
                          ))),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {

                rresults calc=rresults(height, weight);
               // print(calc.getbmi());
                Navigator.push(context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: Results(bmi_ans: calc.getbmi(),bmi_resl: calc.getresult(),  bmi_int: calc.getintrep()

                      //  builder: (context) =>Results(bmi_ans: calc.getbmi(),bmi_resl: calc.getresult(),  bmi_int: calc.getintrep())

                        )));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text('CALCULATE',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    )),
                color: Color(0xFFEB1555),
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                height: 80,
              ),
            )
          ],
        ));
  }
}

class card extends StatelessWidget {
  card(@required this.c, this.mywid);

  late Color c;
//  late Widget cardChild;
  late Widget mywid;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: mywid,
      margin: EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: c, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class roundbutt extends StatelessWidget {
  roundbutt({required this.icon, required this.onpress});

  late final IconData icon;
  late final Function() onpress;
  //late final  Function() longpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 8,
      disabledElevation: 8,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      child: Icon(icon),

      onPressed: onpress,
      // onLongPress: longpress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
