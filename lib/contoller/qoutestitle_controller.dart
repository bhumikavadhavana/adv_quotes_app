import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TitleController extends GetxController {
  final RxString categoryName = ''.obs;

  void setCategoryName(String name) {
    categoryName.value = name;
  }
}
