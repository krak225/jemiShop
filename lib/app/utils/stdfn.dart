import 'package:daily_task/app/features/dashboard/model/MyCommande.dart';
import 'package:intl/intl.dart';

class Stdfn {

  static String toAmount(int number){
    var formatter = new NumberFormat("#,###");
    return formatter.format(number).replaceAll(",", " ");
  }

  static String dateFromDB(String dateStr) {
    DateTime date = DateTime.parse(dateStr);

    String formattedDate = DateFormat('dd/MM/yyyy à HH:mm').format(date);

    return formattedDate;
  }

  static sumTotalCommandes(Iterable<MyCommande> commandes) {
    int total = 0;

    for(MyCommande commande in commandes){
      total += int.parse(commande.commandeMontantTotal!);
    }

    return total;

  }

}
