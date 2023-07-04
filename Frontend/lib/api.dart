import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mainproject/exc.dart';

final String ip = "10.100.47.69";

class SendRequest {
  final String resp;
  final int out;
  final int temp;
  final int hr;

  const SendRequest(
      {required this.resp,
      required this.out,
      required this.temp,
      required this.hr});

  factory SendRequest.fromJson(Map<String, dynamic> json) {
    return SendRequest(
        resp: json['Response'] as String,
        out: json['Output'],
        temp: json['Temp'],
        hr: json['HR']);
  }
}

Future<List> send_request(int sp) async {
  var list = [];
  try {
    final response = await http.post(
        Uri.parse('http://' + ip + ':5000/mlmodel/'),
        headers: {"content-type": "application/json"},
        body: jsonEncode({'spo2': sp}));
    var data = json.decode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final respdata = jsonDecode(response.body);
      final boby = respdata['Response'];
      final boby2 = respdata['Temp'];
      final boby3 = respdata['HR'];
      final boby4 = respdata['Output'];

      list.add(boby);
      list.add(boby2);
      list.add(boby3);
      list.add(boby4);
      // print(boby);

      // print(response.body["Response"]);
      //SendRequest jn = SendRequest.fromJson(jsonDecode(response.body));

      // var output = 1;
      return list;
    } else {
      return list;
    }
  } catch (e) {
    list[0] = 1;
    print(e);
    return list;
  }
}

Future<List> fetchData() async {
  // Replace the URL with your backend API endpoint
  final url = Uri.parse('http://' + ip + ':5000/mlmodel2/');
  var list = [];

  try {
    print("In Fetch Data");
    final response = await http.post(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // API call successful, process the response data here
      final respdata = jsonDecode(response.body);
      final boby = respdata['Response'];
      final boby2 = respdata['Temp'];
      final boby3 = respdata['HR'];
      final boby4 = respdata['Output'];
      final boby5 = respdata['spo2'];
      list.add(boby);
      list.add(boby2);
      list.add(boby3);
      list.add(boby4);
      list.add(boby5);
      print(respdata);
      return list;
    } else {
      return list;
      // API call failed, handle the error here
      print('API call failed with status code: ${response.statusCode}');
    }
  } catch (error) {
    list[0] = 1;
    return list;
    // Exception occurred, handle the error here
    print('Error occurred: $error');
  }
}
/*class SendRequest {
  String getMedUrl = "https://jsonplaceholder.typicode.com/todos/1";
  Future getData() async {
    try {
      // while(true){
      var response = await http.get(Uri.parse(getMedUrl));
      if (response.statusCode == 200) {
        // print(response.body);
        // return jsonDecode(response.body);
        print(jsonDecode(response.body));
      } else {
        return Future.error('Server error');
      }
      // }
    } catch (e) {
      return Future.error(e);
    }
  }
}*/
