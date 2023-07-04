import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  // Replace the URL with your backend API endpoint
  final url = Uri.parse('https://api.example.com/data');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // API call successful, process the response data here
      final responseData = jsonDecode(response.body);
      print(responseData);
    } else {
      // API call failed, handle the error here
      print('API call failed with status code: ${response.statusCode}');
    }
  } catch (error) {
    // Exception occurred, handle the error here
    print('Error occurred: $error');
  }
}
