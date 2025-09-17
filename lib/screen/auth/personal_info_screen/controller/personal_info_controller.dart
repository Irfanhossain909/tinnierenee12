import 'package:get/get.dart';

enum YesNo { yes, no }

class PersonalInfoController extends GetxController {
  final Rxn<YesNo> workedInChildCare = Rxn<YesNo>();

  void setWorkedInChildCare(YesNo? value) {
    workedInChildCare.value = value;
  }
}
