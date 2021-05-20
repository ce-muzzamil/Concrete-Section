import 'package:concrete_section/constants.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'constants.dart';

class Input extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  Data data = Data();
  String _eHelperText;
  String _hHelperText;
  String _fyHelperText;
  String _fytHelperText;
  String _bwHelperText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(3),
            child: TextField(
              onChanged: (text) {
                data.projectName = text;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Project Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: TextField(
              onChanged: (text) {
                data.E = text;
                setState(() {
                  _eHelperText =
                      num.tryParse(data.E) == null ? "Invalid number" : null;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Modulus of Elasticity of rebars [ksi]',
                border: OutlineInputBorder(),
                helperText: _eHelperText,
                helperStyle: TextStyle(
                  color: Constants.errorColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: TextField(
              onChanged: (text) {
                data.h = text;
                setState(() {
                  _hHelperText =
                      num.tryParse(data.h) == null ? "Invalid number" : null;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Total depth of section [in]',
                border: OutlineInputBorder(),
                helperText: _hHelperText,
                helperStyle: TextStyle(
                  color: Constants.errorColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: TextField(
              onChanged: (text) {
                data.fy = text;
                setState(() {
                  _fyHelperText =
                      num.tryParse(data.fy) == null ? "Invalid number" : null;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Yield strength of rebars [ksi]',
                border: OutlineInputBorder(),
                helperText: _fyHelperText,
                helperStyle: TextStyle(
                  color: Constants.errorColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: TextField(
              onChanged: (text) {
                data.fyt = text;
                setState(() {
                  _fytHelperText =
                      num.tryParse(data.fyt) == null ? "Invalid number" : null;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Yield strength of sheet bars [ksi]',
                border: OutlineInputBorder(),
                helperText: _fytHelperText,
                helperStyle: TextStyle(
                  color: Constants.errorColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: TextField(
              onChanged: (text) {
                data.bw = text;
                setState(() {
                  _bwHelperText =
                      num.tryParse(data.bw) == null ? "Invalid number" : null;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Width of the web to be used in shear',
                  border: OutlineInputBorder(),
                  helperText: _bwHelperText,
                  helperStyle: TextStyle(
                    color: Constants.errorColor,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3),
            child: TextField(
              onChanged: (text) {
                data.projectDescription = text;
              },
              keyboardType: TextInputType.text,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Description for the project',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
