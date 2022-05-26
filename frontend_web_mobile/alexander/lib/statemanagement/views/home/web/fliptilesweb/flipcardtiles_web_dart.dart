import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../reuseablewidgets/tiles/tiles.dart';
import '../../../../controllers/constructor_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../controllers/homecardcontroller.dart';


class FlipCardTileWeb extends StatelessWidget {
  final ContructorServices contructorServices = Get.put(ContructorServices(screenSize: 'screenSize', ));
  final HomeController homeController = Get.put(HomeController());
  final HomeCardController homeCardController = Get.put(HomeCardController());




  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
            shrinkWrap: true,
            children: [
          Tiles(),
          SizedBox(
              height: MediaQuery.of(context).size.height/1.8,
              width: MediaQuery.of(context).size.width/7,
              child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeCardController.products.length,
                  // padding: const EdgeInsets.all(0.0),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: const EdgeInsets.all(12.0),
                        child: FlipCard(
                            flipOnTouch: true,
                            fill: Fill.fillBack,
                            // Fill the back side of the card to make in the same size as the front.
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                                height:
                                MediaQuery.of(context).size.height / 1.7,
                                width: MediaQuery.of(context).size.width/4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: Neumorphic(
                                      drawSurfaceAboveChild: true,
                                      curve: Neumorphic.DEFAULT_CURVE,
                                      duration: Neumorphic.DEFAULT_DURATION,
                                      style: NeumorphicStyle(
                                        shape: NeumorphicShape.convex,
                                        boxShape: NeumorphicBoxShape.roundRect(
                                            BorderRadius.circular(15)),
                                        depth: 3,
                                        lightSource: LightSource.topLeft,
                                        color: homeController.isDarkMode.value
                                            ? Colors.black
                                            : const Color(0xFF18FFFF),
                                      ),
                                      child: Stack(children: [
                                        Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Neumorphic(
                                              style: NeumorphicStyle(
                                                border: NeumorphicBorder(
                                                  color: homeController
                                                      .isDarkMode.value
                                                      ? Colors.black
                                                      : const Color(0xFF18FFFF),
                                                  width: 0.8,
                                                ),
                                                shape: NeumorphicShape.concave,
                                                boxShape: NeumorphicBoxShape
                                                    .roundRect(
                                                    BorderRadius.circular(
                                                        15)),
                                                depth: 6,
                                                lightSource:
                                                LightSource.topLeft,
                                                color: homeController
                                                    .isDarkMode.value
                                                    ? Colors.black
                                                    : const Color(0xFF18FFFF),
                                              ),
                                              child: SizedBox(
                                                height: 27,
                                                width: 27,
                                                child: Icon(
                                                  Icons.add,

                                                  color: homeController
                                                      .isDarkMode.value
                                                      ? Colors.yellowAccent
                                                      : Colors.pink,
                                                  // const Color(0xFFCDDC40),
                                                  size: 14,
                                                ),
                                              ),
                                            )),
// Spacer(),
                                        Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                            children: [
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                      height: 130.0,
                                                      width: 140,
                                                      child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                              vertical: 17,
                                                              horizontal:
                                                              10),
                                                          child: Neumorphic(
                                                              style:
                                                              NeumorphicStyle(
                                                                border: NeumorphicBorder(
                                                                    color: homeController
                                                                        .isDarkMode
                                                                        .value
                                                                        ? Colors
                                                                        .black
                                                                        : const Color(
                                                                        0xFF18FFFF),
                                                                    width: 2,
                                                                    isEnabled:
                                                                    true),
                                                                shape:
                                                                NeumorphicShape
                                                                    .concave,
                                                                boxShape: NeumorphicBoxShape.roundRect(
                                                                    BorderRadius
                                                                        .circular(
                                                                        5)),
                                                                depth: 4,
                                                                shadowDarkColor: homeController
                                                                    .isDarkMode
                                                                    .value
                                                                    ? Colors
                                                                    .black
                                                                    : const Color(
                                                                    0xFF18FFFF),
                                                                lightSource:
                                                                LightSource
                                                                    .topRight,
                                                                color: homeController
                                                                    .isDarkMode
                                                                    .value
                                                                    ? Colors
                                                                    .black
                                                                    : const Color(
                                                                    0xFF18FFFF),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 9,
                                                                    horizontal:
                                                                    9),


                                                               child: CachedNetworkImage(
                                                                  width: double.infinity,
                                                                  height: 250,
                                                                  fit: BoxFit.cover,
                                                                  imageUrl: homeCardController
                                                                      .products[index]
                                                                      .imageUrl,
                                                                  // _image1,
                                                                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                                      CircularProgressIndicator(value: downloadProgress.progress),
                                                                  errorWidget: (context, url, error) => const Icon(
                                                                    Icons.error,
                                                                    size: 100,
                                                                    color: Colors.red,
                                                                  ),
                                                                ),


                                                              ))))),
                                            ]),

                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(
                                              height: 170,
                                            ),
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(3),
                                                    child: Text(
                                                      (homeCardController
                                                          .products[index]
                                                          .productDescription),
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline,
                                                    ))),
                                            Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 15),
                                                child: Neumorphic(
                                                    style: NeumorphicStyle(
                                                      border: NeumorphicBorder(
                                                          color: homeController
                                                              .isDarkMode
                                                              .value
                                                              ? Colors.black
                                                              : const Color(
                                                              0xFF18FFFF),
                                                          width: 2,
                                                          isEnabled: true),
                                                      shape: NeumorphicShape
                                                          .concave,
                                                      boxShape:
                                                      NeumorphicBoxShape
                                                          .roundRect(
                                                          BorderRadius
                                                              .circular(
                                                              5)),
                                                      depth: 3,
                                                      shadowDarkColor:
                                                      homeController
                                                          .isDarkMode
                                                          .value
                                                          ? Colors.black
                                                          :  const Color(
                                                          0xFF18FFFF),
                                                      lightSource:
                                                      LightSource.topRight,
                                                      color: homeController
                                                          .isDarkMode.value
                                                          ? Colors.black
                                                          : const Color(
                                                          0xFF18FFFF),
                                                    ),
                                                    child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 9,
                                                            horizontal: 9),
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
                                                                .headline6,
                                                            color: homeController
                                                                .isDarkMode
                                                                .value
                                                                ? Colors.yellowAccent
                                                                : Colors.pink,
                                                            // const Color(0xFFCDDC39),
                                                            fontSize: 10,
                                                            letterSpacing: 1.0,
                                                          ),
                                                        )))),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(2),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: <Widget>[
                                                      Flexible(
                                                          child: Text(
                                                            "\$${(homeCardController.products[index].price)}",
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .subtitle1,
                                                          )),
                                                      Flexible(
                                                          flex: 2,
                                                          child: Text(
                                                            "View Prices",
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .subtitle1,
                                                          )),
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),

                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          child: Neumorphic(
                                              margin: const EdgeInsets.all(5),
                                              style: NeumorphicStyle(
                                                shape: NeumorphicShape.concave,
                                                boxShape: NeumorphicBoxShape
                                                    .roundRect(
                                                    BorderRadius.circular(
                                                        15)),
                                                depth: 6,
                                                lightSource:
                                                LightSource.topLeft,
                                                color: homeController
                                                    .isDarkMode.value
                                                    ? Colors.black
                                                    : const Color(0xFF18FFFF),
                                              ),
                                              child: SizedBox(
                                                height: 24,
                                                width: 24,
                                                child: Icon(
                                                  Icons.remove,
                                                  color: homeController
                                                      .isDarkMode.value
                                                      ? Colors.yellowAccent
                                                      : Colors.pink,
                                                  size: 14,
                                                ),
                                              )),
                                        )
                                      ]),
                                    ))),

                            /////////////////////////   FLIP    ////////////////////////////////////////////////////////////////////////////////////////

                            back:
                            Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: Neumorphic(
                                        drawSurfaceAboveChild: true,
                                        curve: Neumorphic.DEFAULT_CURVE,
                                        duration: Neumorphic.DEFAULT_DURATION,
                                        style: NeumorphicStyle(
                                          shape: NeumorphicShape.convex,
                                          boxShape:
                                          NeumorphicBoxShape.roundRect(
                                              BorderRadius.circular(15)),
                                          depth: 3,
                                          lightSource: LightSource.topLeft,
                                          color: homeController.isDarkMode.value
                                              ? Colors.black
                                              : const Color(0xFF18FFFF),
                                        ),
                                        child: Stack(children: [


                                          CachedNetworkImage(
                                            imageUrl:  homeCardController
                                                .products[index]
                                                .imageUrl2,
                                            imageBuilder: (context, imageProvider) => Container(
                                              height: 500,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) => const CircularProgressIndicator(),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                          ),


                                          Positioned(
                                              top: 0,
                                              right: 0,
                                              child: Neumorphic(
                                                style: NeumorphicStyle(
                                                  border: NeumorphicBorder(
                                                    color: homeController
                                                        .isDarkMode.value
                                                        ? Colors.black
                                                        : const Color(
                                                        0xFF18FFFF),
                                                    width: 0.8,
                                                  ),
                                                  shape:
                                                  NeumorphicShape.concave,
                                                  boxShape: NeumorphicBoxShape
                                                      .roundRect(
                                                      BorderRadius.circular(
                                                          15)),
                                                  depth: 6,
                                                  lightSource:
                                                  LightSource.topLeft,
                                                  color: homeController
                                                      .isDarkMode.value
                                                      ? Colors.black
                                                      : const Color(0xFF18FFFF),
                                                ),
                                                child: SizedBox(
                                                  height: 27,
                                                  width: 27,
                                                  child: Icon(
                                                    Icons.add,

                                                    color: homeController
                                                        .isDarkMode.value
                                                        ? Colors.pink
                                                        : Colors.red,
                                                    // const Color(0xFFCDDC40),
                                                    size: 14,
                                                  ),
                                                ),
                                              )),

                                        ])))))
                                );
                  }

              )))
        ]));
  }
}
