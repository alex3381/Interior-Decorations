import 'package:get/get.dart';


import '../../../../model/zoom_model.dart';
import '../../../../utilities/constant/constant.dart';
import '../../../../utilities/themes/theme.dart';
import '../../../controllers/drawercontroller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../../controllers/home_controller.dart';
import '../../../controllers/orientationcontroller.dart';
import '../../authorization/backgroundweb.dart';
import 'home_widgets/otherpages.dart';
import 'home_widgets/mainscreen.dart';


class MobileHome extends StatefulWidget {
  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  HomeViewItem currentItem = HomeViewItems.blog;
  @override
  Widget build(BuildContext context) {

    return   GetBuilder<MyDrawerController>(
      builder: (_) =>
           ZoomDrawer(
            borderRadius: 30.0,
            showShadow: true,
            angle: -12.0,
            menuBackgroundColor: Colors.indigo,
            drawerShadowsBackgroundColor: Colors.deepOrangeAccent,
            slideWidth: MediaQuery.of(context).size.width * 0.65,
            controller: _.zoomDrawerController,
            mainScreen: getScreen(),
            // const MainScreen(),
            menuScreen:Builder(
              builder: (context) =>

            HomeView(currentItem: currentItem,
                onSelectedItem: (item) {
                  setState(() => currentItem = item);
                  ZoomDrawer.of(context)!.close();
                }

            ),


          ),


    ));

    //           : PreferredSize(
    //         //Tab and wed screen
    //         preferredSize: Size(screenSize.width, 1000),
    // // child:ResponsiveWidget.isLargeScreen()context)
    //     child:MainScreen());
  }

  Widget getScreen() {
    switch (currentItem) {
      case HomeViewItems.blog:
        return  MainScreen();
      case HomeViewItems.products:
        return const ProductsWidget();
      case HomeViewItems.service:
        return const Services();
      case HomeViewItems.login:
        return BackGround();
      case HomeViewItems.cart:
        return  BackGround();
      case HomeViewItems.contactus:
        return const ContactUs();
      case HomeViewItems.rateus:
        return const RateUsPage();
        // case
      default:
        return MainScreen();
    }
  }

}





class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed:() => ZoomDrawer.of(context)!.toggle(),);

}





class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final HomeViewItem currentItem;
  final ValueChanged<HomeViewItem>onSelectedItem;
  final OrientationBuilders ctrl = Get.find();

   HomeView({Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>  Theme(
      data:ThemeData.dark(),
     child: Scaffold(
         backgroundColor: Colors.indigo,
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Spacer(),
          ...HomeViewItems.all.map(buildHomeViewItem).toList(),
          const Spacer(flex: 2,),


               GetBuilder<OrientationBuilders>(
                initState: (_) => ctrl.setLandscape(),
    dispose: (_) => ctrl.setPortrait(),
    builder: (code) =>


        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 600) {
                return const Portrait();
              } else {
                return Container();
                  // Landscape();

              }
            })
)]))


  ));

  Widget buildHomeViewItem(HomeViewItem item) => ListTileTheme(
  selectedColor: Colors.white,
    child: Expanded(
   child: ListTile(
    selectedTileColor: Colors.black26,
    selected: currentItem == item,
    minLeadingWidth: 20,
    leading: Icon(item.icon),
    title: Text(item.title,),
    onTap: () => onSelectedItem(item),
  )));

  }




class Portrait extends StatelessWidget {
  const Portrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

       return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [


        Container(
        height: 60.0,
        width: 110,
        padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
    hoverColor: kPrimaryColor.withAlpha(150),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    side: const BorderSide(color: Color(0xFF18FFFF))),
    onPressed: () {
    // html.window.open(
    //     'https://drive.google.com/file/d/1GF-wtbu2ob_Uxhw2In2QA8QiYi3XjCj1/view?usp=sharing',
    //     "pdf");
    },
   child:Neumorphic(
                    style: NeumorphicStyle(
                      border: const NeumorphicBorder(
                          color:Colors.indigo,
                          width: 4,
                          isEnabled: true),
                      shape: NeumorphicShape
                          .concave,
                      boxShape:
                      NeumorphicBoxShape
                          .roundRect(
                          BorderRadius
                              .circular(
                              50)),
                      depth: 3,
                      shadowDarkColor:Colors.indigo,

                      lightSource:
                      LightSource.topRight,
                      color:Colors.indigo,
                    ),

                    child:Padding(
                        padding: const EdgeInsets.all(5),
                        child: Material(
                            elevation: 0,
                            color: Colors.transparent,
                            child:InkWell(
                              child: Text(
                                "REGISTER",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontSize: 12),
                              ),
                              onTap: () =>  Get.toNamed('/login',),
                            )))),)),



     const Padding(
         padding:EdgeInsets.all(10),

      child:Text( 'Copyright © 2022 | FATOGUN ALEX', style: TextStyle(fontSize: 12))
    )
        ]);

  }
}





class LandScape extends StatelessWidget {
  const LandScape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [


        Container(
        height: 60.0,
        width: 110,
        padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
    hoverColor: kPrimaryColor.withAlpha(150),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
    side: const BorderSide(color: Color(0xFF18FFFF))),
    onPressed: () {
    // html.window.open(
    //     'https://drive.google.com/file/d/1GF-wtbu2ob_Uxhw2In2QA8QiYi3XjCj1/view?usp=sharing',
    //     "pdf");
    },
    child:Neumorphic(
    style: NeumorphicStyle(
    border: const NeumorphicBorder(
    color:Colors.indigo,
    width: 4,
    isEnabled: true),
    shape: NeumorphicShape
        .concave,
    boxShape:
    NeumorphicBoxShape
        .roundRect(
    BorderRadius
        .circular(
    50)),
    depth: 3,
    shadowDarkColor:Colors.indigo,

    lightSource:
    LightSource.topRight,
    color:Colors.indigo,
    ),

    child:Padding(
    padding: const EdgeInsets.all(5),
    child: Material(
    elevation: 0,
    color: Colors.transparent,
    child:InkWell(
    child: Text(
    "REGISTER",
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white, fontSize: 12),
    ),
    onTap: () =>  Get.toNamed('/login'),

    )))),)),



    const Padding(
    padding:EdgeInsets.all(3),

    child:Text( 'Copyright © 2022 | FATOGUN ALEX', style: TextStyle(fontSize: 12))
    )]);

  }
}

