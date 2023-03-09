import 'package:daily_task/app/utils/ui/theme/snackbar_ui.dart';
import 'package:get/get.dart';

class ValidatorState {
  static String? email(value) {
    if (value == null || value.isEmpty) {
      SnackbarUi.error('Veuillez renseigner les champs requis');
      return 'Veuillez renseigner ce champ';
    } else if (!GetUtils.isEmail(value)) {
      SnackbarUi.error('Veuillez entrer un email valide');
      return 'Veuillez entrer un email valide';
    }
    return null;
  }

  static String? required(value) {
    if (value == null || value.isEmpty) {
      SnackbarUi.error('Veuillez renseigner les champs requis');
      return 'Veuillez renseigner ce champ';
    }
    return null;
  }

  static String? requiredExpireDate(value) {
    print(value.substring(0,2));
    if (value == null || value.isEmpty) {
      SnackbarUi.error('Veuillez renseigner les champs requis');
      return 'Veuillez renseigner ce champ';
    }else if(value.length != 5){
      SnackbarUi.error('Veuillez renseigner une date valide au format mm/yy');
      return 'Veuillez renseigner une date valide au format mm/yy';
    }else if(value[2] != '/'){
      SnackbarUi.error('Veuillez renseigner une date valide au format mm/yy');
      return 'Veuillez renseigner une date valide au format mm/yy';
    }else if(int.parse(value.substring(0,2)) > 12){
      SnackbarUi.error('Veuillez renseigner un mois valide du 01 au 12');
      return 'Veuillez renseigner une date valide au format mm/yy';
    }
      return null;
  }

  // static String? creditCard(value) {
  //   if (value == null || value.isEmpty) {
  //     SnackbarUi.error('Veuillez renseigner les champs requis');
  //     return 'Veuillez renseigner ce champ';
  //   }
  //   CreditCardValidator _ccValidator = CreditCardValidator();
  //   CCNumValidationResults ccNumResults = _ccValidator.validateCCNum(value);
  //   if(ccNumResults.isValid == false) {
  //     SnackbarUi.error('Veuillez entrer un numéro de carte de crédit valide');
  //     return 'Veuillez entrer un numéro de carte de crédit valide';
  //   }
  //   return null;
  // }
}
