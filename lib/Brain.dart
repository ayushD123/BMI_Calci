import 'dart:math';

import 'package:bmi_calci/result.dart';
class rresults{

  rresults(this.height,this.weight);
  late int height;
  late int weight;
   double? bmi;

  String? getbmi(){
    bmi=(weight/pow(height/100,2)) ;
    return bmi?.toStringAsFixed(1);
  }

  String getresult(){
    if(bmi!>25){
      return 'OVERWEIGHT';
    }else if(bmi!>18){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }

  String getintrep(){
    if(bmi!>25){
      return 'Do Regular Exercise';
    }else if(bmi!>18){
      return 'You Are All Okay';
    }else{
      return 'Eat Healthy Food ';
    }
  }

}