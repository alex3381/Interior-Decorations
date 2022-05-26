import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../statemanagement/controllers/constructor_controller.dart';
import '../../statemanagement/controllers/home_controller.dart';
import '../../utilities/responsive/responsive.dart';
import '../neumophoric/neumophoric.dart';

class TitlePage extends StatelessWidget {
  final ContructorServices contructorServices =
      Get.put(ContructorServices(screenSize: 'screenSize'));
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: const EdgeInsets.all(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Neumophoric(
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            width: 70,
                            height: 20,
                            child: Text(
                              "Fatogun",
                              style: GoogleFonts.montserrat(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(fontSize: 12),
                                fontWeight: FontWeight.w700,
                              ),
                            )))),
                const SizedBox(
                  height: 20,
                ),
                Neumophoric(
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                            width: 70,
                            height: 20,
                            child: Text(
                              "Veronica",
                              style: GoogleFonts.montserrat(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(fontSize: 12),
                                fontWeight: FontWeight.w300,
                              ),
                            )))),
              ],
            ))
        : PreferredSize(
            preferredSize: Size(screenSize.width, 1000),
            child: Padding(
                padding: const EdgeInsets.all(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Neumophoric(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                                width: 70,
                                height: 20,
                                child: Text(
                                  "Fatogun",
                                  style: GoogleFonts.montserrat(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(fontSize: 12),
                                    fontWeight: FontWeight.w700,
                                  ),
                                )))),
                    const SizedBox(
                      height: 20,
                    ),
                    Neumophoric(
                        child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                                width: 70,
                                height: 20,
                                child: Text(
                                  "Veronica",
                                  style: GoogleFonts.montserrat(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(fontSize: 12),
                                    fontWeight: FontWeight.w300,
                                  ),
                                )))),
                  ],
                )));
  }
}
