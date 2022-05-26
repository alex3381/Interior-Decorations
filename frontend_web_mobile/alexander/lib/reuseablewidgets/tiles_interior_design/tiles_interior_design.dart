import 'package:alexander/reuseablewidgets/neumophoric/neumophoric.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../statemanagement/controllers/home_controller.dart';
import '../../utilities/constant/constant.dart';
import '../../utilities/responsive/responsive.dart';

class TilesSlider extends StatelessWidget {
  late final Size screenSize;
  int index = 0;

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Neumophoric(
                    child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Text(tileslider[0],
                            style: GoogleFonts.ubuntu(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 7),
                              letterSpacing: 3,
                              fontWeight: FontWeight.w600,
                            )))),
                Neumophoric(
                    child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Text(tileslider[1],
                            style: GoogleFonts.ubuntu(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 7),
                              letterSpacing: 3,
                              fontWeight: FontWeight.w600,
                            )))),
              ],
            ))
        : PreferredSize(
            preferredSize: Size(screenSize.width, 1000),
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Neumophoric(
                        child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Text(tileslider[0],
                                style: GoogleFonts.ubuntu(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(fontSize: 12),
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.w600,
                                )))),
                    Neumophoric(
                        child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Text(tileslider[1],
                                style: GoogleFonts.ubuntu(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(fontSize: 12),
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.w600,
                                )))),
                  ],
                )));
  }
}
