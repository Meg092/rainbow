import 'package:flashlight/pages/light_first/light_first_binding.dart';
import 'package:flashlight/pages/light_first/light_first_view.dart';
import 'package:flashlight/pages/light_refresh/light_refresh_binding.dart';
import 'package:flashlight/pages/light_refresh/light_refresh_view.dart';
import 'package:flashlight/pages/light_second/light_second_binding.dart';
import 'package:flashlight/pages/light_second/light_second_view.dart';
import 'package:flashlight/pages/light_tab/light_tab_binding.dart';
import 'package:flashlight/pages/light_tab/light_tab_view.dart';
import 'package:flashlight/pages/light_third/light_third_binding.dart';
import 'package:flashlight/pages/light_third/light_third_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = Colors.black;
Color bgColor = const Color(0xff232323);

List<Color> lightColors = const [
  Color(0xffff0000),
  Color(0xffffc400),
  Color(0xffebff00),
  Color(0xff00ffff),
  Color(0xff004eff),
  Color(0xffff00e2),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages:Rainbow,
      initialRoute: '/light_tab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          unselectedItemColor: Colors.white.withOpacity(0.6),
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          selectedItemColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Rainbow = [
  GetPage(name: '/light_first', page: () => LightFirstPage(), binding: LightFirstBinding()),
  GetPage(name: '/light_second', page: () => LightSecondPage(), binding: LightSecondBinding()),
  GetPage(name: '/light_refresh', page: () => const LightRefreshView(), binding: LightRefreshBinding()),
  GetPage(name: '/light_third', page: () => LightThirdPage(), binding: LightThirdBinding()),
  GetPage(name: '/light_tab', page: () => LightTabPage(), binding: LightTabBinding()),
];