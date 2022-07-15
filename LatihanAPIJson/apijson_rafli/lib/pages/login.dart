import 'package:apijson_rafli/pages/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool noObscure = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseAuth.authStateChanges().listen((User? user) {
      if(user!=null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: Center(child: Container(
          margin: EdgeInsets.only(left: 50,right: 50),
          height: 300,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: const Text("LOGIN",style: TextStyle(
                fontSize: 30,
              ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  icon: IconButton(onPressed: (){}, icon: Icon(Icons.mail, color: Colors.grey,)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: _passwordController,
                obscureText: !noObscure,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: IconButton(onPressed: (){
                    print("CLICKED");
                    setState(() {
                      noObscure==false ? noObscure=true : noObscure=false;
                    });
                  }, icon: noObscure==false ? Icon(Icons.visibility_off,color: Colors.grey,) : Icon(Icons.visibility,color: Colors.lightBlue,)
                ),
                ),),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: RichText(text: TextSpan(
                  text: "Click here to sign up!",
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                  ..onTap=(){
                    showDialog(context: context,
                    builder: (context){
                      TextEditingController _emailController = new TextEditingController();
                      TextEditingController _passwordController = new TextEditingController();
                      return AlertDialog(
                        title: Text("Create an account"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),            
                        content: Builder(
                          builder: (context){
                            return Container(
                              height: MediaQuery.of(context).size.height - 500,
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: "Email"
                                    ),
                                  ),
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: "Password"
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        actions: <Widget>[
                          ElevatedButton(onPressed: (){
                           setState(() {
                             Navigator.pop(context);
                           });
                          }, child: Text("Cancel")),
                          SizedBox(width: 50,),
                          ElevatedButton(onPressed: ()async{
                             try{
                              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: _emailController.text, 
                              password: _passwordController.text
                              );
                              setState(() {
                                Navigator.pop(context);
                              });
                            }
                            on FirebaseException catch(e){
                              print(e);
                            }
                          }, child: Text("Confirm"))
                        ],
                      );
                    }
                    );
                  }
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: ElevatedButton(
                  onPressed: () async{
                    try{
                      await _firebaseAuth.signInWithEmailAndPassword(
                        email: _emailController.text, password: _passwordController.text
                        )
                        .then((value) => Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context)=>MainPage())));
                    }
                    on FirebaseException catch(e){
                      if(e.code=="invalid-email"){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Email"),
                        duration: Duration(seconds: 1),));
                      }
                      else if(e.code == "user-not-found"){
                        print("no user with that email");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user"),
                        duration: Duration(seconds: 1),));
                      }
                      else if(e.code == "wrong-password"){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email/Password is wrong"),
                        duration: Duration(seconds: 1),));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.message}"),
                        duration: Duration(seconds: 1),));
                      }
                    }
                  },
                  child: Container(padding: EdgeInsets.only(left: 60,right: 60,top: 10, bottom: 10),
                    child: Text("Login",style: TextStyle(fontSize: 20),)),
                ),
              )
          ]),
        )),
      ),
    );
  }
  

}