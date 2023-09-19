import 'package:bmi_calculator/app_utilities/constants.dart';
import 'package:bmi_calculator/app_widgets/icon_content.dart';
import 'package:bmi_calculator/app_widgets/reusable_card.dart';
import 'package:bmi_calculator/screens/Results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color maleCardColour = inActiveCardColor;
  Color feMaleCardColour = inActiveCardColor;
  var height = 122;
  var weight = 90;
  var age = 26;
  var gen = "";

  void updateCardColor(int gender) {
    if (gender == 1) {
      if (maleCardColour == inActiveCardColor) {
        maleCardColour = activeCardColor;
        feMaleCardColour = inActiveCardColor;
      } else {
        maleCardColour = inActiveCardColor;
      }
      gen = "Male";
    }
    // Female
    if (gender == 2) {
      if (feMaleCardColour == inActiveCardColor) {
        feMaleCardColour = activeCardColor;
        maleCardColour = inActiveCardColor;
      } else {
        feMaleCardColour = inActiveCardColor;
      }
      gen = "Female";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor:const Color(0xff1D1E35),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          onTab: () {
                            setState(() {
                              updateCardColor(1);
                            });
                          },
                          culor: maleCardColour,
                          cardChild: IconContent(
                              icon: FontAwesomeIcons.male, txt: 'MALE'),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          onTab: () {
                            setState(() {
                              updateCardColor(2);
                            });
                          },
                          culor: feMaleCardColour,
                          cardChild: IconContent(
                              icon: FontAwesomeIcons.female, txt: 'FEMALE'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    culor: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
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
                           const Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          onChanged: (currentVal) {
                            setState(() {
                              height = currentVal.toInt();
                            });
                          },
                          min: 0,
                          max: 200,
                          activeColor: const Color(0XFFEB1555),
                          inactiveColor: const Color(0XFFEB1599),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          culor: activeCardColor,
                          cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               const Text(
                                  'WEIGHT',
                                  style: kLabelTextStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      backgroundColor: Colors.grey.shade700,
                                      heroTag: 'btn1',
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      tooltip: 'Increment',
                                      child: const Icon(
                                        Icons.add,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                   const SizedBox(width: 15),
                                    FloatingActionButton(
                                      backgroundColor: Colors.grey.shade700,
                                      heroTag: 'btn2',
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      tooltip: 'Increment',
                                      child: const Icon(
                                        Icons.remove,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          culor: activeCardColor,
                          cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                const Text(
                                  'AGE',
                                  style: kLabelTextStyle,
                                ),
                                Text(
                                  age.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                      backgroundColor: Colors.grey.shade700,
                                      heroTag: 'btn3',
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      tooltip: 'Increment',
                                      child: const Icon(
                                        Icons.add,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    FloatingActionButton(
                                        heroTag: 'btn4',
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                          });
                                        },
                                        tooltip: 'Increment',
                                        backgroundColor: Colors.grey.shade700,
                                        child: const Icon(
                                          Icons.remove,
                                          size: 35,
                                          color: Colors.white,
                                        ),),
                                  ],
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              var bmiRes = weight / ((height / 100) * (height / 100));
              var resultTxt = "";
              var resultInterpre = "";

              if (bmiRes >= 30) {
                resultTxt = 'Obese';
                resultInterpre = "You Should to do excercise";
              } else if (bmiRes >= 25 && bmiRes < 30) {
                resultTxt = 'Overweight';
                resultInterpre = "You Should to Go Gym";
              } else if (bmiRes >= 18.5 && bmiRes < 24.9) {
                resultTxt = 'Normal';
                resultInterpre = "Your Health is Good";
              } else {
                resultTxt = 'Thin';
                resultInterpre = "You should to Eat Too Much";
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: bmiRes.toStringAsFixed(1),
                    resultInterpretation: resultInterpre,
                    resultText: resultTxt,
                    gender: gen,
                    age: age,
                  ),
                ),
              );
            }, //Color(0XFFEB1555)
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade700,
              ),
              margin:
                 const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              width: double.infinity,
              height: 60.0,
              child:  const Center(
                child: Text('CALCULATE', style: kLargeButtonTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
