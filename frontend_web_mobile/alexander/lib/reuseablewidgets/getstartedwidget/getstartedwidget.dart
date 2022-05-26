import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../statemanagement/controllers/home_controller.dart';
import '../../statemanagement/controllers/homecardcontroller.dart';
import '../../utilities/responsive/responsive.dart';
import '../neumophoric/neumophoric.dart';

class GetStarted extends StatelessWidget {
  GetStarted({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  final HomeCardController homeCardController = Get.put(HomeCardController());
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Neumophoric(
                  child: SizedBox(
                      width: 70.0,
                      height: 25.0,
                      child: Center(
                        child: MaterialButton(
                          onPressed: () {},
                          // () => Get.toNamed('/second'),
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Neumorphic(
                    style: NeumorphicStyle(
                      border: NeumorphicBorder(
                          color: homeController.isDarkMode.value
                              ? Colors.black
                              : const Color(0xFF18FFFF),
                          width: 2,
                          isEnabled: true),
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(50)),
                      depth: 2,
                      shadowDarkColor: homeController.isDarkMode.value
                          ? const Color(0xFF18FFFF)
                          : Colors.black,
                      lightSource: LightSource.topRight,
                      color: homeController.isDarkMode.value
                          ? Colors.greenAccent
                          : Colors.black,
                    ),
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/icon-fire.png",
                          height: 28,
                          color: homeController.isDarkMode.value
                              ? const Color(0xFFFFFF00)
                              : Colors.pink,
                        ))),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Now It Is Free....',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 8),
                )
              ],
            ))
        : PreferredSize(
            preferredSize: Size(screenSize.width, 1000),

                child: Row(children: [
                  Neumophoric(
                    child: SizedBox(
                        width: 70.0,
                        height: 35.0,
                        child: Center(
                          child: MaterialButton(
                            onPressed: () {},
                            // () => Get.toNamed('/second'),
                            child: Text(
                              "Get Started",
                              style: GoogleFonts.montserrat(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(fontSize: 8),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Neumorphic(
                      style: NeumorphicStyle(
                        border: NeumorphicBorder(
                            color: homeController.isDarkMode.value
                                ? Colors.black
                                : const Color(0xFF18FFFF),
                            width: 2,
                            isEnabled: true),
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(50)),
                        depth: 2,
                        shadowDarkColor: homeController.isDarkMode.value
                            ? const Color(0xFF18FFFF)
                            : Colors.black,
                        lightSource: LightSource.topRight,
                        color: homeController.isDarkMode.value
                            ? Colors.greenAccent
                            : Colors.black,
                      ),
                      child: Container(
                          height: 35,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/icon-fire.png",
                            height: 30,
                            color: homeController.isDarkMode.value
                                ? const Color(0xFFFFFF00)
                                : Colors.pink,
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Now It Is Free....',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 8),
                  )
                ]));
  }
}
