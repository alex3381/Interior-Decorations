import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../statemanagement/controllers/home_controller.dart';
import 'package:get/get.dart';

class Neumophoric extends StatelessWidget {
  final Widget child;

   Neumophoric({Key? key,  required this.child}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return  Neumorphic(
        style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
    depth: 3,
    lightSource: LightSource.topLeft,
    color: homeController.isDarkMode.value
    ? Colors.black
        : const Color(0xFF18FFFF),
    ),
      child: child,

    );
  }
}
