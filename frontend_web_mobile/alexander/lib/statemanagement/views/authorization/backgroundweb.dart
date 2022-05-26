import 'package:alexander/statemanagement/views/authorization/signup/signupscreen_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../reuseablewidgets/video_player/video_player_widget.dart';
import '../../../utilities/constant/constant.dart';
import '../../../utilities/responsive/responsive.dart';
import '../../controllers/constructor_controller.dart';
import 'login/login/loginscreen_layout.dart';

class BackGround extends StatefulWidget {
  @override
  State<BackGround> createState() => _BackGroundState();
}
class _BackGroundState extends State<BackGround> {

  final Controller= Get.put( ContructorServices(screenSize: 'screenSize',  ));
  Option selectedOption = Option.LogInWeb;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);

    return Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: homeController.isDarkMode.value
              ? Colors.black
              : const Color(0xFF18FFFF),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: homeController.isDarkMode.value
                  ? Colors.black.withOpacity(0.2)
                  : const Color(0xFF18FFFF).withOpacity(0.2),
              // color: Color(0xFF18FFFF).withOpacity(0.2),
            ),
          ],

        ),

        child: Stack(children: [
           Row(
            children: [
              Container(
                height: double.infinity,
                width: size.width / 2,
                  color: homeController.isDarkMode.value
                      ? Colors.black
                      : const Color(0xFF18FFFF),

              ),
              Container(
                height: double.infinity,
                width: size.width / 2,
                color: Colors.pink.shade400,
              )
            ],
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                "Wellcome",
                style: Theme.of(context).textTheme.headline2,

                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.all(32),
                 child: ResponsiveWidget.isSmallScreen(context)
                      ? Container():

                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's Kick Now !",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        "It's easy and takes less than 30 secondes !",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 17),
                      )
                    ],
                  ))),


          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
              Material(
                  elevation: 0,
                  color: Colors.transparent,
                  child:InkWell(
    onTap: () =>   Get.toNamed('/', preventDuplicates:false),
                  child:Text(
                    "HOME",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontSize: 15),

                  ))),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Icon(
                Icons.menu,
                color:Color(0xFF18FFFF),
                size: 28,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.copyright,
                    color: Colors.pink,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Copyright 2022",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.blueGrey, fontSize: 15),
                  ),

                ],
              ),
            ),
          ),


          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1100),

            //Animation 2
            transitionBuilder: (widget, animation) =>
                ScaleTransition(scale: animation, child: widget),

            child: selectedOption == Option.LogInWeb
                ? LoginScreenLayout(

              onSignUpSelected: () {
                setState(() {
                  selectedOption = Option.SignUpWeb;
                });
              },
            )
                : SignUpScreenLayout(
              onLogInSelected: () {
                setState(() {
                  selectedOption = Option.LogInWeb;
                });
              },
            ),
          )
    ]));
  }
}
