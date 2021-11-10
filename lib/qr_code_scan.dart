// import 'dart:html';
// import 'package:covid_19/scanner.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Qr_Code extends StatefulWidget {
//   @override
//   _Qr_CodeState createState() => _Qr_CodeState();
// }

// class _Qr_CodeState extends State<Qr_Code> {
//   String _result;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Qr Qode Scanner'),
//       ),
//       body: Center(
//         child: Text(
//           _result != null ? _result : 'Data',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.center_focus_strong),
//         onPressed: _openScanner,
//       ),
//     );
//   }

//   void _openScanner() {
//     Navigator.push(context, MaterialPageRoute(builder: (c) => Scanner()));
//   }
// }
