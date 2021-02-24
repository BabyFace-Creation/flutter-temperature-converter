import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Output extends StatelessWidget {
  const Output({
    Key key,
    @required double kelvin,
    @required double reamur,
  })  : _kelvin = kelvin,
        _reamur = reamur,
        super(key: key);

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 150,
              child: Text("Suhu Dalam Kelvin"),
              margin: EdgeInsets.all(8),
            ),
            Container(
              width: 250,
              height: 150,
              child: Text(
                '$_kelvin',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.all(8),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 150,
              child: Text("Suhu Dalam Reamur"),
              margin: EdgeInsets.all(8),
            ),
            Container(
              width: 250,
              height: 150,
              child: Text('$_reamur',
                  style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
              margin: EdgeInsets.all(8),
            )
          ],
        ),
      ],
    );
  }
}
