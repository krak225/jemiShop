import 'package:intl/intl.dart';

class FormatState {
  static String? date(value){
    final f = DateFormat('EEEE, d MMM yyyy', 'fr_FR');
    return f.format(DateTime.parse(value));
  }


  static String? number(value){
    var f = NumberFormat('###,###', 'fr_FR');
    try {
      return f.format(double.parse(value));
    } catch (e) {
      return f.format(value);
    }
  }

  
}