import 'package:alexander/statemanagement/views/home/mobile/home_widgets/flipcardtiles/flipcardtiles_layoutwidget.dart';
import 'package:alexander/statemanagement/views/home/mobile/home_widgets/top_part_portrait.dart';
import '../../../../../reuseablewidgets/carousel/carousel.dart';
import '../../../../../reuseablewidgets/footer/footer.dart';
import '../../../../../reuseablewidgets/snackbaricon/snackbar_icons.dart';
import '../../../../../reuseablewidgets/tiles_interior_design/tiles_interior_design.dart';
import '../../../../../reuseablewidgets/video_player/video_player_widget.dart';
import '../mobile_home.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'flipcardtiles/flipcardtiles_potrait.dart';


class MainScreen extends StatelessWidget {

   MainScreen({Key? key}) : super(key: key);
   final ScrollController _firstController = ScrollController();
   final bool _isAlwaysShown = true;
   final bool _showTrackOnHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const HomeViewWidget(),
          actions: [
            SnackBarIcons(),
          ],
        title : Padding(
          padding:const EdgeInsets.all(10),
           child: Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape:
              NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              depth: 7,
              lightSource: LightSource.bottom,
              color: homeController.isDarkMode.value
                  ? Colors.black
                  : const Color(0xFF18FFFF),
            ),

            child: Padding(
                padding: const EdgeInsets.all(4),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("< ",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1),
                    const Text(
                      "Alexander",
                      style: TextStyle(
                        fontFamily: "Agustina",
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                        MediaQuery.of(context).size.width >= 1000
                            ? " />\t\t"
                            : " />",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ))
           ))


          ),

      body:Scrollbar(

                controller: _firstController,
                trackVisibility:  _showTrackOnHover,
            thumbVisibility: _isAlwaysShown,

                radius: const Radius.circular(5),
                thickness: 9,
                interactive: true,

    child:ListView(
        controller: _firstController,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
    children:[

                 Stack(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      alignment: Alignment.topCenter,
                      fit: StackFit.loose,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TopPartPortrait(),
                              FlipCardTilesLayoutWidget(),
                              TilesSlider(),
                              const Carousel(),
                              Footer()
                            ])
                      ])
      ])));
  }
}
