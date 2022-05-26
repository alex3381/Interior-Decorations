import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../statemanagement/controllers/home_controller.dart';
import '../../utilities/themes/theme.dart';


class NavBarLogo extends StatelessWidget {
  NavBarLogo({Key? key, required this.height}) : super(key: key);
  late double height;
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
return Padding(
    padding: const EdgeInsets.all(15),

  child:Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                  depth: 7,
                  lightSource: LightSource.bottom,
                  color: homeController.isDarkMode.value
                      ? Colors.black
                      : const Color(0xFF18FFFF),
                ),

                child: Padding(
                    padding: const EdgeInsets.all(4),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("< ",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1),
                        const Text(
                          "Alexander",
                          style: TextStyle(
                            fontFamily: "Agustina",
                            fontSize: 17,
                          ),
                        ),
                        Text(
                            MediaQuery.of(context).size.width >= 1000
                                ? " />\t\t"
                                : " />",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1)
                      ],
                    ))));
  }
}
