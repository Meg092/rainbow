import 'package:flashlight/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'light_first_logic.dart';

class LightFirstPage extends GetView<LightFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: controller.selected.value != 6
                  ? lightColors[controller.selected.value]
                      .withOpacity(controller.opacity.value)
                  : null,
              gradient: controller.selected.value == 6
                  ? LinearGradient(colors: [
                      const Color(0xffff0000)
                          .withOpacity(controller.opacity.value),
                      const Color(0xffffa700)
                          .withOpacity(controller.opacity.value),
                      const Color(0xff00ff4e)
                          .withOpacity(controller.opacity.value),
                      const Color(0xff3b00ff)
                          .withOpacity(controller.opacity.value),
                      const Color(0xffff0093)
                          .withOpacity(controller.opacity.value)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                  : null),
          child: SafeArea(
              child: <Widget>[
            Obx(() {
              return Visibility(
                visible: !controller.isOpen.value,
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, mainAxisSpacing: 10),
                      itemCount: 7,
                      itemBuilder: (_, index) {
                        return Obx(() {
                          return Container(
                            decoration: BoxDecoration(
                                color: index != 6
                                    ? lightColors[index]
                                    : Colors.white,
                                gradient: index == 6
                                    ? const LinearGradient(
                                        colors: [
                                            Color(0xffff0000),
                                            Color(0xffffa700),
                                            Color(0xff00ff4e),
                                            Color(0xff3b00ff),
                                            Color(0xffff0093)
                                          ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)
                                    : null,
                                border: controller.selected.value == index
                                    ? Border.all(
                                        color: Colors.white, width: 2)
                                    : null,
                                borderRadius: BorderRadius.circular(10)),
                          ).gestures(onTap: () {
                            controller.selected.value = index;
                          });
                        });
                      }),
                ),
              );
            }),
            Expanded(
              child: Obx(() {
                return Visibility(
                  visible: !controller.isOpen.value,
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 10,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white.withOpacity(0.49),
                      thumbColor: Colors.white,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 12,
                        disabledThumbRadius: 12,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 25,
                      ),
                    ),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Obx(() {
                        return Slider(
                            value: controller.opacity.value,
                            min: 0,
                            max: 1,
                            onChanged: (v) {
                              controller.opacity.value = v;
                            });
                      }),
                    ),
                  ),
                );
              }),
            )
          ].toColumn().marginAll(15)),
        );
      }),
    );
  }
}
