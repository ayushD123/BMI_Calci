import 'package:flutter/material.dart';
import 'first.dart';
class Results extends StatelessWidget {
  Results({required this.bmi_resl,required this.bmi_ans,required this.bmi_int});
   late final String? bmi_ans;
   late final String bmi_int;
   late final String bmi_resl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,

              child: Text('Your Result',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,

              ),),
            ),
          ),
          Expanded(
            flex: 5,
            child: card(
                Color(0xFF1D1E33),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(bmi_resl,
                  style: TextStyle(
                    color: Color(0xFF24D876),
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),),
                  Text('$bmi_ans',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 100
                  ),),
                  Text(bmi_int,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22
                  ),),

                ],
              )
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text('RE-CALCULATE',
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
      ),
    );
  }
}
