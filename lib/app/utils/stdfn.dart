import 'package:intl/intl.dart';

class Stdfn {

  static String toAmount(int number){
    var formatter = new NumberFormat("#,###");
    return formatter.format(number).replaceAll(",", " ");
  }

}
