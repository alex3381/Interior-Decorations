import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../../../../reuseablewidgets/navBar/navBarLogo.dart';
import '../../../../../reuseablewidgets/snackbaricon/snackbar_icons.dart';
import '../../../../../utilities/animation/fadein_animation.dart';
import '../../../../../utilities/responsive/responsive.dart';
import '../../../../../utilities/themes/theme.dart';
import '../../../../controllers/constructor_controller.dart';
import '../../../../controllers/home_controller.dart';


class TabAppBar extends StatefulWidget {
  final ContructorServices contructorServices = Get.put(ContructorServices(screenSize: 'screenSize',));

  @override
  State<TabAppBar> createState() => _TabAppBarState();
}

class _TabAppBarState extends State<TabAppBar> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size ;
    return  PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child:Row(
            mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    const SizedBox(width: 5),
                    EntranceFader(
                        offset: const Offset(0, 0),
                        delay: const Duration(seconds: 1),
                        duration: const Duration(milliseconds: 800),
                        child: MaterialButton(
                          onPressed:  (){},
                          hoverColor: kPrimaryColor,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child:Neumorphic(
                              style: NeumorphicStyle(

                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                depth: 3,
                                lightSource: LightSource.topLeft,
                                color: homeController.isDarkMode.value
                                    ? Colors.black
                                    : const Color(0xFF18FFFF)

                                // '#41a7d2'.toColor(),
                              ),

                              child:Padding(
                                padding: const EdgeInsets.all(5),
                            child: Text("PRODUCTS",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                              ),),),))),
                    EntranceFader(
                        offset: const Offset(0, 0),
                        delay: const Duration(seconds: 1),
                        duration: const Duration(milliseconds: 800),
                        child: MaterialButton(
                            onPressed:  (){},
                            hoverColor: kPrimaryColor,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child:Neumorphic(
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.convex,
                                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                  depth: 3,
                                  lightSource: LightSource.topLeft,
                                  color: homeController.isDarkMode.value
                                      ? Colors.black
                                      : const Color(0xFF18FFFF),
                                  // '#41a7d2'.toColor(),
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.all(5),
                              child:Text("SERVICES",
                                 textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6,

                                ),),)))),
                    EntranceFader(
                        offset: const Offset(0, 0),
                        delay: const Duration(seconds: 1),
                        duration: const Duration(milliseconds: 800),
                        child: MaterialButton(
                          onPressed:  (){},
                          hoverColor: kPrimaryColor,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child:Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                depth: 3,
                                lightSource: LightSource.topLeft,
                                color: homeController.isDarkMode.value
                                    ? Colors.black
                                    : const Color(0xFF18FFFF),
                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(5),
                            child:Text("ABOUT",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                                // color: Colors.deepOrange,
                              ),),)))),
                    EntranceFader(
                        offset: const Offset(0, 0),
                        delay: const Duration(seconds: 1),
                        duration: const Duration(milliseconds: 800),
                        child: MaterialButton(
                          onPressed:  (){},
                          hoverColor: kPrimaryColor,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child:Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                depth: 3,
                                lightSource: LightSource.topLeft,
                                color: homeController.isDarkMode.value
                                    ? Colors.black
                                    : const Color(0xFF18FFFF),
                              ),
                              child:Padding(
                                padding: const EdgeInsets.all(5),
                            child:Text(
                              "LOGIN",

                               textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                              ),),),))),
                    SizedBox(
                      width: ResponsiveWidget.isSmallScreen(context)
                          ? 4
                          : ResponsiveWidget.isMediumScreen(context) ? 6 : 8,
                    ),
                    EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 1),
                      duration: const Duration(milliseconds: 800),
                      child : Container(
                          height: 60.0,
                          width: 110,
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            hoverColor: kPrimaryColor.withAlpha(150),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: const BorderSide(color: Colors.pink)),
                            onPressed: () {
                              // html.window.open(
                              //     'https://drive.google.com/file/d/1GF-wtbu2ob_Uxhw2In2QA8QiYi3XjCj1/view?usp=sharing',
                              //     "pdf");
                            },

                            child:Neumorphic(
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.convex,
                                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
                                  depth: 3,
                                  lightSource: LightSource.topLeft,
                                  color: homeController.isDarkMode.value
                                      ? Colors.black
                                      : const Color(0xFF18FFFF),
                                ),
                              child:Padding(
                                padding: const EdgeInsets.all(5),
                               child: Material(
                                 elevation: 0,
                            color: Colors.transparent,
                            child:InkWell(

                           child: Text(
                              "REGISTER",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                              ),

                              onTap: () =>  Get.toNamed('/second/',),
    ))),
                            ),

                            ),)

                      ),
                     SnackBarIcons(),
                    const SizedBox(width: 15),
                  ] ),

    );
  }
}

