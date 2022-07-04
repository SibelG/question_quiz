import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Question{
  String soruMetni;

  bool soruResponse;

  Question({required this.soruMetni,required this.soruResponse});
}