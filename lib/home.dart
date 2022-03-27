import 'dart:async';
import "dart:math";
import 'package:flutter/material.dart';
import 'package:flutter_bmi/result.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<MyHomePage> {
  bool isMale = true;
  int weight = 55;
  int age = 20;
  double heighVal = 190;
  Timer? timer;
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    genderCart(context, "male"),
                    const SizedBox(
                      width: 15,
                    ),
                    genderCart(context, "female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Open Sans',
                            fontSize: 40,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              heighVal.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Open Sans',
                                fontSize: 40,
                              ),
                            ),
                            const Text(
                              "cm",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Open Sans',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                            value: heighVal,
                            activeColor: Colors.black,
                            inactiveColor: Colors.white,
                            thumbColor: Colors.red,
                            onChanged: (newValue) {
                              setState(() {
                                heighVal = newValue;
                              });
                            },
                            min: 90,
                            max: 220)
                      ]),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    infoCart(context, "weight"),
                    const SizedBox(
                      width: 15,
                    ),
                    infoCart(context, "age"),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 12,
              color: Colors.pinkAccent,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow(heighVal / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Result(age: 25, isMale: isMale, result: result);
                    }),
                  );
                },
                child: Text(
                  "Calculate",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded genderCart(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => {isMale = (type == "male") ? true : false}),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == "male") || (!isMale && type == "female")
                ? Colors.pinkAccent
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == "male" ? Icons.male : Icons.female),
              const SizedBox(height: 15),
              Text(type == "male" ? "Male" : "Female",
                  style: Theme.of(context).textTheme.headline1),
            ],
          ),
        ),
      ),
    );
  }

  Expanded infoCart(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type == "age" ? "Age" : "Weight",
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 15),
            Text(type == "age" ? "$age" : "$weight",
                style: Theme.of(context).textTheme.headline1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: FloatingActionButton(
                      heroTag: type == "age" ? "age++" : "weight++",
                      onPressed: () =>
                          setState(() => type == "age" ? age++ : weight++),
                      child: const Icon(Icons.add),
                      mini: true),
                  onLongPressStart: (_) async {
                    isPressed = true;
                    do {
                      type == "age" ? age++ : weight++;
                      print('long pressing'); // for testing
                      await Future.delayed(const Duration(milliseconds: 30));
                    } while (isPressed);
                  },
                  onLongPressEnd: (_) => setState(() => isPressed = false),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  child: FloatingActionButton(
                      heroTag: type == "age" ? "age--" : "wieght--",
                      onPressed: () =>
                          setState(() => type == "age" ? age-- : weight--),
                      child: const Icon(Icons.remove),
                      mini: true),
                  onLongPressStart: (_) async {
                    isPressed = true;
                    do {
                      type == "age" ? age-- : weight--;
                      print('long pressing'); // for testing
                      await Future.delayed(const Duration(milliseconds: 30));
                    } while (isPressed);
                  },
                  onLongPressEnd: (_) => setState(() => isPressed = false),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
