import 'package:flutter/material.dart';

import '../../../../../reuseablewidgets/animatedtextwidget/animatedtextwidget.dart';
import '../../../../../reuseablewidgets/getstartedwidget/getstartedwidget.dart';
import '../../../../../reuseablewidgets/socialmediaIcons/socialmediaicons.dart';
import '../../../../../reuseablewidgets/titlepage/titlepage.dart';
import '../../../../../reuseablewidgets/video_player/video_player_widget.dart';
import '../../../../../utilities/constant/constant.dart';
import '../../mobile/home_widgets/topanimatedtext.dart';

class TopPartWidgetWeb extends StatelessWidget {
  const TopPartWidgetWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.topLeft,
                      fit: StackFit.loose,
                      children: [
                         const Positioned(
                          right: 30,
                          top: 80,
                          child: VideoPlayerScreen(),
                        ),

                        Container(
                            height: MediaQuery.of(context).size.height/ 1.4,
                            alignment: Alignment.topLeft,
                          child:Padding(padding: const EdgeInsets.all(10),

                            child: ListView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 30,),
                                      TopAnimatedText(screenSize:screenSize),
                                      const SizedBox(height: 40),
                                      TitlePage(),
                                      const SizedBox(height: 30,),
                                      AnimatedTextWidget(screenSize:screenSize),
                                      const SizedBox(height: 30,),



                                        Row(

                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(

                                            kSocialIcons.length,
                                                (index) =>

                                                      SocialMediaIconBtn(
                                              icon: kSocialIcons[index],
                                            ),

                                          ),

                                        )]),




                                      const SizedBox(height: 30,),
                                      GetStarted(screenSize: screenSize,),
                                    ],
                                  ),





                                ))])]));

  }
}
