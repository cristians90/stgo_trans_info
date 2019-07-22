import 'dart:convert';

import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:stgo_trans_info/models/predictorResponse.dart';

Future<String> _getTokenFromRedApi() async {
  final response = await http.get('https://www.red.cl/planifica');
  var document = parser.parse(response.body);
  var tokenElement = document.getElementById('token');
  var token = tokenElement.attributes['value'];
  print(token);
  return token;
}

Future<PredictorResponse> getStopInfo(String stopCode) async {
  final token = await _getTokenFromRedApi();
  final response = await http.get('https://www.red.cl/predictor/prediccion?t=$token&codsimt=$stopCode&codser=');
  final result = PredictorResponse.fromJson(json.decode(response.body));
  print(result.nomett);
  return result;
}