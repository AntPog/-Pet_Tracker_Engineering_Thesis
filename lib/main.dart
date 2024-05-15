import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:convert';
import 'login.dart';
import 'registestrion.dart';
import 'package:path_provider/path_provider.dart';


//String phpScriptPath = 'connect.php';

//a lot of dead code in this one, but I'll leave it for now

// void main() {
//   runApp(const MainApp());
// }
Future<void> main() async {
  // Socket.connect('127.0.0.1', 8080).then((socket) {
  //   print('Connected to server');
  // }).catchError((error) {
  //   print('Error connecting to server: $error');
  // });
  
  runApp(const MainApp());

}
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomeScreen());
  }

//   Future<Map<String, dynamic>> sendDataToDatabase(String data) async {
//   // Adres URL serwera HTTP
//   var serverUrl = 'http://127.0.0.1:80';

//   var httpClient = HttpClient();
//   var request = await httpClient.postUrl(Uri.parse('$serverUrl/$phpScriptPath'));
//   request.headers.contentType = ContentType.json;
//   request.write(jsonEncode(data));
//   var response = await request.close();

//   // Odczytywanie odpowiedzi
//   var responseBody = await utf8.decoder.bind(response).join();
//   var responseData = jsonDecode(responseBody);
//   return responseData;
// }
}
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar( 
          title: const Text('HELLO'),
          ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("LOGIN"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  ),
                ElevatedButton(
                  child: const Text("REGISTER"),
                  onPressed: (){
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                  },
                  ),
                    ]
                  )
      ));
  }
}
