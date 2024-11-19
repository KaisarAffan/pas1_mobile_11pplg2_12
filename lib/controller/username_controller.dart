import 'package:get/get.dart';

class UsernameController extends GetxController {
  var username = ''.obs;

  void setUsername(String name) {
    username.value = name;
  }

  void clearUsername() {
    username.value = '';
  }
}
