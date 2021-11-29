import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/bottom_button.dart';
import '../widgets/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key, this.bmiResult, this.resultText, this.interpretation})
      : super(key: key);

  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double horizontalBoxHeight = height * 0.10;

    double width = MediaQuery.of(context).size.width;
    double horizontalBoxWidth = width * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText == null ? '' : resultText!.toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiResult == null ? '' : bmiResult!,
                    style: bMITextStyle,
                  ),
                  Text(
                    interpretation == null ? '' : interpretation!,
                    textAlign: TextAlign.center,
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
            horizontalBoxHeight: horizontalBoxHeight,
            horizontalBoxWidth: horizontalBoxWidth,
          )
        ],
      ),
    );
  }
}
