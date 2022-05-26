
import 'package:get/get.dart';

class ContructorServices extends GetxController {
  late final String screenSize;


  ContructorServices({ required this.screenSize,

  });


  @override
  void onInit() {
    print(screenSize);
  }
}
