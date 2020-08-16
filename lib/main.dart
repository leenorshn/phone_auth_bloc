import 'package:flutter/material.dart';
import 'package:phone_auth_bloc/auth_screen.dart';


//bloc integrations

void main() => runApp(OmbreApp());

class OmbreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey[600],
        accentColor: Colors.deepOrange[200],
      ),

      home: AuthScreen(),
    );
  }
}
