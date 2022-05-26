import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../statemanagement/controllers/home_controller.dart';
import '../../utilities/constant/constant.dart';
import '../../utilities/responsive/responsive.dart';


class Tiles extends StatelessWidget {
  late final Size screenSize;
  int index = 0;
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size;
    return  ResponsiveWidget.isSmallScreen(context)
        ? Padding(padding: const EdgeInsets.all(10),


     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Neumorphic(
            drawSurfaceAboveChild: true,
            curve: Neumorphic.DEFAULT_CURVE,
            duration: Neumorphic.DEFAULT_DURATION,
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
              depth: 4,
              lightSource: LightSource.topLeft,
              color: homeController.isDarkMode.value
                  ? Colors.black
                  : const Color(0xFF18FFFF),
            ),
            child: Padding(
                padding: const EdgeInsets.all(7),

                child:  Text(
                    tile[0],
                    style: GoogleFonts.ubuntu(
                      textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 8),
                      letterSpacing: 3,
                      fontWeight: FontWeight.w600,
                    )))),




        Neumorphic(
            drawSurfaceAboveChild: true,
            curve: Neumorphic.DEFAULT_CURVE,
            duration: Neumorphic.DEFAULT_DURATION,
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
              depth: 4,
              lightSource: LightSource.topLeft,
              color: homeController.isDarkMode.value
                  ? Colors.black
                  : const Color(0xFF18FFFF),
            ),
            child: Padding(
                padding: const EdgeInsets.all(7),

                child:  Text(
                    tile[1],
                    style: GoogleFonts.ubuntu(
                      textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 8),
                      letterSpacing: 3,
                      fontWeight: FontWeight.w600,
                    )))),
      ],
    )): PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
    child:     Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Neumorphic(
    drawSurfaceAboveChild: true,
    curve: Neumorphic.DEFAULT_CURVE,
    duration: Neumorphic.DEFAULT_DURATION,
    style: NeumorphicStyle(
    shape: NeumorphicShape.concave,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
    depth: 4,
    lightSource: LightSource.topLeft,
    color: homeController.isDarkMode.value
    ? Colors.black
        : const Color(0xFF18FFFF),
    ),
    child: Padding(
    padding: const EdgeInsets.all(7),

    child:  Text(
    tile[0],
    style: GoogleFonts.ubuntu(
    textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12),
    letterSpacing: 3,
    fontWeight: FontWeight.w600,
    )))),




    Neumorphic(
    drawSurfaceAboveChild: true,
    curve: Neumorphic.DEFAULT_CURVE,
    duration: Neumorphic.DEFAULT_DURATION,
    style: NeumorphicStyle(
    shape: NeumorphicShape.concave,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
    depth: 4,
    lightSource: LightSource.topLeft,
    color: homeController.isDarkMode.value
    ? Colors.black
        : const Color(0xFF18FFFF),
    ),
    child: Padding(
    padding: const EdgeInsets.all(7),

    child:  Text(
    tile[1],
    style: GoogleFonts.ubuntu(
    textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 12),
    letterSpacing: 3,
    fontWeight: FontWeight.w600,
    )))),
    ]));
  }
}
