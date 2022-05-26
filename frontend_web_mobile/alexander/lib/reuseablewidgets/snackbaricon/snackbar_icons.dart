import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../statemanagement/controllers/home_controller.dart';
import '../../statemanagement/controllers/homecardcontroller.dart';


class SnackBarIcons extends GetView<HomeController> {
  HomeController homeController = Get.put(HomeController());
  HomeCardController homeCardController = Get.put(HomeCardController());
  SnackBarIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),


     child: Row(
         children: [
      AnimatedBuilder(
          animation: controller.animationController,
          builder: (context, child) {
            return Transform.rotate(
              angle: controller.animationController.value * 1 * pi,
              child: child,
            );
          },
          child: Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
              depth: 3,
              lightSource: LightSource.topLeft,
              color: homeController.isDarkMode.value
                  ? Colors.black
                  : const Color(0xFF18FFFF),
            ),

            child: IconButton(
              icon: Icon(
                  controller.isDarkMode.value
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  size: 25,
                  color: controller.textColor),

              onPressed: () {
                controller.toggleTheme();

                if (Get.isOverlaysOpen) {
                  Get.back();
                }
                controller.changeAppTheme();

                controller.toggleTheme();
                Get.snackbar(
                  '',
                  '',
                  maxWidth: 300,

                  titleText: Text(
                    'App Theme Changed',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  messageText: Text(
                    'to ${controller.currentModeName.value.toUpperCase()}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  snackStyle: SnackStyle.FLOATING,
                  mainButton: TextButton(
                    style: TextButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      controller.changeAppTheme();
                      Get.back();
                    },
                    child: Text(
                      'Revert',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  backgroundColor: controller.isDarkMode.value
                      ? const Color(0xFFCDDC40)
                      : Colors.pink,
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
          )),
        const SizedBox(width: 15),
      SizedBox(
          height: 20,
          child: Center(
            child: AnimatedDefaultTextStyle(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                style: GoogleFonts.ubuntuMono(
                  fontSize: controller.fontSize,
                  color: controller.textColor,
                  fontWeight: FontWeight.w900,
                ),

                child: Text(controller.currentModeName.value.toUpperCase())),
          )



      )]


     ));
  }
}
