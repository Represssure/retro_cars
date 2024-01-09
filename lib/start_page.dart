import 'dart:io';

import 'package:flutter/material.dart';
import 'package:retro_cars/american_car_page.dart';
import 'package:retro_cars/italian_car_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/image2.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 280,
              height: 40,
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              child: FloatingActionButton(
                heroTag: 'Start American',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AmericanCarPage()),
                  );
                },
                backgroundColor: Color(0xFFD9D9D9),
                child: Text(
                  'American style car',
                  style: TextStyle(fontSize: 24, fontFamily: 'Inter'),
                ),
              ),
            ),
            Divider(
              height: 30,
              color: Colors.black.withOpacity(0.1),
            ),
            Container(
              width: 280,
              height: 40,
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              child: FloatingActionButton(
                heroTag: 'Start Italian',
                onPressed: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ItalianCarPage()),
                    );
                  }
                },
                backgroundColor: Color(0xFFD9D9D9),
                child: Text(
                  'Italian style car',
                  style: TextStyle(fontSize: 24, fontFamily: 'Inter'),
                ),
              ),
            ),
            Divider(
              height: 30,
              color: Colors.black.withOpacity(0.1),
            ),
            Container(
              width: 280,
              height: 40,
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              child: FloatingActionButton(
                onPressed: () {
                  exit(0);
                },
                backgroundColor: Color(0xFFD9D9D9),
                child: Text(
                  'Exit',
                  style: TextStyle(fontSize: 24, fontFamily: 'Inter'),
                ),
              ),
            ),
          ],
        ));
  }
}
