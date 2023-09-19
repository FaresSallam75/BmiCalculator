import 'package:bmi_calculator/app_utilities/constants.dart';
import 'package:bmi_calculator/app_widgets/reusable_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultsPage extends StatelessWidget {
  var bmiResult;
  var resultText;
  var resultInterpretation;
  var gender;
  var age;
  ResultsPage(
      {super.key,
      this.bmiResult,
      this.resultText,
      this.resultInterpretation,
      this.gender,
      this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            )),
            Expanded(
              flex: 5,
              child: ReusableCard(
                culor: activeCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Healthiness: $resultText',
                      style: kResultTextStyle,
                    ),
                    Text(
                      'Age: $age',
                      style: kResultTextStyle,
                    ),
                    Text(
                      'Gender: $gender',
                      style: kResultTextStyle,
                    ),
                    Text(
                      'Result: $bmiResult',
                      style: kTitleTextStyle.copyWith(color: Colors.green),
                    ),
                    Text(
                      'Report: $resultInterpretation',
                      style: kbodyTextStyle.copyWith(color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 60,
                margin: const EdgeInsets.only(
                    top: 10.0, right: 15, left: 15, bottom: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.shade700,
                ),
                child: const Text(
                  'RE-Calculate',
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
