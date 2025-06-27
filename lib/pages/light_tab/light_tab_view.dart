import 'package:flashlight/pages/light_first/light_first_logic.dart';
import 'package:flashlight/pages/light_first/light_first_view.dart';
import 'package:flashlight/pages/light_second/light_second_view.dart';
import 'package:flashlight/pages/light_third/light_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'light_tab_logic.dart';

class LightTabPage extends GetView<LightTabLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [LightFirstPage(), LightSecondPage(), LightThirdPage()],
      ),
      bottomNavigationBar: Obx(() {
        return Visibility(
            visible: !controller.isOpen.value,
            child: Obx(() => _navLightBars()));
      }),
      floatingActionButton: SafeArea(child: Obx(() {
        return Visibility(
          visible: controller.currentIndex.value == 0,
          child: Image.asset(
            'assets/${controller.isOpen.value ? 'eyeOpen' : 'eyeClose'}.webp',
            fit: BoxFit.cover,
          ),
        );
      }).gestures(onTap: () {
        controller.isOpen.value = !controller.isOpen.value;
        LightFirstLogic firstLogic = Get.find();
        firstLogic.isOpen.value = !firstLogic.isOpen.value;
      })),
    );
  }

  Widget _navLightBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item0Grey.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item0Light.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item1Grey.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item1Light.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          label: 'Flashlight',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item2Grey.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item2Light.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) async {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
