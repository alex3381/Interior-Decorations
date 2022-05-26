import 'package:alexander/statemanagement/views/home/web/toppartwidget/toppartwidget.dart';
import 'package:alexander/statemanagement/views/home/web/webappbar/tabappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../reuseablewidgets/carousel/carousel.dart';
import '../../../../reuseablewidgets/divider_widget/divider_widget.dart';
import '../../../../reuseablewidgets/footer/footer.dart';
import '../../../../reuseablewidgets/navBar/navBarLogo.dart';
import '../../../../reuseablewidgets/tiles_interior_design/tiles_interior_design.dart';
import '../../../../utilities/animation/fadein_animation.dart';
import '../../../../utilities/responsive/responsive.dart';
import '../../../controllers/constructor_controller.dart';
import '../../../controllers/home_controller.dart';
import 'fliptilesweb/flipcardtiles_web_dart.dart';

class WebHome extends StatefulWidget {
   // WebHome({Key? key,required this.screenSize, }) : super(key: key);
   // final Size screenSize;

  @override
  State<WebHome> createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  final HomeController homeController = Get.put(HomeController());
  final ContructorServices contructorServices = Get.put(ContructorServices(screenSize: 'screenSize', ));
  final ScrollController _secondController = ScrollController();
  final bool _isAlwaysShown = true;
  final bool _showTrackOnHover = false;


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ResponsiveWidget.isMediumScreen(context)
        ? AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: const IconThemeData(),
          // backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0.0,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            leadingWidth: 8,



            title:
            EntranceFader(
                duration: const Duration(milliseconds: 250),
                offset: const Offset(0, -10),
                delay: const Duration(seconds: 3),
                child: NavBarLogo(height: 20.0,)),

            actions: [
              TabAppBar(),]

        ):
            PreferredSize(

        preferredSize: Size(screenSize.width, 1000),
            child: Row(
              children: [
                NavBarLogo(height: 20),
                Spacer(),
                TabAppBar()
              ])),



    body:Scrollbar(
              controller: _secondController,
              trackVisibility:  _showTrackOnHover,
              thumbVisibility: _isAlwaysShown,
              radius: const Radius.circular(5),
              thickness: 9,
              interactive: true,
        child: ListView(
         shrinkWrap: true,
         controller:  _secondController,

              children: [
                Container(

                    // width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),

               child:Stack(
                 clipBehavior: Clip.antiAliasWithSaveLayer,
                    alignment: Alignment.topCenter,
                  fit: StackFit.loose,
                  children:[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      SizedBox(
                      height: MediaQuery.of(context).size.height ,
                      child:   const TopPartWidgetWeb()
    ),
                      FlipCardTileWeb(),
                      TilesSlider(),
                                       // const Carousel(),
                      // Footer(),

   ])])),

                const Carousel(),
                DividerWidget(),
                Footer(),
              ])) );
  }
}
