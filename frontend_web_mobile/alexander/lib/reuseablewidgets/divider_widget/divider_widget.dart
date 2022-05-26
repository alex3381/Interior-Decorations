import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../statemanagement/controllers/home_controller.dart';
import '../neumophoric/neumophoric.dart';
import '../video_player/video_player_widget.dart';



class DividerWidget extends StatelessWidget {
  DividerWidget({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Neumophoric(

      child: Divider(
          color: homeController.isDarkMode.value
              ? Colors.black
              : const Color(0xFF18FFFF),
        thickness: 2,
      )
    ));
  }
}
