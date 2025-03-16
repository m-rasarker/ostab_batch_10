import 'package:flu_first_app/pages/logIn.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';

final GlobalKey<FormState> _formSignup = GlobalKey<FormState>();

void _submitForm(){
  if (_formSignup.currentState!.validate())
  {


  }



}
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _LoginState();
}

class _LoginState extends State<Signup> {

  final userIdController = TextEditingController();
  final passController = TextEditingController();
  final conpassController = TextEditingController();
  final mobileController = TextEditingController();
  bool isChecked1 =true;
  bool isChecked2 =false;


  final bool passToggle = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(25),right: Radius.circular((25)))),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20),bottom: Radius.circular((5)))),
          title: const Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white
      ),



      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formSignup,


            child: Visibility(
              visible:isChecked1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 100),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: userIdController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "User ID",
                      hintText: 'User ID',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.man,color: Colors.blueGrey, size: 50,),


                    ),
                    validator: (value){
                      if (value!.isEmpty)
                      {
                        return 'Enter User ID';
                      }
                      else if (value.length!=6)
                      {
                        return 'Enter ID Error';
                      }

                      return null;
                    },


                  ),

                  const SizedBox(height: 25),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      // keyboardType: TextInputType.visiblePassword,
                      controller: mobileController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Mobile Number",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.mobile_friendly_rounded,color: Colors.blueGrey,),

                      ),
                      validator: (value){
                        if (value!.isEmpty)
                        {
                          return 'Mobile Number';
                        }
                        else if (value.length!=11)
                        {
                          return 'Mobile Error';
                        }


                        return null;
                      },


                    ),
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
                      prefixIcon: Icon(Icons.lock,color: Colors.blueGrey),

                    ),
                    validator: (value){
                      if (value!.isEmpty)
                      {
                        return 'Enter Password';
                      }
                      else if (value.length<6)
                        {
                          return 'Min Length 6';
                        }

                          return null;


                    },


                  ),


                  const SizedBox(height: 25),

                  TextFormField(
                    obscureText: true,
                    // keyboardType: TextInputType.visiblePassword,
                    controller: conpassController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock,color: Colors.blueGrey),

                    ),
                    validator: (value){
                      if (value!.isEmpty)
                      {
                        return 'Confirm Password';
                      }
                      else if (passController.text!=value)
                      {
                        return 'Password Mismatch';
                      }

                      return null;


                    },


                  ),


                  const SizedBox(height: 25),


                  ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,foregroundColor: Colors.white
                  ),onPressed: _submitForm, child: Text('Sign Up')),



                  const SizedBox(height: 25),
                  //  const ElevatedButton(onPressed:() { Navigator.push(context, MaterialPageRoute(builder: (context) => Signup())}    , child: Text('Signup')),

                  //   const ElevatedButton(onPressed: Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const Signup())), child: Text('Sign Up'))

                  ElevatedButton
                    (
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,foregroundColor: Colors.white
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> const Login()));
                      }, child: const Text('Login')

                  )









                ],

              ),
            ),

          ),

        ),


      ),

    );
  }
}

