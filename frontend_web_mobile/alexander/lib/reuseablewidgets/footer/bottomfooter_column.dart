import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../statemanagement/controllers/home_controller.dart';



class BottomBarColumn extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  // final String heading;
  IconData iconData;
  final String s1;
  final String s2;
  // final String s3;

   BottomBarColumn({
    // required this.heading,
     required this.iconData,
    required this.s1,
    required this.s2,
    // required this.s3,
  });

  @override
  Widget build(BuildContext context) {
    return  Obx(() =>
      Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


        NeumorphicIcon(
          iconData,
          size: 48,
          style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            depth: 3,
            lightSource: LightSource.topLeft,
            color: homeController.isDarkMode.value
                ? Colors.white
                : Colors.black,
            // const Color(0xFF18FFFF),
          ),



          ),

          const SizedBox(
            height: 5,
          ),
          Text(
            s1,
            style: TextStyle(
              color:homeController.isDarkMode.value
                  ? const Color(0xFFFFFFFF)
                  : Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            s2,
            style: TextStyle(
              color:homeController.isDarkMode.value
                  ? const Color(0xFFFFFFFF)
                  : Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),



          // IconButton(
          //   icon: Icon(Icons.bluetooth),
          //   iconSize: 48,
          //   onPressed: () {},
          //   ),

        ],
      ),
    ));
  }
}
