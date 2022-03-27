import "package:flutter/material.dart";
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText = " ";

    if (result >= 30)
      resultText = "Obese";
    else if (result >= 25 && result < 30)
      resultText = "Overweight";
    else if (result >= 18.5 && result <= 24.9)
      resultText = "Normal";
    else {
      resultText = "Thin";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black, size: 26 //change your color here
            ),
        backgroundColor: Colors.pinkAccent,
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Result: ",
                style: Theme.of(context).textTheme.headline2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    height: 100.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Healthiness: $resultPhrase",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      axisLineStyle: const AxisLineStyle(
                        thickness: 0.1,
                        thicknessUnit: GaugeSizeUnit.logicalPixel,
                        color: Color.fromARGB(255, 210, 209, 212),
                      ),
                      startAngle: 180,
                      endAngle: 0,
                      interval: 10,
                      canScaleToFit: false,
                      showLabels: true,
                      showAxisLine: false,
                      showTicks: false,
                      minimum: 0,
                      maximum: 45,
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 25.1,
                            endValue: 45,
                            color: Color.fromARGB(255, 253, 7, 3),
                            label: 'Obese',
                            sizeUnit: GaugeSizeUnit.factor,
                            labelStyle: const GaugeTextStyle(
                                fontFamily: 'Times', fontSize: 20),
                            startWidth: 0.65,
                            endWidth: 0.65),
                        GaugeRange(
                          startValue: 18.5,
                          endValue: 25,
                          color: Color.fromARGB(255, 4, 134, 85),
                          label: 'Normal',
                          labelStyle:
                              GaugeTextStyle(fontFamily: 'Times', fontSize: 14),
                          startWidth: 0.65,
                          endWidth: 0.65,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                        GaugeRange(
                          startValue: 0,
                          endValue: 18.4,
                          color: Color.fromARGB(255, 41, 128, 241),
                          label: 'Thin',
                          labelStyle: const GaugeTextStyle(
                            fontFamily: 'Times',
                            fontSize: 20,
                          ),
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.65,
                          endWidth: 0.65,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: result,
                          enableAnimation: true,
                          animationDuration: 4500,
                          needleColor: Colors.white,
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Container(
                              child: Text(
                                "BMI = ${result.toStringAsFixed(1)}",
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            angle: 90,
                            positionFactor: 0.5)
                      ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
