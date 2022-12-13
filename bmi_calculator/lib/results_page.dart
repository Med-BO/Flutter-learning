import 'package:bmi_calculator/bmi_card.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  double BMI = 0;
  String resultStatus = "";
  String resultDescription = "";

  ResultsPage(this.selectedGender, this.height, this.weight, this.age) {
    BMI = weight / ((height / 100) * (height / 100));
    if (BMI < 25) {
      resultStatus = "Fit";
      resultDescription = "You are within the fit range. Keep it up my dude";
    } else {
      resultStatus = "Overweight";
      resultDescription =
          "You so fat when you walked by the TV,    I missed 3 episodes";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Your result:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100.0,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kActiveCardColour,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultStatus.toUpperCase(),
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      BMI.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      resultDescription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputPage()),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Recalculate BMI',
                    style: kNumberTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
