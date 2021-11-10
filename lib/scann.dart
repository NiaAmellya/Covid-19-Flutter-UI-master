import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Scan extends StatefulWidget{
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan>{
  String text = 'Hasil Scan';
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr Qode Scanner'),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            SizedBox(
              height:  20,
            )
            RaisedButton(child: Text('Scan'), onPressed: () async{
              text = await scanner.scan();
              setState(() {
                
              });
            }),
          ],
        ),
        ),
    );
  }

}