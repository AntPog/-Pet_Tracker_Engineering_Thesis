import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:convert';

String customPath = 'C:/xampp/htdocs/git/-Pet_Tracker_Engineering_Thesis/';


class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    TextEditingController textControllerEmail = TextEditingController(); //wychwytywanie maila
    TextEditingController textControllerPassword = TextEditingController(); //wychwytywanie hasła
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textControllerEmail,
                onChanged: (text) {
                  print('First text field: $text (${text.characters.length})');
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your e-mail here',
                  labelText: 'email',
                  border: OutlineInputBorder(),
                  
                ),
              ),
              TextField(
                controller: textControllerPassword,
                onChanged: (text) {
                  print('First text field: $text (${text.characters.length})');
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your password here',
                  labelText: 'password',
                  border: OutlineInputBorder(),
                  
                ),
              ),
              
              ElevatedButton(
              onPressed: () async {
                // Open the SQLite database
                final database = await openDatabase(
                  // Set the path to the database file
                  
                  join(await getDatabasesPath(), 'intest.db'),
                  
                  
                  onCreate: (db, version) {
                    return db.execute(
                      "CREATE TABLE IF NOT EXISTS Users(UserID INTEGER PRIMARY KEY, Email TEXT, Password TEXT)",
                    );
                  },
                  version: 1,
                );
                if (database.isOpen) {
                  print('Database opened successfully');
                } else {
                  print('Error opening database');
                }

                // Actual inserting
                await database.insert(
                  'Users',
                  {'Email': textControllerEmail.text, 'Password': textControllerPassword.text},
                  conflictAlgorithm: ConflictAlgorithm.replace,
                );

                //debug printing
                List<Map<String, dynamic>> rows = await database.query('Users');
                rows.forEach((row) {
                  print('UserID: ${row['UserID']}, Email: ${row['Email']}, Password: ${row['Password']}');
                });

                await database.close();
                textControllerEmail.clear();
                textControllerPassword.clear();
                
              },
                child: Text("Submit")
              )
            ]
          )
          
        ),
      ),
    );
    
  }

}