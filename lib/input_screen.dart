import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'infor_screen.dart';

class InputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController ageController = TextEditingController();
    TextEditingController systolicController = TextEditingController();
    TextEditingController diastolicController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 224, 229, 235),
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Blood Pressure',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 14, 67, 117),
                ),
              ),
              Text(
                'Monitor',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 14, 67, 117),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 224, 229, 235),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Age',
                  style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 14, 67, 117)),
                decoration: InputDecoration(
                  labelText: 'Enter Your Age',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 146, 140, 140)),
                  filled: true,
                  fillColor: Color.fromARGB(255, 250, 247, 247),
                ),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Systolic',
                  style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: systolicController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 14, 67, 117)),
                decoration: InputDecoration(
                  labelText: 'Enter Systolic',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 146, 140, 140)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Diastolic',
                  style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: diastolicController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 14, 67, 117)),
                decoration: InputDecoration(
                  labelText: 'Enter Diastolic',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 146, 140, 140)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    String ageText = ageController.text.trim();
                    String systolicText = systolicController.text.trim();
                    String diastolicText = diastolicController.text.trim();

                    if (_isNumeric(ageText) &&
                        _isNumeric(systolicText) &&
                        _isNumeric(diastolicText)) {
                      int age = int.tryParse(ageText)!;
                      int systolic = int.tryParse(systolicText)!;
                      int diastolic = int.tryParse(diastolicText)!;
                      Get.to(InformationScreen(age, systolic, diastolic));
                    } else {
                      Get.snackbar(
                        'Invalid Data',
                        'Please enter correct values for Age, Systolic, and Diastolic.',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 90, 189, 147)),
                  ),
                  child: Text(
                    'Show Info',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Added 20 pixels of space
              SizedBox(height: 20), // Added another 20 pixels of space
            ],
          ),
        ),
      ),
    );
  }

  bool _isNumeric(String value) {
    return double.tryParse(value) != null;
  }
}
