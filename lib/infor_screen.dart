import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationScreen extends StatelessWidget {
  final int age;
  final int systolic;
  final int diastolic;

  InformationScreen(this.age, this.systolic, this.diastolic);

  @override
  Widget build(BuildContext context) {
    String category = getCategory(systolic, diastolic);
    Map<String, List<String>> ageRanges = getAgeRanges();

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
                'Information',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: 430,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Age: $age years',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'Systolic: $systolic mm Hg',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'Diastolic: $diastolic mm Hg',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Category: $category',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (age > 64) {
                  Get.snackbar(
                    'Invalid Data',
                    'Age above 64 is not allowed.',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  String ageRange = getAgeRange(age, ageRanges);
                  showInfoDialog(context, ageRange, ageRanges[ageRange]!);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 90, 189, 147)),
                minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)),
              ),
              child: Text(
                'More Information',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getCategory(int systolic, int diastolic) {
    if (systolic < 120 && diastolic < 80) {
      return 'Normal';
    } else if (systolic >= 120 && systolic <= 129 && diastolic < 80) {
      return 'Elevated';
    } else if ((systolic >= 130 && systolic <= 139) ||
        (diastolic >= 80 && diastolic <= 89)) {
      return 'Hypertension Stage 1';
    } else if (systolic >= 140 || diastolic >= 90) {
      return 'Hypertension Stage 2';
    } else {
      return 'Hypertensive Crisis';
    }
  }

  Map<String, List<String>> getAgeRanges() {
    return {
      '1 to 5 years': ['80/55', '95/65', '110/79'],
      '6 to 13 years': ['90/60', '105/70', '115/80'],
      '14 to 19 years': ['105/73', '117/77', '120/81'],
      '20 to 24 years': ['108/75', '120/79', '132/83'],
      '25 to 29 years': ['109/76', '121/80', '133/84'],
      '30 to 34 years': ['110/77', '122/81', '134/85'],
      '35 to 39 years': ['111/78', '123/82', '135/86'],
      '40 to 44 years': ['112/79', '125/83', '137/87'],
      '45 to 49 years': ['115/80', '127/84', '139/88'],
      '50 to 54 years': ['116/81', '129/85', '142/89'],
      '55 to 59 years': ['118/82', '131/86', '144/90'],
      '60 to 64 years': ['121/83', '134/87', '147/91'],
      // Define other age ranges here
    };
  }

  String getAgeRange(int age, Map<String, List<String>> ageRanges) {
    if (age >= 1 && age <= 5) {
      return '1 to 5 years';
    }
    if (age >= 6 && age <= 13) {
      return '6 to 13 years';
    }
    if (age >= 14 && age <= 19) {
      return '14 to 19 years';
    }
    if (age >= 20 && age <= 24) {
      return '20 to 24 years';
    }
    if (age >= 25 && age <= 29) {
      return '25 to 29 years';
    }
    if (age >= 30 && age <= 34) {
      return '30 to 34 years';
    }
    if (age >= 35 && age <= 39) {
      return '35 to 39 years';
    }
    if (age >= 40 && age <= 44) {
      return '40 to 44 years';
    }
    if (age >= 45 && age <= 49) {
      return '45 to 49 years';
    }
    if (age >= 50 && age <= 54) {
      return '50 to 54 years';
    }
    if (age >= 55 && age <= 59) {
      return '55 to 59 years';
    }
    if (age >= 60 && age <= 64) {
      return '60 to 64 years';
    }
    return 'Other age range';
  }

  void showInfoDialog(BuildContext context, String ageRange, List<String> values) {
    if (values.length >= 3) {
      Get.defaultDialog(
        title: 'Blood Pressure Information for $ageRange',
        content: Column(
          children: [
            Text(
              'Minimum: ${values[0]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24), // Increased text size
            ),
            Text(
              'Normal: ${values[1]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24), // Increased text size
            ),
            Text(
              'Maximum: ${values[2]}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24), // Increased text size
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Set background color to grey
        confirm: ElevatedButton(
          onPressed: () => Get.back(),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 238, 131, 63)),
            minimumSize: MaterialStateProperty.all<Size>(Size(100, 60)),
          ),
          child: Text(
            'Ok',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      );
    } else {
      // Handle the case where values is null or does not have enough elements
      print('Error: Invalid values list');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: InformationScreen(30, 120, 80), // Example data for age, systolic, and diastolic
  ));
}
