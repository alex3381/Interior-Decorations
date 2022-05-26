import 'package:flutter/material.dart';

import '../mobile_home.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('PRODUCT'),
          leading: const HomeViewWidget(),

    ),

    body:Container(
      color: Colors.red,
      child: Center(
      child:  IconButton(
        icon: const Icon(Icons.shopping_basket_outlined,
        size: 70,),
        onPressed: () {  },
      )
      ),

    ));
  }
}




class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('SERVICES'),
          leading: const HomeViewWidget(),

    ),


      body:Container(
      color: Colors.amber,
      child: Center(
          child:  IconButton(
            icon: const Icon(Icons.phone_callback, size: 70,),
            onPressed: () {  },
          )
      ),

      ));
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('LOGIN'),
          leading: const HomeViewWidget(),

    ),


     body: Container(
      color: Colors.purple,
      child: Center(
          child:  IconButton(
            icon: const Icon(Icons.lock, size: 70,),
            onPressed: () {  },
          )
      ),
     ));
  }
}


class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('REGISTER'),
          leading: const HomeViewWidget(),

        ),

     body: Container(
      color: Colors.indigo,
      child: Center(
          child:  IconButton(
            icon: const Icon(Icons.person, size: 70,),
            onPressed: () {  },
          )
      ),
     ));
  }
}



class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('CONTACTUS'),
          leading: const HomeViewWidget(),

    ),


     body: Container(
      color: Colors.white,
      child: Center(
          child:  IconButton(
            icon: const Icon(Icons.info_outline, size: 70,),
            onPressed: () {  },
          )
      ),
    ));
  }
}





class RateUsPage extends StatefulWidget {
  const RateUsPage({Key? key}) : super(key: key);

  @override
  State<RateUsPage> createState() => _RateUsPageState();
}

class _RateUsPageState extends State<RateUsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('RATE US'),
          leading: const HomeViewWidget(),

    ),

      body:Container(
      color: Colors.amber,
      child: Center(
          child:  IconButton(
            icon: const Icon(Icons.star_border, size: 70,),
            onPressed: () {  },
          )
      ),
      ) );
  }
}