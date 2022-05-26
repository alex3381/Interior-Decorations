import 'package:get/get.dart';

import '../../model/carouselmodel.dart';


class CorouselController extends GetxController {


  var product = List<CarouselModel>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    fetchCorousel();

  }

  void fetchCorousel() async {
    await Future.delayed(const Duration(seconds: 4));
    var responseResult = [
      CarouselModel(
          id: 0,
          title: "WALL",
          imageUrl: ("https://i.postimg.cc/xjFt5BBs/furniture.jpg"),


      ),
      CarouselModel(
          id: 1,
          title: "STUDIO",
        imageUrl: ("https://images.pexels.com/photos/276528/pexels-photo-276528.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),

      ),
      CarouselModel(
          id: 2,
          title: "LIVING ROOM",
          imageUrl: ("https://images.pexels.com/photos/3873951/pexels-photo-3873951.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
      ),

    ];

    product.value = responseResult;
  }
}
