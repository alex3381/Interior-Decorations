


import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrientationBuilders extends GetxController {
  RxBool isLandscape = false.obs;

  Future<void> setLandscape() async {
    if (isLandscape.isTrue) {
      await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
      update();
    }
  }

  Future<void> setPortrait() async {
    if (isLandscape.isFalse) {
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      update();
    }
  }
}