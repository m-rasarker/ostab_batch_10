import 'package:flu_first_app/pages/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();

void _submitForm(){
  if (_formLogin.currentState!.validate())
    {
      
    }
}




class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final bool passToggle = true;





  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white
      ),


      body: SingleChildScrollView(

      //  child: Padding(padding: const EdgeInsets.fromLTRB(10,50,10,10),
        child: Padding(padding: const EdgeInsets.all(5.0),
        child: Form(
          key: _formLogin,
        child: Container(
               child: Column(
                 children: [],

               ),

        )


        ),

        ),


      ),

    );
  }
}

