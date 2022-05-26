
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../utilities/responsive/responsive.dart';
import 'bottomfooter_column.dart';
import 'infotext.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(40),
      child:ResponsiveWidget.isSmallScreen(context)
          ? Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                iconData:Icons.call,
                s1: 'Contact Us',
                s2: 'About Us',
              ),

              BottomBarColumn(
                iconData: Icons.layers,
                s1: 'Payment',
                s2: 'Cancellation',
              ),
              BottomBarColumn(
                iconData: Icons.facebook,
                s1: 'Twitter',
                s2: 'Facebook',
              ),
            ],
          ),
          Container(
            color: Colors.blueGrey,
            width: double.maxFinite,
            height: 1,
          ),
          const SizedBox(height: 20),
          InfoText(
            type: 'Email',
            text: 'alex.fatogun@gmail.com',
          ),
          const SizedBox(height: 5),
          InfoText(
            type: 'Address',
            text: 'No 13, Christ Avenue, Lekki Phase 1, Lagos - Nigeria',
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.blueGrey,
            width: double.maxFinite,
            height: 1,
          ),
          const SizedBox(height: 20),
          Text(
            'Copyright © 2020 | FATOGUN',
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 14,
            ),
          ),
        ],
      )
          : Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               BottomBarColumn(
                 iconData: Icons.call,
                s1: 'Contact Us',
                s2: 'About Us',
              ),
               BottomBarColumn(
                 iconData: Icons.layers,
                s1: 'Payment',
                s2: 'Cancellation',
                // s3: 'FAQ',
              ),
               BottomBarColumn(
                 iconData: Icons.facebook,
                s1: 'Twitter',
                s2: 'Facebook',
                // s3: 'YouTube',
              ),
              Container(
                color: Colors.blueGrey,
                width: 2,
                height: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoText(
                    type: 'Email',
                    text: 'explore@gmail.com',
                  ),
                  const SizedBox(height: 5),
                  InfoText(
                    type: 'Address',
                    text: 'No 13, Christ Avenue, Lekki Phase 1, Lagos',
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: const Color(0xFF162A49),
                // (0xFF162A49),
              // blueGrey,
              width: double.maxFinite,
              height: 1,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Copyright © 2020 | FATOGUN',
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
