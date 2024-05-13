import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:convert';

String phpScriptPath = 'connect.php';

// void main() {
//   runApp(const MainApp());
// }
Future<void> main() async {
 
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8040);

  // Obsługa żądań HTTP
  await for (var request in server) {
    var response = request.response;
    response.headers.contentType = ContentType.html;
    response.write('Hello from your PHP script!');
    print("działa");
    await response.close();
  }
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                onChanged: (text) {
                  print('First text field: $text (${text.characters.length})');
                },
                decoration: InputDecoration(
                  hintText: 'Enter your e-mail here',
                  labelText: 'email',
                  border: OutlineInputBorder(),
                  
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  String enteredEmail = textController.text;
                  sendDataToDatabase(enteredEmail);
                },
                child: Text("Submit")
              )
            ]
          )
          
        ),
      ),
    );
    
  }
  Future<Map<String, dynamic>> sendDataToDatabase(String data) async {
  // Adres URL serwera HTTP
  var serverUrl = '127.0.0.1:40';

  var httpClient = HttpClient();
  var request = await httpClient.postUrl(Uri.parse('$serverUrl/$phpScriptPath'));
  request.headers.contentType = ContentType.json;
  request.write(jsonEncode(data));
  var response = await request.close();

  // Odczytywanie odpowiedzi
  var responseBody = await utf8.decoder.bind(response).join();
  var responseData = jsonDecode(responseBody);
  return responseData;
}
}
