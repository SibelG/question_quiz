import 'Question.dart';
import 'package:http/http.dart' as http;

class test_data{

  int _soruIndex=0;
  List<Question> _soruBank=[
    Question(soruMetni:"A", soruResponse:false),
    Question(soruMetni:"B", soruResponse:true),
    Question(soruMetni:"C", soruResponse:false),
    Question(soruMetni:"D", soruResponse:true),
    Question(soruMetni:"E", soruResponse:true),
    Question(soruMetni:"F", soruResponse:false),

  ];

  String getSoruText (){
    return _soruBank[_soruIndex].soruMetni;

  }
  bool getSoruResponse(){
    return _soruBank[_soruIndex].soruResponse;

  }
  void nextQuestion(){
    if(_soruIndex<_soruBank.length-1){
      _soruIndex++;
    }
  }
  bool textFinished(){
    if(_soruIndex>=_soruBank.length-1)
      return true;
    else
      return false;

  }
  void textZeros(){
    _soruIndex=0;
  }
}