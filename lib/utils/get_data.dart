
import 'package:academybw/services/shared_preferences.dart';

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