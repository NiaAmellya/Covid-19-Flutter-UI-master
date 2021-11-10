// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Scanner extends StatefulWidget{
//   @override 
//   _ScannerState createState() => _ScannerState();
// }

// class _ScannerState extends State<Scanner>{
//   @override 
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(color:  Colors.blue,),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               margin: EdgeInsets.only(top:60),
//               child: Text('Scanner', style:TextStyle(
//                 fontSize:18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white
//                  ),
//                  ),
//             ),
//           )
//           Align(alignment: Alignment.bottomCenter,
//           child: ButtonBar(alignment: MainAxisAlignment.spaceAround,
//           children: <Widget> [
//             IconButton(
//               color: Colors.white,
//               icon: Icon(Icons.flash_off),
//               onPressed: (){

//               },
//               ),
//             IconButton(
//               color: Colors.white,
//               icon: Icon(Icons.camera_rear),
//               onPressed: (){

//               },
//               ),
//             IconButton(
//               color: Colors.white,
//               icon: Icon(Icons.close),
//               onPressed: (){

//               },
//               ),
//           ],
//           ),)
//         ],
//         )
//     );
//   }
// }