import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
          title: const Text(
            'DICE ROLLER',
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontWeight: FontWeight.normal,
              fontSize: 20.0,
              letterSpacing: 2.0,
            ),
          ),
        ),
        body: const DiceContainer(),
      ),
    );
  }
}

class DiceContainer extends StatefulWidget {
  const DiceContainer({Key? key}) : super(key: key);

  @override
  State<DiceContainer> createState() => _DiceContainerState();
}

class _DiceContainerState extends State<DiceContainer> {
  int diceSides = 6;
  int diceImageValue = 1;
  bool fourSidedVisibility = true;
  bool sixSidedVisibility = true;
  bool eightSidedVisibility = true;
  bool tenSidedVisibility = true;
  bool twelveSidedVisibility = true;
  bool twentySidedVisibility = true;
  bool diceButtonVisibility = false;
  bool resetButtonVisibility = false;
  bool selectDiceSizeVisibility = true;
  bool rollDiceVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Visibility(
                  visible: fourSidedVisibility,
                  child: TextButton(
                    onPressed: () {
                      setDiceVisibility(4);
                    },
                    child: Image.asset(
                      'images/4.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: sixSidedVisibility,
                  child: TextButton(
                    onPressed: () {
                      setDiceVisibility(6);
                    },
                    child: Image.asset(
                      'images/6.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: eightSidedVisibility,
                  child: TextButton(
                    onPressed: () {
                      setDiceVisibility(8);
                    },
                    child: Image.asset(
                      'images/8.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: tenSidedVisibility,
                  child: TextButton(
                    onPressed: () {
                      setDiceVisibility(10);
                    },
                    child: Image.asset(
                      'images/10.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: twelveSidedVisibility,
                  child: TextButton(
                    onPressed: () {
                      setDiceVisibility(12);
                    },
                    child: Image.asset(
                      'images/12.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: twentySidedVisibility,
                  child: TextButton(
                    onPressed: () {
                      setDiceVisibility(20);
                    },
                    child: Image.asset(
                      'images/20.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: selectDiceSizeVisibility,
            child: Text(
              'Select size of dice.',
              style: TextStyle(
                color: Colors.blueGrey.shade800,
                fontFamily: 'SourceSansPro',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
          Visibility(
            visible: rollDiceVisibility,
            child: Text(
              'Press the dice to roll.',
              style: TextStyle(
                color: Colors.blueGrey.shade800,
                fontFamily: 'SourceSansPro',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
          Visibility(
            visible: diceButtonVisibility,
            child: TextButton(
              onPressed: () {
                setState(() {
                  diceImageValue = Random().nextInt(diceSides) + 1;
                });
              },
              child: Image.asset('images/$diceImageValue.png'),
            ),
          ),
          Visibility(
            visible: resetButtonVisibility,
            child: TextButton(
              onPressed: () {
                setState(() {
                  fourSidedVisibility = true;
                  sixSidedVisibility = true;
                  eightSidedVisibility = true;
                  tenSidedVisibility = true;
                  twelveSidedVisibility = true;
                  twentySidedVisibility = true;
                  diceImageValue = 1;
                  diceButtonVisibility = false;
                  resetButtonVisibility = false;
                  selectDiceSizeVisibility = true;
                  rollDiceVisibility = false;
                });
              },
              child: Text(
                'Reset',
                style: TextStyle(
                  color: Colors.blueGrey.shade800,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sets the number of sides of dice and updates ui
  void setDiceVisibility(int selectedDice) {
    setState(() {
      switch (selectedDice) {
        case 4:
          diceSides = 4;
          break;
        case 6:
          diceSides = 6;
          break;
        case 8:
          diceSides = 8;
          break;
        case 10:
          diceSides = 10;
          break;
        case 12:
          diceSides = 12;
          break;
        case 20:
          diceSides = 20;
          break;
      }

      if (selectedDice != 4) {
        fourSidedVisibility = false;
      }

      if (selectedDice != 6) {
        sixSidedVisibility = false;
      }

      if (selectedDice != 8) {
        eightSidedVisibility = false;
      }

      if (selectedDice != 10) {
        tenSidedVisibility = false;
      }

      if (selectedDice != 12) {
        twelveSidedVisibility = false;
      }

      if (selectedDice != 20) {
        twentySidedVisibility = false;
      }

      diceButtonVisibility = true;
      resetButtonVisibility = true;
      selectDiceSizeVisibility = false;
      rollDiceVisibility = true;
    });
  }
}
