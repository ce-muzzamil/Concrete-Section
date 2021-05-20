import 'package:flutter/material.dart';

import 'constants.dart';
import 'data.dart';

class ShapeData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShapeDataState();
}

class _ShapeDataState extends State<ShapeData> {
  Data data = Data();
  List<Row> shapeData = <Row>[];

  void addShapeData(
    String shape,
  ) {
    UniqueKey key = UniqueKey();
    data.addShape({
      'key': key,
      'shape': shape,
      'radius': '-1',
      'aTop': '-1',
      'aBottom': '-1',
      'aDepth': '-1'
    });

    if (shape == 'circle') {
      Row iData = Row(
        key: key,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(2),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    data.getShapeWhere(key)['radius'] = text;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Radius',
                  border: OutlineInputBorder(),
                  helperText:
                      num.tryParse(data.getShapeWhere(key)['radius']) == null
                          ? 'Invalid number'
                          : null,
                  helperStyle: TextStyle(
                    color: Constants.errorColor,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  shapeData.removeWhere((element) => element.key == key);
                  data.removeShape(data.getShapeWhere(key));
                });
              }),
        ],
      );

      setState(() {
        shapeData.add(iData);
      });
    } //if
    else {
      Row iData = Row(
        key: key,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(2),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    data.getShapeWhere(key)['aTop'] = text;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Top width',
                  border: OutlineInputBorder(),
                  helperText:
                      num.tryParse(data.getShapeWhere(key)['aTop']) == null
                          ? 'Invalid number'
                          : null,
                  helperStyle: TextStyle(
                    color: Constants.errorColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(2),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    data.getShapeWhere(key)['aBottom'] = text;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Bottom width',
                  border: OutlineInputBorder(),
                  helperText:
                      num.tryParse(data.getShapeWhere(key)['aBottom']) == null
                          ? 'Invalid number'
                          : null,
                  helperStyle: TextStyle(
                    color: Constants.errorColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(2),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    data.getShapeWhere(key)['aDepth'] = text;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Depth of trapezoid',
                  border: OutlineInputBorder(),
                  helperText:
                      num.tryParse(data.getShapeWhere(key)['aDepth']) == null
                          ? 'Invalid number'
                          : null,
                  helperStyle: TextStyle(
                    color: Constants.errorColor,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  shapeData.removeWhere((element) => element.key == key);
                  data.removeShape(data.getShapeWhere(key));
                });
              }),
        ],
      );

      setState(() {
        shapeData.add(iData);
      });
    } //else
  } //addShapeData

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 3, 3, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  border: Border.all(
                      color: Colors.deepPurple, width: 3.0), // Set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0)), // Set rounded corner radius
                ),
                width: double.infinity,
                height: 30,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Define Shape',
                      style: TextStyle(color: Colors.white),
                    )),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: ElevatedButton(
                              onPressed: () => addShapeData('circle'),
                              child: Text('Circle')),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: ElevatedButton(
                              onPressed: () => addShapeData('trapezoid'),
                              child: Text('Trapezoid')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(3),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  children: [...shapeData],
                ),
              ),
            ))
          ],
        ));
  }
}
