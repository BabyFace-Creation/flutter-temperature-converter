import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Input.dart';
import 'Output.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _kelvin = 0;
  double _reamur = 0;
  double input;
  final inputCont = TextEditingController();

  void _convert() {
    input = double.parse(inputCont.text);
    _kelvin = 0;
    _reamur = 0;
    _kelvin += input + 273.15;
    _reamur += 4 / 5 * input;
    _output();
  }

  void _output() {
    setState(() {
      double k = num.parse(_kelvin.toStringAsFixed(2));
      double r = num.parse(_reamur.toStringAsFixed(2));
      _kelvin = k;
      _reamur = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Converter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(inputCont: inputCont),
              Expanded(child: Output(kelvin: _kelvin, reamur: _reamur)),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  child: Text('Konversi'),
                  color: Colors.blue,
                  onPressed: _convert,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class Output extends StatelessWidget {
//   const Output({
//     Key key,
//     @required double kelvin,
//     @required double reamur,
//   })  : _kelvin = kelvin,
//         _reamur = reamur,
//         super(key: key);

//   final double _kelvin;
//   final double _reamur;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 250,
//               height: 150,
//               child: Text("Suhu Dalam Kelvin"),
//               margin: EdgeInsets.all(8),
//             ),
//             Container(
//               width: 250,
//               height: 150,
//               child: Text(
//                 '$_kelvin',
//                 style: TextStyle(fontSize: 30),
//                 textAlign: TextAlign.center,
//               ),
//               margin: EdgeInsets.all(8),
//             )
//           ],
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 250,
//               height: 150,
//               child: Text("Suhu Dalam Reamur"),
//               margin: EdgeInsets.all(8),
//             ),
//             Container(
//               width: 250,
//               height: 150,
//               child: Text('$_reamur',
//                   style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
//               margin: EdgeInsets.all(8),
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }

// class Input extends StatelessWidget {
//   const Input({
//     Key key,
//     @required this.inputCont,
//   }) : super(key: key);

//   final TextEditingController inputCont;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: inputCont,
//       decoration: InputDecoration(labelText: 'Masukkan Suhu Dalam Celcius'),
//       keyboardType:
//           TextInputType.numberWithOptions(decimal: true, signed: false),
//       inputFormatters: <TextInputFormatter>[
//         FilteringTextInputFormatter.allow(RegExp(r'[0-9+\.]'))
//       ],
//     );
//   }
// }
