


import 'package:alexander/statemanagement/bindings/initial_binding.dart';
import 'package:alexander/statemanagement/controllers/drawercontroller.dart';
import 'package:alexander/statemanagement/controllers/theme_controller.dart';
import 'package:alexander/statemanagement/routes/app_routes.dart';
import 'package:alexander/statemanagement/views/home/mobile/mobile_home.dart';
import 'package:alexander/statemanagement/views/home/tab/tab_home.dart';
import 'package:alexander/statemanagement/views/home/web/web_home.dart';
import 'package:alexander/utilities/responsive/responsive.dart';
import 'package:alexander/utilities/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/gestures.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('settings'); //
  Get.put<MyDrawerController>(MyDrawerController());

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(

      scrollBehavior: MyCustomScrollBehavior(),
      title: "Fatogun",
      debugShowCheckedModeBanner: false,

      themeMode: _themeController
          .themeStateFromHiveSettingBox, // Setting the ThemeMode from the Hive Setting Box
      theme: CustomTheme.lightTheme, // CustomThemeData for Light Theme
      darkTheme: CustomTheme.darkTheme,
      // initialRoute: '/',
      getPages: appRoutes(),
      initialBinding:InitialBinding(),
      home: ResponsiveWidget(
        largeScreen:  WebHome(),
        mediumScreen: const TabHome(),
        smallScreen: MobileHome()
      ),
    );


    //     initialRoute: '/',
    //     // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()), //like 404 page in web
    //     getPages: [
    //     GetPage(name: '/', page: () =>  const WebHome()),
    //      GetPage(name: '/second', page: () => const TabHome(),),
    // GetPage(name: '/third',page: () => MainScreen(),
    // transition: Transition.zoom








    // initialRoute: '/web',
    //   getPages: appRoutes(),
    //   initialBinding:InitialBinding(),

      // home:
      // ResponsiveWidget(
      //   largeScreen:MainScreen(),
      //   mediumScreen:TabHome() ,
      //   smallScreen: WebHome(),

      // )
    // );
  }
}



class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus, PointerDeviceKind.unknown

  };
}