import 'package:flutter/material.dart';

import '../../model/zoom_model.dart';

///////  Zoom List /////////


class HomeViewItems {
  static const blog = HomeViewItem("BLOG", Icons.home_filled);
  static const products = HomeViewItem("PRODUCTS", Icons.shopping_cart);
  static const service = HomeViewItem("SERVICE", Icons.phone_callback);
  static const login = HomeViewItem("LOGIN", Icons.lock);
  static const cart = HomeViewItem("CART", Icons.shopping_cart);
  static const contactus = HomeViewItem("CONTACT US", Icons.info_outline);
  static const rateus = HomeViewItem("RATE US", Icons.star_border);



  static const  all = <HomeViewItem>[
  blog,products,service,login,cart, contactus, rateus,

  ];
}



// Social Media
const kSocialIcons = [

  "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
  "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
  "https://img.icons8.com/android/480/ffffff/twitter.png",
  "https://img.icons8.com/metro/308/ffffff/linkedin.png",
  "https://img.icons8.com/material-rounded/384/ffffff/github.png",
  "https://img.icons8.com/ios-filled/500/ffffff/medium-monogram--v1.png"
      "https://img.icons8.com/fluency/48/000000/secured-letter.png",
];


final List<String> tile = [
  "FEATURED",
  "DESIGN",
];


/////////   interior design  ///////////
final List<String> tileslider = [
  "INTERIOR",
  "DESIGN",
];






//////// Carousel ///////////
final List<String> images= [
  ("assets/carousel/terraces.jpeg"),
  ("assets/carousel/master.jpeg"),
  ("assets/carousel/bedroom.jpeg"),

];


final List<String> products = [
  "TERRACES",
  "INTERIOR DESIGN",
  ("BEDROOM DESIGN"),
];




//Login and Signup
Color KPrimaryColor = const Color(0xFFFE4350);

enum Option{
  LogInWeb,

  SignUpWeb,

}