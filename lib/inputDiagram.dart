import 'package:flutter/material.dart';

import 'data.dart';

class InputDiagram extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InputDiagramState();
}

class _InputDiagramState extends State<InputDiagram> {
  Data data = Data();
  final double width = 400;
  final double height = 200;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.deepPurple, // Set border color
              width: 3.0), // Set border width
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // Set rounded corner radius
        ),
        child: Center(
          child: CustomPaint(
              size: Size(width, height),
              painter: _ShapePainter(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    child: Icon(Icons.refresh),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {
  Data data = Data();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    double tHeight = 0;

    double maxWidth = 0;
    try {
      data.shapes.forEach((element) {
        if (element['shape'] == 'circle') {
          tHeight += num.parse(element['radius']).abs() * 2;
          if (2 * num.parse(element['radius']).abs() > maxWidth)
            maxWidth = num.parse(element['radius']).abs();
        } //if
        else {
          tHeight += num.parse(element['aDepth']).abs();
          if (num.parse(element['aTop']).abs() > maxWidth)
            maxWidth = num.parse(element['aTop']).abs();
          if (num.parse(element['aBottom']).abs() > maxWidth)
            maxWidth = num.parse(element['aBottom']).abs();
        } //else
      });

      double hScale = tHeight / size.height;
      double wScale = maxWidth / size.width;
      double scale = (wScale >= hScale) ? wScale : hScale;

      double y = 0;
      data.shapes.forEach((element) {
        if (element['shape'] == 'circle') {
          y += num.parse(element['radius']).abs() / scale;
          Offset start = Offset(size.width / 2, y);
          y += num.parse(element['radius']).abs() / scale;
          canvas.drawCircle(
              start, num.parse(element['radius']).abs() / scale, paint);
        } //if
        else {
          Offset p11 = Offset(
              size.width / 2 - num.parse(element['aTop']).abs() / scale / 2, y);
          Offset p21 = Offset(
              size.width / 2 + num.parse(element['aTop']).abs() / scale / 2, y);
          y += num.parse(element['aDepth']).abs() / scale;
          Offset p12 = Offset(
              size.width / 2 - num.parse(element['aBottom']).abs() / scale / 2,
              y);
          Offset p22 = Offset(
              size.width / 2 + num.parse(element['aBottom']).abs() / scale / 2,
              y);
          canvas.drawLine(p11, p12, paint);
          canvas.drawLine(p21, p22, paint);
          canvas.drawLine(p11, p21, paint);
          canvas.drawLine(p12, p22, paint);
        } //else
      });
    } catch (exc) {}
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
