import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../../../reuseablewidgets/video_player/video_player_widget.dart';
import '../../../../utilities/themes/theme.dart';
import '../../../controllers/home_controller.dart';
import '../../../controllers/orientationcontroller.dart';
import '../login/login/loginscreenwidgets/action_button.dart';

class SignUpScreenLayout extends StatefulWidget {
  final Function onLogInSelected;
  // ({Key? key}) : super(key: key);
  SignUpScreenLayout({  required this.onLogInSelected,  });
      // :
        // super(key: key);
// final String?  onLogInSelected = Get.parameters['first'];
  final OrientationBuilders orientationBuilders =
      Get.put(OrientationBuilders());
  // final HomeController homeController = Get.put(HomeController());

  @override
  State<SignUpScreenLayout> createState() => _SignUpScreenLayoutState();
}

class _SignUpScreenLayoutState extends State<SignUpScreenLayout> {
  @override
  Widget build(BuildContext context) {
    final OrientationBuilders ctrl = Get.find();
    var screenSize = MediaQuery
        .of(context)
        .size;
    Size size = MediaQuery
        .of(context)
        .size;

    return Padding(
        padding: EdgeInsets.all(size.height > 770
            ? 64
            : size.height > 670
            ? 32
            : 16),
        child: Center(
          child: Neumorphic(
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
            child: Card(
              elevation: 7,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: size.height *
                    (size.height > 770
                        ? 0.7
                        : size.height > 670
                        ? 0.8
                        : 0.9),
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
                          Neumorphic(
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
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                ),
                              )),
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
                              hintText: 'Name',
                              labelText: 'Name',
                              suffixIcon: Icon(
                                Icons.person_outline,
                              ),
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
                          actionButton("Create Account"),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Have an account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(

                                onTap: () {
                                  // Get.toNamed('/register',);
                                  // widget.onLogInSelected();
                                },
                                child: Row(
                                  children: const [
                                    Text(
                                      "Log In",
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
          ),
        )


    );
  }}

