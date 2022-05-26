import 'dart:ui';

class HomeCardProduct {
  final int id;
  final String title;
  final Color cardColor1;
  final Color  cardColor2;
  final productDescription;
  final double price;
  final String  imageUrl;
  final String imageUrl2;

  HomeCardProduct(
      {
        required this.id,
        required this.title,
        required this.cardColor2,
        required this.cardColor1,
        required this.productDescription,
        required this.price,
        required this. imageUrl,
        required this.imageUrl2,
      });


  factory HomeCardProduct.fromJson(Map<String, dynamic> json) =>
      HomeCardProduct(
    id: json["id"],
    title: json["title"],
    cardColor1: json["cardColor1"],
    cardColor2: json["cardColor2"],
    productDescription:json["productDescription"],
    price:json["price"],
          imageUrl:json["imageUrl"],
          imageUrl2:json["imageUrl2"]

  );

}