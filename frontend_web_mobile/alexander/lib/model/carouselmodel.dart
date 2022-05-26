
class CarouselModel {
  final int id;
  final String title;
  final String  imageUrl;


  CarouselModel(
      {
        required this.id,
        required this.title,
        required this. imageUrl,

      });


  factory CarouselModel.fromJson(Map<String, dynamic> json) =>
      CarouselModel(
          id: json["id"],
          title: json["title"],
          imageUrl:json["imageUrl"],


      );

}