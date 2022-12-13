import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'bmi_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_icon.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    GenderIcon('Male', FontAwesomeIcons.mars),
                    () => setState(() {
                      selectedGender = Gender.male;
                    }),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    GenderIcon('Female', FontAwesomeIcons.venus),
                    () => setState(() {
                      selectedGender = Gender.female;
                    }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: BMICard.named(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kTextStyle,
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          onChanged: (double newValue) => setState(() {
                            height = newValue.round();
                          }),
                          min: 120,
                          max: 220,
                        ),
                      ],
                    ),
                    tapFunction: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    kActiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                updateWeight: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                updateWeight: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                ),
                Expanded(
                  child: BMICard(
                    kActiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                updateWeight: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                updateWeight: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage()),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate BMI',
                  style: kNumberTextStyle.copyWith(
                    fontSize: 40,
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
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData? iconData;
  final VoidCallback? updateWeight;

  RoundIconButton({this.iconData, this.updateWeight});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: updateWeight,
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
