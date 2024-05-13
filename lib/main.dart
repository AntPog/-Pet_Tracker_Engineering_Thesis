import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
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
                },
                child: Text("Submit"),
              )
            ]
          )
          
        ),
      ),
    );
  }
}
