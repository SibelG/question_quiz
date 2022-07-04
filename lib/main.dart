import 'dart:html';

import 'package:flutter/material.dart';
import './constant.dart';
import './test_data.dart';
import 'package:http/http.dart' as http;


void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SoruSayfasi(),
                ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(

      onPressed: () {  },
      child: const Text('Show Dialog'),
    );
  }
}

class _SoruSayfasiState extends State<SoruSayfasi> {

  List<Widget>IconMood=[
  ];
  // List<String>questions=["A","B","C","D","E","F"];
  //
  // List<bool>responses=[false,true,false,true,true,false];
  // Question q1=Question(soruMetni:"A", soruResponse:false);
  // Question q2=Question(soruMetni:"B", soruResponse:true);
  // Question q3=Question(soruMetni:"C", soruResponse:false);
  // Question q4=Question(soruMetni:"D", soruResponse:true);
  // Question q5=Question(soruMetni:"E", soruResponse:true);
  // Question q6=Question(soruMetni:"F", soruResponse:false);

  int soruIndex=0;
  test_data data=test_data();
  void buttonFunction(bool value){
    if(data.textFinished()){
     showDialog(
         context: context,
         builder: (BuildContext context)
     {
       return AlertDialog(
         title: const Text('Text Questions Finished!!'),
         //content: const Text('AlertDialog description'),
         actions: <Widget>[

           new FlatButton(
               child: new Text("Repeat Start"),
               onPressed:(){
                 Navigator.of(context).pop();
                 setState(() {
                   data.textZeros();
                   IconMood=[];
                 });

               })


         ],
       );

     },
     );

 }else{
      bool trueResponse=data.getSoruResponse();

      setState((){
        trueResponse==value?IconMood.add(yanlisIcon):IconMood.add(dogruIcon);
        data.nextQuestion();
        // if(trueResponse==false)
        //   IconMood.add(yanlisIcon);
        // else
        //
        //   IconMood.add(dogruIcon);

      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                data.getSoruText(),
                textAlign: TextAlign.center,                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(spacing:3,runSpacing:3,children: IconMood),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                           buttonFunction(false);



                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            buttonFunction(true);
                          },
                        ))),
              ])),
        ),

      ],
    );
  }
}

