import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  static final Data _singleton = Data._internal();

  factory Data() {
    return _singleton;
  }

  Data._internal();

  //project properties
  String _projectName = '1';
  String _E = '-1';
  String _h = '-1';
  String _fy = '-1';
  String _fyt = '-1';
  String _bw = '-1';
  String _projectDescription = '1';

  String get projectName => _projectName;

  set projectName(String value) {
    _projectName = value;
    notifyListeners();
  }

  String get E => _E;

  set E(String value) {
    _E = value;
    notifyListeners();
  }

  String get h => _h;

  set h(String value) {
    _h = value;
    notifyListeners();
  }

  String get fy => _fy;

  set fy(String value) {
    _fy = value;
    notifyListeners();
  }

  String get fyt => _fyt;

  set fyt(String value) {
    _fyt = value;
    notifyListeners();
  }

  String get bw => _bw;

  set bw(String value) {
    _bw = value;
    notifyListeners();
  }

  String get projectDescription => _projectDescription;

  set projectDescription(String value) {
    _projectDescription = value;
    notifyListeners();
  }

  //circles and trapezoids
  List<Map> _shapes = <Map>[];

  List<Map> get shapes => _shapes;

  Map getShapeWhere(key) {
    Map shape;
    _shapes.forEach((element) {
      if (element['key'] == key) shape = element;
    });
    //notifyListeners();
    return shape;
  }

  void addShape(Map shape) {
    shapes.add(shape);
    //notifyListeners();
  }

  void removeShape(Map shape) {
    shapes.remove(shape);
    //notifyListeners();
  }

  bool isInputDataOkay() {
    if (num.tryParse(E) != null &&
        num.tryParse(h) != null &&
        num.tryParse(fy) != null &&
        num.tryParse(fyt) != null &&
        num.tryParse(bw) != null)
      return num.tryParse(E) > 0 &&
          num.tryParse(h) > 0 &&
          num.tryParse(fy) > 0 &&
          num.tryParse(fyt) > 0 &&
          num.tryParse(bw) > 0;
    else
      return false;
  }

  bool isShapeDataOkay() {
    bool check = false;

    shapes.forEach((element) {
      if (element['shape'] == 'circle') {
        if (num.tryParse(element['radius']) !=
            null) if (num.tryParse(element['radius']) > 0)
          check = true;
        else
          check = false;
        else
          check = false;
      } else {
        if (num.tryParse(element['aTop']) != null &&
            num.tryParse(element['aBottom']) != null &&
            num.tryParse(element['aDepth']) !=
                null) if (num.tryParse(element['aTop']) > 0 &&
            num.tryParse(element['aBottom']) > 0 &&
            num.tryParse(element['aDepth']) > 0)
          check = true;
        else
          check = false;
        else
          check = false;
      }
    });

    return check;
  }
} //class
