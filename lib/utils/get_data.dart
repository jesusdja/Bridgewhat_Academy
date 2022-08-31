
import 'package:academybw/config/academy_colors.dart';
import 'package:academybw/services/shared_preferences.dart';
import 'package:flutter/material.dart';

String numberFormat(double x) {
  List<String> parts = x.toString().split('.');
  RegExp re = RegExp(r'\B(?=(\d{3})+(?!\d))');

  parts[0] = parts[0].replaceAll(re, '.');
  // if (parts.length == 1) {
  //   parts.add('00');
  // } else {
  //   parts[1] = parts[1].padRight(2, '0').substring(0, 2);
  // }
  return parts.join(',');
}

Map<int,String> mapABC = {
  1 : 'A',
  2 : 'B',
  3 : 'C',
  4 : 'D',
  5 : 'E',
  6 : 'F',
  7 : 'G',
  8 : 'H',
  9 : 'I',
  10 : 'J',
  11 : 'K',
  12 : 'L',
  13 : 'M',
  14 : 'N',
  15 : 'Ñ',
  16 : 'O',
  17 : 'P',
  18 : 'Q',
  19 : 'R',
  20 : 'S',
  21 : 'T',
  22 : 'U',
  23 : 'V',
  24 : 'W',
  25 : 'X',
  26 : 'Y',
  27 : 'Z',
};

String getToken(){
  return 'Bearer ${SharedPreferencesLocal.prefs.getString('AcademyToken') ?? ''}';
}

List<Color> colorsListQuestionUnion = [
  Color(0xF0A6061A),
  Colors.cyan,
  Color(0xF095C4E9),
  Colors.amber,
  Colors.teal,
  Colors.green,
  Color(0xF0958E6F),
  Colors.deepPurpleAccent,
  Colors.lightBlue,
  Color(0xF0E1E1E1),
  Color(0xF0958E6F),
];

enum TypeQuestion {simple,multi,union,order}

List<Map<String,dynamic>> getListQuestionQuiz () => [
  {
    'id' : 1,
    'header' : 'Introductory',
    'title' : 'How many stages of client engagement are included in the Bridgewhat 20 Levers of Growth framework?',
    'questions' : [
      '4','5','10','20'
    ],
    'result' : '5',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 2,
    'header' : 'Introductory',
    'title' : 'How many stages of client engagement are included in the Bridgewhat 20 Levers of Growth framework?',
    'questions' : [
      '4','5','10','20'
    ],
    'result' : '5',
    'answered' : '',
    'type' : TypeQuestion.multi,
  },
  {
    'id' : 3,
    'header' : 'Introductory',
    'title' : 'How many stages of client engagement are included in the Bridgewhat 20 Levers of Growth framework?',
    'questions' : [
      ['Attraction','Retention','Referrals','ARPU','Acquisition'],
      ['Revenue','Advocacy','Attention','Loyalty','Activation'],
    ],
    'result' : {'Attraction' : 'Attention','Retention' : 'Loyalty','Referrals' : 'Advocacy','ARPU' : 'Revenue','Acquisition' : 'Activation', },
    'answered' : {},
    'type' : TypeQuestion.union,
  },
  {
    'id' : 4,
    'header' : 'Introductory',
    'title' : 'How many stages of client engagement are included in the Bridgewhat 20 Levers of Growth framework?',
    'questions' : [
      '4','5','10','20'
    ],
    'result' : '5',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 5,
    'header' : 'Introductory',
    'title' : 'How many stages of client engagement are included in the Bridgewhat 20 Levers of Growth framework?',
    'questions' : [
      '4','5','10','20'
    ],
    'result' : '5',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
  {
    'id' : 6,
    'header' : 'Introductory',
    'title' : 'How many stages of client engagement are included in the Bridgewhat 20 Levers of Growth framework?',
    'questions' : [
      '4','5','10','20'
    ],
    'result' : '5',
    'answered' : '',
    'type' : TypeQuestion.simple,
  },
];

