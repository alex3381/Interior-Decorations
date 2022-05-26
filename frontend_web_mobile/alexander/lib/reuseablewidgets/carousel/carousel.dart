
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:panorama/panorama.dart';

import '../../utilities/constant/constant.dart';


















class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController _pageController;
  int index = 0;
  final int _current = 0;
  int _activePageIndex = 0;
  bool end = false;

  final List _isHovering = [false, false, false, false, false, false, false];
  final List _isSelected = [true, false, false, false, false, false, false];



  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_activePageIndex == images.length ) {
        end = true;
      } else if (_activePageIndex  == 0) {
        end = false;
      }

      if (end == false) {
        _activePageIndex ++;
      } else {
        _activePageIndex --;
      }

      _pageController.animateToPage(
        _activePageIndex ,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    }
    );

  }






  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return

      Padding(padding:const EdgeInsets.all(15),
          child:
          Column(
              children: [
                Stack(
                    children: [


                      SizedBox(
                          height: 400,
                          child: PageView.builder(
                              allowImplicitScrolling: true,
                              physics: const AlwaysScrollableScrollPhysics(),

                              pageSnapping: true,
                              clipBehavior: Clip.antiAlias,
                              controller: _pageController,
                              itemCount:images.length,
                              onPageChanged: ( int index ) {
                                setState(() {
                                  _activePageIndex = index;
                                  // _activePageIndex = _current;
                                });
                              },
                              itemBuilder:(context,pagePosition,) {
                                // (c, i) {
                                return AnimatedScale(

                                  scale: _activePageIndex == pagePosition ? 1 : 0.85,
                                  duration: const Duration(milliseconds: 300),
                                  child:
                                  Container(

                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1),
                                        ),
                                      ],
                                    ),

                                    child: SizedBox(
                                      // height: 200,
                                      // width: 250,
                                      child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20.0),
                                              child:
                                              Panorama(
                                                animSpeed: 18.0,
                                                animReverse: true,
                                                interactive: true,

                                                zoom: 0,
                                                hotspots: [
                                                  Hotspot(
                                                    latitude: -15.0,
                                                    longitude: -129.0,
                                                    width: 30,
                                                    height: 75,
                                                  ),
                                                ],
                                                // child: Image.asset("assets/carousel/master.jpeg",fit: BoxFit.cover,),
                                                child:
                                                Image.asset(images[pagePosition],
                                                ),
                                              ),

                                            ),


                                            AspectRatio(
                                              aspectRatio: 18 / 8,
                                              child: Center(
                                                child: Text(
                                                  products[_current],
                                                  style: TextStyle(
                                                    letterSpacing: 8,
                                                    fontFamily: "Electrolize",
                                                    fontSize: screenSize.width / 25,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                );
                              })),

                      // AspectRatio(
                      //   aspectRatio: 18 / 8,
                      //   child: Center(
                      //     child: Text(
                      //       products[_current],
                      //       style: TextStyle(
                      //         letterSpacing: 8,
                      //         fontFamily: 'Electrolize',
                      //         fontSize: screenSize.width / 25,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ])


              ]));



  }
}

















// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//
//       return Container(
//       height: 1200,
//        child: ListView(
//         children: [
//           CarouselSlider(
//             items: [
//
//               //1st Image of Slider
//               Container(
//                 height: 90,
//                 margin: EdgeInsets.all(6.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//     ),
//                   // image: const DecorationImage(
//                     child: Image.asset("assets/carousel/terraces.jpeg",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//
//
//
//
//               //2nd Image of Slider
//
//              Container(
//                 height: 90,
//                 margin: EdgeInsets.all(6.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   ),
//
//
//                  child:  Panorama(
//                     animSpeed: 10.0,
//                     animReverse: true,
//                     interactive: true,
//                     zoom: 0,
//                     hotspots: [
//                       Hotspot(
//                         latitude: -15.0,
//                         longitude: -129.0,
//                         width: 30,
//                         height: 75,
//                         //   // widget: hotspotButton(text: "Next scene", icon: Icons.open_in_browser, onPressed: () => setState(() => _panoId++)),
//                       ),
//                     ],
//                   child: Image.asset("assets/carousel/master.jpeg",
//                     fit: BoxFit.cover,
//                   ),
//                 )
//              ),
//
//
//               //3rd Image of Slider
//               Container(
//                 height: 90,
//                 margin: EdgeInsets.all(6.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//     ),
//     child: Image.asset("assets/carousel/clothes-shop.jpg",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//
//
//               //4th Image of Slider
//
//             ],
//
//             //Slider Container properties
//             options: CarouselOptions(
//               height: 180.0,
//               enlargeCenterPage: true,
//               autoPlay: true,
//               aspectRatio: 16 / 9,
//               autoPlayCurve: Curves.fastOutSlowIn,
//               enableInfiniteScroll: true,
//               autoPlayAnimationDuration: Duration(milliseconds: 800),
//               viewportFraction: 0.8,
//             ),
//           ),
//         ],
//
//
//     ));
//   }
// }
//
//
// // / import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:panorama/panorama.dart';
// //
// //
// // class Panoramass extends StatefulWidget {
// //   const Panoramass({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Panoramass> createState() => _PanoramassState();
// // }
// //
// // class _PanoramassState extends State<Panoramass> {
// //
// //   late PageController _pageController;
// //   List<String> images =
// //   [
// //     "assets/carousel/terraces.jpeg",
// //     "assets/carousel/furniture.jpeg",
// //     "assets/carousel/master.jpeg",
// //
// //     // "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
// //     // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
// //     // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
// //     // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// //
// //
// //   ];
// //
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _pageController = PageController(viewportFraction: 0.8);
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 600,
// //      child: PageView.builder(
// //         itemCount: images.length,
// //         pageSnapping: true,
// //         controller: _pageController,
// //         onPageChanged: (page) {
// //           setState(() {
// //             // activePage = page;
// //           });
// //         },
// //         itemBuilder: (context, pagePosition) {
// //           return Container(
// //             height: 120,
// //             margin: EdgeInsets.all(10),
// //             child:  Panorama(
// //
// //
// //
// //
// //               // animSpeed: 5.0,
// //               // animReverse :true,
// //               // interactive: true,
// //
// //               zoom: 0,
// //               hotspots: [
// //                 Hotspot(
// //                   // latitude: -15.0,
// //                   // longitude: -129.0,
// //                   // width: 30,
// //                   // height: 75,
// //                   //   // widget: hotspotButton(text: "Next scene", icon: Icons.open_in_browser, onPressed: () => setState(() => _panoId++)),
// //                 ),],
// //
// //
// //             child:Image.network(images[pagePosition]),
// //           ));
// //         }));
// //   }
// //   }
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// // // // class Panorma extends StatelessWidget {
// // // //   @override
// // // //   Widget testBGCarousel = Container(
// // // //    child: SizedBox(
// // // //         height: 150.0,
// // // //         width: 300.0,
// // // //     //     child: CarouselSlider(
// // // //     //         options: CarouselOptions(height: 400.0),
// // // //     //         items: [1,2,3,4,5].map((i) {
// // // //     //           return Builder(
// // // //     //             builder: (BuildContext context) {
// // // //     //               return Container(
// // // //     //                   width: MediaQuery.of(context).size.width,
// // // //     //                   margin: const EdgeInsets.symmetric(horizontal: 5.0),
// // // //     //                   decoration: const BoxDecoration(
// // // //     //                       color: Colors.amber
// // // //     //                   ),
// // // //     //                   child: Text('text $i', style: TextStyle(fontSize: 16.0),)
// // // //     //               );
// // // //     //             },
// // // //     //           );
// // // //     //         }).toList(),
// // // //     //
// // // //     //
// // // //     //
// // // //     // ),
// // // //   ));
// // // //   Widget build(BuildContext context) {
// // // //
// // // //         return  Stack (
// // // //             children: <Widget>[
// // // //                PageView(
// // // //                 children:[ CarouselSlider(
// // // //                    options: CarouselOptions(height: 400.0),
// // // //                    items: [1,2,3,4,5].map((i) {
// // // //                      return Builder(
// // // //                        builder: (BuildContext context) {
// // // //                          return Container(
// // // //                              width: MediaQuery.of(context).size.width,
// // // //                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
// // // //                              decoration: const BoxDecoration(
// // // //                                  color: Colors.amber
// // // //                              ),
// // // //                              child: Text('text $i', style: TextStyle(fontSize: 16.0),)
// // // //                          );
// // // //                        },
// // // //                      );
// // // //                    }).toList(),
// // // //
// // // //
// // // //
// // // //                  )],
// // // //                 // children: [testBGCarousel],
// // // //               ),
// // // //               ListView(
// // // //                 children: [
// // // //                   Text('Text on top of the carousel'),
// // // //                 ],
// // // //               ),
// // // //             ]
// // // //
// // // //
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // //
// // // class Panoramas extends StatelessWidget {
// // //   final List<String> imageList = ["https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
// // //     'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
// // //     'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
// // //     'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'];
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container(
// // //       margin: EdgeInsets.all(15),
// // //       child: CarouselSlider.builder(
// // //         itemCount: imageList.length,
// // //         options: CarouselOptions(
// // //           enlargeCenterPage: true,
// // //           height: 300,
// // //           autoPlay: true,
// // //           autoPlayInterval: Duration(seconds: 3),
// // //           reverse: false,
// // //           aspectRatio: 5.0,
// // //         ),
// // //         itemBuilder: (context, i, id) {
// // //           //for onTap to redirect to another screen
// // //           return GestureDetector(
// // //             child: Container(
// // //               decoration: BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(15),
// // //                   border: Border.all(color: Colors.white,)
// // //               ),
// // //               //ClipRRect for image border radius
// // //               child: ClipRRect(
// // //                 borderRadius: BorderRadius.circular(15),
// // //                 child:Panorama(
// // //                   animSpeed: 20.0,
// // //                   animReverse :true,
// // //                   interactive: true,
// // //
// // //                   zoom: 0,
// // //                   hotspots: [
// // //                     Hotspot(
// // //                       latitude: -15.0,
// // //                       longitude: -129.0,
// // //                       width: 30,
// // //                       height: 75,
// // //                       //   // widget: hotspotButton(text: "Next scene", icon: Icons.open_in_browser, onPressed: () => setState(() => _panoId++)),
// // //                     ),],
// // //                child: Image.network(
// // //                   imageList[i],
// // //                   width: 500,
// // //                   fit: BoxFit.cover,
// // //                 ),
// // //               ),
// // //             )),
// // //             onTap: () {
// // //               var url = imageList[i];
// // //               print(url.toString());
// // //             },
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }}
