import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'widgets/icon_content.dart';
import 'widgets/reusable_card.dart';

enum BioGender { male, female, none }

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  BioGender selectedGender = BioGender.none;
  int heightSlider = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double horizontalBoxHeight = height * 0.10;

    double width = MediaQuery.of(context).size.width;
    double horizontalBoxWidth = width * 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = BioGender.male;
                      });
                    },
                    colour: selectedGender == BioGender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      horizontalBoxHeight: horizontalBoxHeight,
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = BioGender.female;
                      });
                    },
                    colour: selectedGender == BioGender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconContent(
                      horizontalBoxHeight: horizontalBoxHeight,
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'HEIGHT',
                          style: LabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              heightSlider.toString(),
                              style: NumberTextStyle,
                            ),
                            const Text(
                              'cm',
                              style: LabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: activeTrackColorSlider,
                            inactiveTrackColor: inactiveTrackColorSlider,
                            thumbColor: activeColorSlider,
                            overlayColor: overlayColorSlider,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0),
                          ),
                          child: Slider(
                              value: heightSlider.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  heightSlider = newValue.round();
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: LabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: NumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: LabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: NumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: horizontalBoxWidth,
            height: horizontalBoxHeight,
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({Key? key, this.icon, this.onPressed}) : super(key: key);

  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(icon),
      style: ElevatedButton.styleFrom(
        primary: RoundIconButtonColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
      ),
      onPressed: onPressed ?? () {},
    );
  }
}
