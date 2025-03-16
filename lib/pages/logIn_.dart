import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _fromKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromKey1,
        child: TextFormField()
    );
  }

}


class MyTextFormField extends StatelessWidget {
final String hintText;
final Function validator;
final Function onSaved;
final bool isPassword;
final bool isEmail;


 MyTextFormField(this.hintText, this.validator, this.onSaved, this.isPassword,
      this.isEmail);

  @override
  Widget build(BuildContext context) {
return Padding(padding: EdgeInsets.all(8.2),
child: TextFormField(
  decoration: InputDecoration(
    hintText: hintText,
    contentPadding: EdgeInsets.all(15.0),
    border: InputBorder.none,
    filled: true,
    fillColor: Colors.grey[200],
  ),

  obscureText: isPassword? true:false,
//  validator: validator,
 // onSaved: onSaved,
  keyboardType: isEmail? TextInputType.emailAddress:TextInputType.text,

),
);
  }
}
