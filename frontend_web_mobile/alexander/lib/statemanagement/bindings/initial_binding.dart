import 'package:get/get.dart';

import '../controllers/animated_theme_controller.dart';
import '../controllers/carouselcontroller.dart';
import '../controllers/constructor_controller.dart';
import '../controllers/drawercontroller.dart';
import '../controllers/homecardcontroller.dart';
import '../controllers/initial_controller.dart';
import '../controllers/orientationcontroller.dart';
import '../controllers/scroll_notification_controller.dart';
import '../controllers/theme_controller.dart';


class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<InitialController>(() => InitialController());
    Get.lazyPut<HomeCardController>(() => HomeCardController());
    Get.lazyPut<OrientationBuilders>(() => OrientationBuilders());
    // Get.lazyPut<ScrollUpdate>(() => ScrollUpdate());
    Get.lazyPut<ScrollNotificationController>(() => ScrollNotificationController());
    Get.lazyPut<MyDrawerController>(() => MyDrawerController());
    Get.lazyPut< ContructorServices>(() =>  ContructorServices(screenSize: 'screenSize',), );
    Get.lazyPut<CorouselController>(() => CorouselController());
// Get.lazyPut<HomeController>(() => HomeController());

  }
}
