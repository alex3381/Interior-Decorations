import 'package:alexander/statemanagement/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../statemanagement/controllers/homecardcontroller.dart';
import '../../utilities/themes/theme.dart';


class SocialMediaIconBtn extends StatelessWidget {
  final String icon;

  SocialMediaIconBtn(
      {Key? key, required this.icon,
      }) : super(key: key);

  final HomeController homeController = Get.put(HomeController());
  final  HomeCardController homeCardController = Get.put(HomeCardController());
  @override
  Widget build(BuildContext context) {


     return  Align(
       alignment: Alignment.topLeft,
        // margin: const EdgeInsets.only(left: 0.0, ),

          child: IconButton(
            icon: Image.network(
              icon,
              color: homeController.isDarkMode.value
                  ? const Color(0xFFFFFF00)
                  : Colors.pink,
              scale: 2,
            ),
            iconSize: 7,
            onPressed: () {},
            // launchURL(socialLink),



    ));
  }
}
