import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;


class ItalianCarPage extends StatefulWidget {
  @override
  _ItalianCarPageState createState() => _ItalianCarPageState();
}

class _ItalianCarPageState extends State<ItalianCarPage> {
  int currentIndex = 0;
  List<Map<String, dynamic>> italianCars = [];

  @override
  void initState() {
    super.initState();
    loadCarData();
  }

  Future<void> loadCarData() async {
    // Загрузка JSON-файла и декодирование в список
    final String response = await rootBundle.loadString('assets/models.json');
    final data = await json.decode(response);
    setState(() {
      // Фильтрация данных для получения только американских моделей
      italianCars = List<Map<String, dynamic>>.from(data)
          .where((car) => car['Origin'] == 'Italian')
          .toList();
    });
  }

  void goToNextModel() {
    setState(() {
      currentIndex = (currentIndex + 1) % italianCars.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (italianCars.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading...'),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final car = italianCars[currentIndex];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black.withOpacity(0.1),
        child: const Image(
          image: AssetImage('assets/images/Polygon1.png'),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/image2.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(car['Model'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                )),
            Divider(
              color: Colors.black.withOpacity(0.1),
            ),
            Image.asset(car['Image']),
            Divider(
              color: Colors.black.withOpacity(0.1),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 280,
              width: 375,
              decoration: ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Text(
                car['Description'],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    height: 0),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.1),
              height: 30,
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
                onPressed: goToNextModel,
                backgroundColor: Color(0xFFD9D9D9),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 24, fontFamily: 'Inter'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}