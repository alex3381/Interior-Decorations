
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../../../../../reuseablewidgets/tiles/tiles.dart';
import '../../../../../controllers/constructor_controller.dart';
import '../../../../../controllers/home_controller.dart';
import '../../../../../controllers/homecardcontroller.dart';
import '../../../../../controllers/orientationcontroller.dart';
import 'flipcardtiles_landscape.dart';
import 'flipcardtiles_potrait.dart';



class FlipCardTilesLayoutWidget extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final HomeCardController homeCardController = Get.put(HomeCardController());
  final ContructorServices contructorServices = Get.put(ContructorServices(screenSize: 'screenSize', ));

  late ScrollController scrollController;
  final OrientationBuilders orientationBuilders  = Get.put(OrientationBuilders ());
  final OrientationBuilders ctrl = Get.find();
  @override
  Widget build(BuildContext context) {

   return  SingleChildScrollView(

        reverse: true,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Tiles(),


          Padding(
         padding: const EdgeInsets.all(15.0),
    child: GetBuilder<OrientationBuilders>(
    initState: (_) => ctrl.setLandscape(),
    dispose: (_) => ctrl.setPortrait(),
    builder: (code) =>


    LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth < 600) {
    return FlipCardTilesPortrait();
    } else {
    return FlipCardTilesLandscape();

    }
    })
    ))]));
  }}


