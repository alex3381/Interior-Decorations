import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../statemanagement/controllers/home_controller.dart';



class InfoText extends StatelessWidget{

  final String type;
  final String text;
  InfoText({required this.type, required this.text});
  final HomeController homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type: ',
          style: TextStyle(
            color:homeController.isDarkMode.value
                ? const Color(0xFFFFFFFF)
                : Colors.black,
            fontSize: 16,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
          color: homeController.isDarkMode.value
                    ? const Color(0xEE78FFFF)

                    : Colors.blueGrey.shade700,
          // blueGrey.shade600,

              fontSize: 16,
            ),
          ),
        )
      ],
    ));
  }
}
