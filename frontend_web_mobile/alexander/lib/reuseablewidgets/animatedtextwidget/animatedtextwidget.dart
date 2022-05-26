import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../statemanagement/controllers/home_controller.dart';
import '../neumophoric/neumophoric.dart';

class AnimatedTextWidget extends StatelessWidget {
  AnimatedTextWidget({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final Size screenSize;
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
         return Padding(
           padding: const EdgeInsets.all(2),

           child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


             Neumophoric(

                  child: Icon(
                    size:14,
                    Icons.play_arrow_rounded,
                    color: homeController.isDarkMode.value
                        ?  const Color(0xFFFFFF00)
                        : Colors.pink,
                  )
             ),

              Expanded(
              child: Container(
                width: 250.0,
                margin:const EdgeInsets.only(left: 14, top: 3),
                child: DefaultTextStyle(
                   style: GoogleFonts.montserrat(
            // color: Colors.white,
            textStyle: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 7),
            letterSpacing: 3,
            fontWeight: FontWeight.w300),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Lets Take You On A journey ...'),
                      TypewriterAnimatedText('Into The World Of Fashion ...'),
                      TypewriterAnimatedText('Were Class Meets Design ...'),

                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),

              ),

            ],
          ));

}}
