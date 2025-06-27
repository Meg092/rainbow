import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'light_second_logic.dart';

class LightSecondPage extends GetView<LightSecondLogic> {
  const LightSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Obx(() {
              return Image.asset(
                'assets/${controller.isOpen.value
                    ? 'lightOpen'
                    : 'lightClose'}.webp',
                fit: BoxFit.cover,
              ).gestures(onTap: () {
                controller.switchLight();
              });
            }),
          )),
    );
  }
}
