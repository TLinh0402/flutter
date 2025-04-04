import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/components/icon_content.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/screens/results.dart';
import 'package:bmicalculator/components/bottom_buttom.dart';
import 'package:bmicalculator/components/round_icon_button.dart';
import 'package:bmicalculator/calculator_brand.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildGenderSelection(),
                    _buildHeightSlider(),
                    _buildWeightAndAge(),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 📌 **Widget chọn giới tính**
  Widget _buildGenderSelection() {
    return Row(
      children: <Widget>[
        Expanded(
          child: ReusableCard(
            onPress: () => setState(() => selectedGender = Gender.male),
            colour: selectedGender == Gender.male
                ? kActiveCardColour
                : kInactiveCardColour,
            cardChild: const IconContent(
              icon: FontAwesomeIcons.mars,
              label: 'MALE',
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            onPress: () => setState(() => selectedGender = Gender.female),
            colour: selectedGender == Gender.female
                ? kActiveCardColour
                : kInactiveCardColour,
            cardChild: const IconContent(
              icon: FontAwesomeIcons.venus,
              label: 'FEMALE',
            ),
          ),
        ),
      ],
    );
  }

  /// 📌 **Widget điều chỉnh chiều cao**
  Widget _buildHeightSlider() {
    return ReusableCard(
      colour: kActiveCardColour,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('HEIGHT', style: kLabelTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(height.toString(), style: kNumberTextStyle),
              const Text('cm', style: kLabelTextStyle),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              inactiveTrackColor: const Color(0xFF8D8E98),
              activeTrackColor: Colors.white,
              thumbColor: const Color(0xFFEB1555),
              overlayColor: const Color(0x29EB1555),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              value: height.toDouble(),
              min: 120.0,
              max: 220.0,
              onChanged: (double newValue) {
                setState(() {
                  height = newValue.round();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 📌 **Widget điều chỉnh cân nặng & tuổi**
  Widget _buildWeightAndAge() {
    return Row(
      children: <Widget>[
        _buildAdjustableCard('WEIGHT', weight, () {
          setState(() => weight--);
        }, () {
          setState(() => weight++);
        }),
        _buildAdjustableCard('AGE', age, () {
          setState(() => age--);
        }, () {
          setState(() => age++);
        }),
      ],
    );
  }

  /// 📌 **Widget tái sử dụng cho cân nặng & tuổi**
  Widget _buildAdjustableCard(
      String label, int value, VoidCallback onMinus, VoidCallback onPlus) {
    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(label, style: kLabelTextStyle),
            Text(value.toString(), style: kNumberTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                    icon: FontAwesomeIcons.minus, onPressed: onMinus),
                const SizedBox(width: 10.0),
                RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: onPlus),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
