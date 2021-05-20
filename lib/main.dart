import 'package:concrete_section/data.dart';
import 'package:concrete_section/inputDiagram.dart';
import 'package:concrete_section/shapeData.dart';
import 'package:flutter/material.dart';

import 'inputs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concrete Section',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Concrete Section Analyzer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Data data = Data();

  void calculate() {
    if (data.isShapeDataOkay() && data.isInputDataOkay()) {
    } else {
      ScaffoldMessenger.of(context)
        ..showSnackBar(SnackBar(
          content: Text("Invalid Data"),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double pxWidth = MediaQuery.of(context).size.width;
    double dpr = MediaQuery.of(context).devicePixelRatio;
    double width = pxWidth / dpr;

    Widget body = (width > 350)
        ? Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Expanded(child: Input()),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ElevatedButton(
                        child: Text('Calculate'),
                        onPressed: calculate,
                      ),
                    ),
                  )
                ],
              )),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: ShapeData()),
                    Expanded(child: InputDiagram()),
                  ],
                ),
              )
            ],
          )
        : Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 0, 2, 1),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.deepPurple, // Set border color
                              width: 3.0), // Set border width
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        height: 300 * dpr,
                        child: Input(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.deepPurple, // Set border color
                              width: 3.0), // Set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // Set rounded corner radius
                        ),
                        height: 300 * dpr,
                        child: ShapeData(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        height: 300 * dpr,
                        child: InputDiagram(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: ElevatedButton(
                        child: Text('Calculate'),
                        onPressed: calculate,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
