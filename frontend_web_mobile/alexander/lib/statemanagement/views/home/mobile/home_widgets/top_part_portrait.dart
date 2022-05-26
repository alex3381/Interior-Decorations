import 'package:alexander/statemanagement/views/home/mobile/home_widgets/topanimatedtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../../../../reuseablewidgets/animatedtextwidget/animatedtextwidget.dart';
import '../../../../../reuseablewidgets/getstartedwidget/getstartedwidget.dart';
import '../../../../../reuseablewidgets/socialmediaIcons/socialmediaicons.dart';
import '../../../../../reuseablewidgets/titlepage/titlepage.dart';
import '../../../../../reuseablewidgets/video_player/video_player_widget.dart';
import '../../../../../utilities/constant/constant.dart';
import '../../../../../utilities/responsive/responsive.dart';
import '../../../../controllers/constructor_controller.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../controllers/orientationcontroller.dart';


class TopPartPortrait extends StatefulWidget {
   TopPartPortrait({Key? key}) : super(key: key);
  final ContructorServices contructorServices = Get.put(ContructorServices(
    screenSize: 'screenSize',
  ));
  // final HomeController homeController = Get.put(HomeController());

  @override
  State<TopPartPortrait> createState() => _TopPartPortraitState();
}

class _TopPartPortraitState extends State<TopPartPortrait> {


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final OrientationBuilders orientationBuilders  = Get.put(OrientationBuilders ());
    final OrientationBuilders ctrl = Get.find();

    return  GetBuilder<OrientationBuilders>(
    initState: (_) => ctrl.setLandscape(),
    dispose: (_) => ctrl.setPortrait(),
    builder: (code) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return
              SizedBox(
                height: MediaQuery.of(context).size.height /1.55,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                fit: StackFit.loose,
                children: [
                  //   Flexible(
                  // child:
                  const Positioned(
                    top: 60,
                    left: 180,
                    child: VideoPlayerScreen(),
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    child: TopAnimatedText(screenSize: screenSize),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      TitlePage(),
                      AnimatedTextWidget(screenSize: screenSize),
                      FittedBox(
                          fit: BoxFit.contain,
                          clipBehavior: Clip.antiAlias,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              kSocialIcons.length,
                                  (index) =>
                                  SocialMediaIconBtn(
                                    icon: kSocialIcons[index],
                                  ),
                            ),
                          )),
                      GetStarted(
                        screenSize: screenSize,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                  // ),
                ],
              ),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.4 ,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                fit: StackFit.loose,
                children: [
                  //   Flexible(
                  // child:
                  const Positioned(
                    top: 60,
                    left: 180,
                    child: VideoPlayerScreen(),
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    child: TopAnimatedText(screenSize: screenSize),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      TitlePage(),
                      AnimatedTextWidget(screenSize: screenSize),
                      FittedBox(
                          fit: BoxFit.contain,
                          clipBehavior: Clip.antiAlias,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              kSocialIcons.length,
                                  (index) =>
                                  SocialMediaIconBtn(
                                    icon: kSocialIcons[index],
                                  ),
                            ),
                          )),
                      GetStarted(
                        screenSize: screenSize,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                  // ),
                ],
              ),
            );
          }
        }));}
}
