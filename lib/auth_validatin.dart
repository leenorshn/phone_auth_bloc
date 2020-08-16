import 'dart:async';


String _phoneRole=r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$";

// mixin for auth validation. just for the phone field
mixin AuthValidator {

  final StreamTransformer<String,String> validatePhone =
  StreamTransformer<String,String>.fromHandlers(handleData: (phone, sink){
    final RegExp emailExp = new RegExp(_phoneRole);

    if (!emailExp.hasMatch(phone) || phone.isEmpty){
      sink.addError('Entre a valid email');
    } else {
      sink.add(phone);
    }
  });
}
