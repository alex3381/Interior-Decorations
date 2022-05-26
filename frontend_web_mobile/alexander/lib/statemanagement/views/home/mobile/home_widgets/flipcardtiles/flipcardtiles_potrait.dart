import 'package:alexander/utilities/constant/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../reuseablewidgets/neumophoric/neumophoric.dart';
import '../../../../../../utilities/responsive/responsive.dart';
import '../../../../../controllers/constructor_controller.dart';
import '../../../../../controllers/home_controller.dart';
import '../../../../../controllers/homecardcontroller.dart';

class FlipCardTilesPortrait extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final HomeCardController homeCardController = Get.put(HomeCardController());
  final ContructorServices contructorServices = Get.put(ContructorServices(
    screenSize: 'screenSize',
  ));

  late ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
               SizedBox(
        height: MediaQuery.of(context).size.height/.49,
        width: MediaQuery.of(context).size.width,
        child:OrientationBuilder(
        builder: (context, orientation) {
                  return  Obx(() =>
                  GridView.builder(
                      primary: true,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(4.0),

                      itemCount: homeCardController.products.length,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(

                        crossAxisCount: 2,
                            childAspectRatio: 6.0 / 9.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: MediaQuery.of(context).size.height/1.8,
                            width: MediaQuery.of(context).size.width,
                            child: FlipCard(
                                flipOnTouch: true,
                                fill: Fill.fillBack,
                                direction: FlipDirection.VERTICAL,
                                front: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Neumophoric(
                                          child: Stack(children: [
                                            Positioned(
                                                top: 0,
                                                right: 0,
                                                child: Neumophoric(
                                                  child: SizedBox(
                                                    height: 12,
                                                    width: 12,
                                                    child: Icon(
                                                      Icons.add,

                                                      color: homeController
                                                              .isDarkMode.value
                                                          ? Colors.yellowAccent
                                                          : Colors.pink,
                                                      // const Color(0xFFCDDC40),
                                                      size: 9,
                                                    ),
                                                  ),
                                                )),
// Spacer(),
                                            Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: SizedBox(
                                                          height: 90.0,
                                                          width: 70,
                                                          child: Neumophoric(
                                                              child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 4,
                                                                    horizontal:
                                                                        3),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  homeCardController
                                                                      .products[
                                                                          index]
                                                                      .imageUrl2,
                                                              imageBuilder:
                                                                  (context,
                                                                          image) =>
                                                                      Container(
                                                                height: 300,
                                                                width: 200,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius: const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10)),
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        image,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  const CircularProgressIndicator(),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const Icon(Icons
                                                                      .error),
                                                            ),
                                                          )))),
                                                ]),

                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const SizedBox(
                                                  height: 130,
                                                ),
                                                Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3),
                                                        child: Text(
                                                          (homeCardController
                                                              .products[index]
                                                              .productDescription),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline5
                                                              ?.copyWith(
                                                                  fontSize: 6,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic),
                                                        ))),
                                                const SizedBox(
                                                  height: 7,
                                                ),
                                                Flexible(
                                                    flex: 1,
                                                    child: Neumophoric(
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            child: Text(
                                                              (homeCardController
                                                                  .products[
                                                                      index]
                                                                  .title),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: GoogleFonts
                                                                  .oswald(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline6
                                                                    ?.copyWith(
                                                                        fontSize:
                                                                            7),
                                                                color: homeController
                                                                        .isDarkMode
                                                                        .value
                                                                    ? Colors
                                                                        .yellowAccent
                                                                    : Colors
                                                                        .pink,

                                                                // fontSize: 8,
                                                                letterSpacing:
                                                                    0.5,
                                                              ),
                                                            )))),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Flexible(
                                                              flex: 1,
                                                              child: Text(
                                                                "View Prices",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline5
                                                                    ?.copyWith(
                                                                        fontSize:
                                                                            7,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                              )),
                                                          SizedBox(
                                                            width: 9,
                                                          ),
                                                          Flexible(
                                                              flex: 1,
                                                              child: Text(
                                                                "\$${(homeCardController.products[index].price)}",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headline5
                                                                    ?.copyWith(
                                                                        fontSize:
                                                                            7,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                              )),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ],
                                            ),

                                            Positioned(
                                                bottom: 0,
                                                left: 0,
                                                child: Neumophoric(
                                                  child: SizedBox(
                                                      height: 12,
                                                      width: 12,
                                                      // child: Expanded(
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: homeController
                                                                .isDarkMode
                                                                .value
                                                            ? Colors
                                                                .yellowAccent
                                                            : Colors.pink,
                                                        size: 9,
                                                      )),
                                                )),
                                          ]),
                                        ))),

                                ///////////////////////////   FLIP    ////////////////////////////////////////////////////////////////////////////////////////

                                back: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 7,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Neumophoric(
                                            child: Stack(children: [
                                          CachedNetworkImage(
                                            imageUrl: homeCardController
                                                .products[index].imageUrl2,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              height: 500,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          Positioned(
                                              top: 0,
                                              right: 0,
                                              child: Neumophoric(
                                                child: SizedBox(
                                                  height: 12,
                                                  width: 12,
                                                  child: Icon(
                                                    Icons.add,

                                                    color: homeController
                                                            .isDarkMode.value
                                                        ? Colors.yellowAccent
                                                        : Colors.pink,
                                                    // const Color(0xFFCDDC40),
                                                    size: 9,
                                                  ),
                                                ),
                                              )),
                                          Positioned(
                                            top: 20,
                                            left: 0,
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 15),
                                                child: Neumophoric(
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Text(
                                                          (homeCardController
                                                              .products[index]
                                                              .title),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .oswald(
                                                            textStyle: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline6
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        7),
                                                            color: homeController
                                                                    .isDarkMode
                                                                    .value
                                                                ? Colors
                                                                    .yellowAccent
                                                                : Colors.pink,

                                                            // fontSize: 8,
                                                            letterSpacing: 0.5,
                                                          ),
                                                        )))),
                                          ),
                                        ]))))));
                      }
    ));}
  ))]);
  }
}
