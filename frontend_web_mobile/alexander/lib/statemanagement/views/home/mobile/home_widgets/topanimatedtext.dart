import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controllers/home_controller.dart';
import '../../../../controllers/homecardcontroller.dart';

class TopAnimatedText extends StatelessWidget {
   TopAnimatedText({Key? key, required this.screenSize}) : super(key: key);
  // final HomeController homeController = Get.put(HomeController());
  final HomeCardController homeCardController = Get.put(HomeCardController());
  final Size screenSize;
  @override
  Widget build(BuildContext context) {


         return SizedBox(
             height: 20,
           child:Padding(
           padding: const EdgeInsets.all(5),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:   CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Flexible(
              child:Text(
                'START',
                style: TextStyle(
                    fontSize: 7.0, fontWeight: FontWeight.w100),
              )),
              const SizedBox(width: 20.0, height: 20.0),
              DefaultTextStyle(
                style: GoogleFonts.ubuntu(
                  textStyle: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 7),
                  letterSpacing: 3,
                  fontWeight: FontWeight.w900,

                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  animatedTexts: [
                    RotateAnimatedText(
                      'NEW OUTLOOK',
                    ),
                    RotateAnimatedText('BEST COLLECTION'),
                    RotateAnimatedText('AWESOME DESIGN'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ],



    )));
  }
}
