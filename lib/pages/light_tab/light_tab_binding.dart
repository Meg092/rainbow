import 'package:get/get.dart';

import '../light_first/light_first_logic.dart';
import '../light_second/light_second_logic.dart';
import '../light_third/light_third_logic.dart';
import 'light_tab_logic.dart';

class LightTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightTabLogic());
    Get.lazyPut(() => LightFirstLogic());
    Get.lazyPut(() => LightSecondLogic());
    Get.lazyPut(() => LightThirdLogic());
  }
}
