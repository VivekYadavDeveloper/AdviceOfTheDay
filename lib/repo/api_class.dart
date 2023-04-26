import 'dart:convert';

import 'package:advice_status/API%20Model/advice_model.dart';
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

// Future<AdviceModel> getApiData() async {
//   var url = Uri.parse("https://api.adviceslip.com/advice");
//   final response = await http.get(url);
//   var jsonData = jsonDecode(response.body);
//   print(jsonData);
//   if (response.statusCode == 200) {
//     return AdviceModel.fromJson(json.decode(response.body));
//   } else {
//     throw Exception("Failed To Load");
//   }
// }

class AdviceRepo {
  Future<AdviceModel> getAdviceData() async {
    var endPointUrl = "https://api.adviceslip.com/advice";
    var response = await http.get(Uri.parse(endPointUrl));
    if (response.statusCode == 200) {
      return adviceModelFromJson(response.body);
    } else {
      throw ("Faild To Load Server");
    }
  }
}
