

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
              StreamBuilder(
                stream: loginBloc.getPhone,
                builder: (context,snapshot){
                  return TextField(
                    
                    decoration: InputDecoration(
                      labelText: 'phone',
                      errorText: snapshot.error,
                    ),
                    onChanged: loginBloc.onPhoneChanged,
                    keyboardType: TextInputType.number,
                  );
                },
              ),
              SizedBox(),
              StreamBuilder<bool>(
                  stream: loginBloc.registerValid,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return RaisedButton(
                      child: Text('Register'),
                      onPressed: (snapshot.hasData && snapshot.data == true)
                          ? () {
                        // launch the registration process
                      }
                          : null,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
