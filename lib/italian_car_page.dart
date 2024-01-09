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
      // Фильтрация данных для получения только итальянских моделей
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
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(car['Model'],
            style: TextStyle(
              color: Colors.white,
              fontSize: screenHeight * 0.03,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            )),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(
            color: Colors.white,
            size: 40
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/image2.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(car['Image'],
            height: screenHeight *0.4),
            Divider(
              color: Colors.black.withOpacity(0.1),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: screenHeight * 0.35,
              width: screenWidth * 0.95,
              decoration: ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Text(
                car['Description'],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Inter',
                    height: 0),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.1),
              height: screenHeight * 0.035,
            ),
            Container(
              width: screenWidth * 0.7,
              height: screenHeight * 0.05,
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
                heroTag: 'GO ITALY',
                onPressed: goToNextModel,
                backgroundColor: Color(0xFFD9D9D9),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: screenHeight * 0.03, fontFamily: 'Inter'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
