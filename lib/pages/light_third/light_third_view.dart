import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'light_third_logic.dart';

class LightThirdPage extends GetView<LightThirdLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Version Information'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(
          titles[index],
          style: const TextStyle(color: Colors.white),
        ),
        const Text("1.0.0",style: TextStyle(color: Colors.white),)
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: <Widget>[
          Container(
            padding: const EdgeInsets.all(12),
            child: <Widget>[_item(0, context)].toColumn(
                separator: Divider(
              height: 15,
              color: Colors.grey.withOpacity(0.3),
            )),
          ).decorated(
              color: const Color(0xff484848),
              borderRadius: BorderRadius.circular(12))
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
      ).marginAll(15)),
    ));
  }
}
