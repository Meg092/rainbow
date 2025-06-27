import 'package:get/get.dart';

import 'light_refresh_logic.dart';

class LightRefreshBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LightRefreshLogic());
  }
}
