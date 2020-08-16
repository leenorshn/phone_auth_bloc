

//design must be reviewed and i will better organize the project

import 'package:flutter/material.dart';
import 'package:phone_auth_bloc/login_bloc.dart';


class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              
              SizedBox(),
              
            ],
          ),
        ),
      ),
    );
  }
}
