
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../bindings/initial_binding.dart';
import '../views/authorization/backgroundweb.dart';
import '../views/home/mobile/mobile_home.dart';
import '../views/home/web/web_home.dart';




// appRoutes()=>[
//
// GetPage(
// name: '/second',
// page: () =>   WebHome(),
// binding: InitialBinding(),
// middlewares: [MyMiddelware()],
// transition: Transition.leftToRight ,
// transitionDuration: const Duration(seconds: 5),
// // const WebHome(),
// // mediumScreen: const TabHome(),
// // smallScreen: MobileHome()
// )),
// ];

// late final Function onSignUpSelected;
// LoginScreenLayout({required this.onSignUpSelected,  });


appRoutes()=>[

  GetPage(
    name:'/',
    page:() =>  MobileHome(),
    binding: InitialBinding(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(seconds: 5),
      children: [
        GetPage(
            name: '/login',
            page:() => BackGround()
        )
      ]
// transition: Transition.fadeIn,
    // transition: Transition.leftToRightWithFade,
    // transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/second',
    page: () =>   WebHome(),
    binding: InitialBinding(),
    middlewares: [MyMiddelware()],
    transition: Transition.leftToRight ,
    transitionDuration: const Duration(seconds: 5),
      children: [
      GetPage(
          name: '/loginweb',
          page:() => BackGround()
      ),
        GetPage(
            name: '/register',
          page:()=> BackGround(),
        )
    ]
  ),

  // GetPage(
  //   name: '/third/',
  //   page: () =>  SignUpScreenLayout(onLogInSelected: onLogInSelected,),
  //   middlewares: [MyMiddelware()],
  //   transition: Transition.fadeIn,
  //   // transition: Transition.leftToRightWithFade,
  //   transitionDuration: const Duration(milliseconds: 500),
  // ),
  //
  // GetPage(
  //   name: '/fourth/',
  //   page: () => LoginScreenPortrait(),
  //     fullscreenDialog: true,
  //   middlewares: [MyMiddelware()],
  //   transition: Transition.leftToRightWithFade,
  //   transitionDuration: const Duration(milliseconds: 10),
  // ),
];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
















// appRoutes()=>[
//   GetPage(
//     name:'/mobile',
//     page:() =>   MainScreen(),
//     binding: InitialBinding(),
//     transition: Transition.rightToLeft,
//     transitionDuration: const Duration(seconds: 5),
//     children: [
//       GetPage(
//           name: '/register',
//           page:() => BackGround()
//       )
//     ]
//   ),
//   GetPage(
// name:'/tab',
// page:() =>   const TabHome(),
// binding: InitialBinding(),
// transition: Transition.rightToLeft,
// transitionDuration: const Duration(seconds: 5),
// children: [
// GetPage(
// name: '/register',
// page:() => BackGround()
// )
// ]
// ),
//
//
// GetPage(
// name:'/web',
// page:() =>   const WebHome(),
// binding: InitialBinding(),
// transition: Transition.rightToLeft,
// transitionDuration: const Duration(seconds: 5),
// children: [
// GetPage(
// name: '/register',
// page:() => BackGround()
// )
// ]













  // GetPage(
  //   name: '/third/',
  //   page: () =>  SignUpScreenLayout(onLogInSelected: onLogInSelected,),
  //   middlewares: [MyMiddelware()],
  //   transition: Transition.fadeIn,
  //   // transition: Transition.leftToRightWithFade,
  //   transitionDuration: const Duration(milliseconds: 500),
  // ),
  //
  // GetPage(
  //   name: '/fourth/',
  //   page: () => LoginScreenPortrait(),
  //     fullscreenDialog: true,
  //   middlewares: [MyMiddelware()],
  //   transition: Transition.leftToRightWithFade,
  //   transitionDuration: const Duration(milliseconds: 10),
  // ),
// )];



// class MyMiddelware extends GetMiddleware {
//   @override
//   GetPage? onPageCalled(GetPage? page) {
//     print(page?.name);
//     return super.onPageCalled(page);
//   }
// }
//





