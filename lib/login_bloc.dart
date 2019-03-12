import 'dart:async';

import 'package:phone_auth_bloc/bloc_provider.dart';
import 'auth_validatin.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';




class LoginBloc extends Object with AuthValidator implements BlocBase {

  String _phone;
  String _sms;
  String _verifId;

  StreamController<String> _phoneController=StreamController<String>.broadcast();

  //Sink<String> get _addPhone=>_phoneController.sink;
  Stream<String> get getPhone=>_phoneController.stream.transform(validatePhone);

  StreamController<String> _codeController=StreamController<String>.broadcast();


  Stream<bool> get registerValid => Observable.combineLatest2(getPhone,getPhone
          ,(e, p) =>true);

  //Sink<String> get _addCode=>_phoneController.sink;
  Stream<String> get getCode=>_phoneController.stream.transform(validatePhone);
  Function(String) get onPhoneChanged => _phoneController.sink.add;

  StreamController<String> _verificationIdController=StreamController<String>.broadcast();

  Sink<String> get _addVerification=>_verificationIdController.sink;
  Stream<String> get getVerification=>_verificationIdController.stream;


  @override
  void dispose() {
    _phoneController.close();
    _codeController.close();
    _verificationIdController.close();
  }

  Future<void> verifyPhone(String phone, String verifId,String sms) async{

    _phone=phone;
    _sms=sms;
    _verifId=verifId;

    final PhoneCodeAutoRetrievalTimeout autoRetrieve=(String verId)
    {
      _verifId=verId;
      _addVerification.add(_verifId);
    };

    final PhoneCodeSent smsCodeSent=(String verId,[int forceCodeRetrieve])
    {
      _verifId=verId;
      _addVerification.add(_verifId);
    };

    final PhoneVerificationCompleted phoneVerificationCompleted=(FirebaseUser user)
    {
      print("User $user");
    };

    final PhoneVerificationFailed phoneVerificationFailed=(AuthException exception){
      print("Error $exception");
    };


    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phone,
        timeout: Duration(minutes: 1),
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: smsCodeSent,
        codeAutoRetrievalTimeout: autoRetrieve);
  }

}

LoginBloc loginBloc=LoginBloc();

