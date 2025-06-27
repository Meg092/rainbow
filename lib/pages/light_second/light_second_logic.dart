import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:torch_light/torch_light.dart';

class LightSecondLogic extends GetxController {

  var isOpen = false.obs;

  void switchLight() async {
    try {
      final isTorchAvailable = await TorchLight.isTorchAvailable();
      if (isTorchAvailable) {
        if (isOpen.value) {
          await TorchLight.disableTorch();
          isOpen.value = false;
        } else {
          await TorchLight.enableTorch();
          isOpen.value = true;
        }
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: 'The flashlight function is unavailable');
    }
  }

}
