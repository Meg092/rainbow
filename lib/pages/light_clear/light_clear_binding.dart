import 'package:get/get.dart';

import 'light_clear_logic.dart';

class LightClearBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LightClearLogic(),
      permanent: true,
    );
  }
}
