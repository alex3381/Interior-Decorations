import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/product.dart';


class HomeCardController extends GetxController {

  var products = List<HomeCardProduct>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeCard();

  }

  void fetchHomeCard() async {
    await Future.delayed(const Duration(seconds: 4));
    var responseResult = [
      HomeCardProduct(
        id: 0,
        title: "WALL",
        cardColor1: const Color(0xFFDECB9C),
        cardColor2: const Color(0xFF80CBC4),
        productDescription: "10% discount offer",
        price: 120,
imageUrl: ("https://images.pexels.com/photos/462235/pexels-photo-462235.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
        imageUrl2: ("https://images.pexels.com/photos/462235/pexels-photo-462235.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")

        // ("assets/images/wall-decor.jpg"),
        // image2: ("assets/images/wall-decor.jpg")
      ),
      HomeCardProduct(
        id: 1,
        title: "STUDIO",
        cardColor1: const Color(0xFFFFC5C5),
        cardColor2: const Color(0xFF455668),
        productDescription: "10% discount offer",
        price: 200,
        imageUrl: ("https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
          imageUrl2: ("https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260")
      ),
      HomeCardProduct(
        id: 2,
        title: "LIVING ROOM",
        cardColor1: const Color(0xFFB2FF59),
        cardColor2: const Color(0xff37e3d5),
        productDescription: "10% discount offer",
        price: 150,
        imageUrl: ("https://images.pexels.com/photos/3873951/pexels-photo-3873951.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          imageUrl2: ("https://images.pexels.com/photos/3873951/pexels-photo-3873951.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
      ),
      HomeCardProduct(
        id: 3,
        title: "LOBBY",
        cardColor1: const Color(0xFFB2FF59),
        cardColor2: const Color(0xFFCDDC39),
        productDescription: "10% discount offer",
        price: 150,
        imageUrl: ("https://images.pexels.com/photos/7061393/pexels-photo-7061393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          imageUrl2: ("https://images.pexels.com/photos/7061393/pexels-photo-7061393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
      ),
      //
      HomeCardProduct(
          id: 4,
          title: "LIVING ROOM",
          cardColor1: const Color(0xFFB2FF59),
          cardColor2: const Color(0xFFCDDC39),
          productDescription: "10% discount offer",
          price: 150,
          imageUrl: ("https://images.pexels.com/photos/7535056/pexels-photo-7535056.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          imageUrl2: ("https://images.pexels.com/photos/7535056/pexels-photo-7535056.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
      ),

      HomeCardProduct(
          id: 5,
          title: "LOBBY",
          cardColor1: const Color(0xFFB2FF59),
          cardColor2: const Color(0xFFCDDC39),
          productDescription: "10% discount offer",
          price: 150,
          imageUrl: ("https://images.pexels.com/photos/7061393/pexels-photo-7061393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          imageUrl2: ("https://images.pexels.com/photos/7061393/pexels-photo-7061393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
      ),
      HomeCardProduct(
          id: 6,
          title: "LOBBY",
          cardColor1: const Color(0xFFB2FF59),
          cardColor2: const Color(0xFFCDDC39),
          productDescription: "10% discount offer",
          price: 150,
          imageUrl: ("https://images.pexels.com/photos/7061393/pexels-photo-7061393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          imageUrl2: ("https://images.pexels.com/photos/7061393/pexels-photo-7061393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
      ),
      HomeCardProduct(
          id: 7,
          title: "LOBBY",
          cardColor1: const Color(0xFFB2FF59),
          cardColor2: const Color(0xFFCDDC39),
          productDescription: "10% discount offer",
          price: 150,
          imageUrl: ("https://images.pexels.com/photos/7061393/pexels-photo-7061393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          imageUrl2: ("https://images.pexels.com/photos/7061393/pexels-photo-7061393.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
      ),
    ];

    products.value = responseResult;
  }
}
