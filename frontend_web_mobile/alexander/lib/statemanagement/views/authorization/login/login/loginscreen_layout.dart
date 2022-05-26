import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../../../../reuseablewidgets/video_player/video_player_widget.dart';
import '../../../../../utilities/themes/theme.dart';
import '../../../../controllers/constructor_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../controllers/homecardcontroller.dart';
import '../../../../controllers/orientationcontroller.dart';
import 'loginscreenwidgets/action_button.dart';


class LoginScreenLayout extends StatefulWidget {
  final Function onSignUpSelected;
  LoginScreenLayout({required this.onSignUpSelected,  });




  final OrientationBuilders orientationBuilders = Get.put(OrientationBuilders());
  final HomeController homeController = Get.put(HomeController());
  final HomeCardController homeCardController = Get.put(HomeCardController());
  final Controller= Get.put( ContructorServices(screenSize: 'screenSize',  ));

  @override
  State<LoginScreenLayout> createState() => _LoginScreenLayoutState();
}

class _LoginScreenLayoutState extends State<LoginScreenLayout> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    Size size = MediaQuery.of(context).size;


    return Padding(
      padding: EdgeInsets.all(size.height > 770 ? 64 : size.height > 670 ? 32 : 16),
      child: Center(
        child:Neumorphic(
          drawSurfaceAboveChild: true,
          curve: Neumorphic.DEFAULT_CURVE,
          duration: Neumorphic.DEFAULT_DURATION,
          style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(15)),
            depth: 4,
            lightSource: LightSource.topLeft,
            color: homeController.isDarkMode.value
                ? Colors.black
                : const Color(0xFF18FFFF),
          ),
          child: Card(
            elevation: 7,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                )),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: size.height * (size.height > 770 ? 0.7 : size.height > 670 ? 0.8 : 0.9),
              width: 500,
              color: homeController.isDarkMode.value
                  ? Colors.black
                  : const Color(0xFF18FFFF),

            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: size.width / 5,
                          height: size.width / 13,
                          child: Neumorphic(
                              drawSurfaceAboveChild: true,
                              curve: Neumorphic.DEFAULT_CURVE,
                              duration: Neumorphic.DEFAULT_DURATION,
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(17)),
                                depth: 4,
                                lightSource: LightSource.topLeft,
                                color: homeController.isDarkMode.value
                                    ? Colors.black
                                    : const Color(0xFF18FFFF),
                              ),
                              child: Center(
                                  child: Text(
                                    "LOG IN",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[800],
                                    ),
                                  )))),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        width: 30,
                        child: Divider(
                          color: kPrimaryColor,
                          thickness: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: Icon(
                            Icons.lock_outline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      actionButton("Log In"),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "No account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(

                            onTap: () {
                              Get.toNamed('/login',);
                                widget.onSignUpSelected();
                            },
                            child: Row(
                              children: const [
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )

          )
    );

  }
}
