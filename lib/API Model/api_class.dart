import 'dart:convert';

import 'package:advice_status/API%20Model/model_api.dart';
import 'package:http/http.dart' as http;

// Future<String> getApiData() async {
//   var url = Uri.parse("https://api.adviceslip.com/advice");
//   final http.Response res = await http.get(url);

//   // Appropriate action depending upon the
//   // server response
//   if (res.statusCode == 200) {
//     return String.fromJson
//     print("Success");
//     final data = jsonDecode(res.body);

//     final advice = data.toString();
//     print(advice);
//   } else {
//     throw ("Error");
//   }
// }

Future<Welcome> getApiData() async {
  var url = Uri.parse("https://api.adviceslip.com/advice");
  final response = await http.get(url);
  var jsonData = jsonDecode(response.body);
  print(jsonData);
  if (response.statusCode == 200) {
    return Welcome.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed To Load");
  }
}
