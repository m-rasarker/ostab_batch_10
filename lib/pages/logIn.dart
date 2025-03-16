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

  final userIdController = TextEditingController();
  final passController = TextEditingController();
  final bool passToggle = true;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular((25)))),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom: Radius.circular((5)))),
          title: const Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white
      ),


      body: SingleChildScrollView(

        //  child: Padding(padding: const EdgeInsets.fromLTRB(10,50,10,10),
        child: Padding(padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formLogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                TextFormField(
                  //  keyboardType: TextInputType.emailAddress,
                  controller: userIdController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "User ID",
                    hintText: 'User ID',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.man,color: Colors.blueGrey,size: 50),


                  ),
                  validator: (value){
                    if (value!.isEmpty)
                    {
                      return 'Enter User ID';
                    }
                    if (value.length!=6)
                    {
                      return 'User ID error';
                    }
                    return null;
                  },


                ),


                const SizedBox(height: 25),

                TextFormField(
                  obscureText: true,
                  // keyboardType: TextInputType.visiblePassword,
                  controller: passController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock,color: Colors.blueGrey,),

                  ),
                  validator: (value){
                    if (value!.isEmpty)
                    {
                      return 'Enter Password';
                    }
                    else if (value.length<6)
                    {
                      return 'Password Length';
                    }

                    return null;
                  },


                ),

                const SizedBox(height: 25),


                ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,foregroundColor: Colors.white
                ),onPressed: _submitForm, child: Text('Login')),

                const SizedBox(height: 25),
                //  const ElevatedButton(onPressed:() { Navigator.push(context, MaterialPageRoute(builder: (context) => Signup())}    , child: Text('Signup')),

                //   const ElevatedButton(onPressed: Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Signup())), child: Text('Sign Up'))

                ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,foregroundColor: Colors.white
                ),onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> const Signup()));
                }, child: const Text('Sing Up')

                )











              ],

            ),


          ),

        ),


      ),

    );
  }
}

