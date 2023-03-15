import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function changeValue;
  const LoginPage(this.changeValue, {super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePass = true;
  Icon eyeIcon = const Icon(Icons.remove_red_eye_rounded,size: 30,);
  void showPass(){
    setState(() {
      if(hidePass==true){
        hidePass=false;
        eyeIcon = const Icon(Icons.panorama_fish_eye,size: 30,);
      }
      else{
        hidePass = true;
        eyeIcon = const Icon(Icons.remove_red_eye_rounded,size: 30,);
      }
    });
  }
  late String name;
  late String pass;
  bool changeButton = true;
  final _keys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  const Icon(Icons.lock,size: 100,),
                  const SizedBox(height: 50,),
                  const Text(
                      "Welcome Back !",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Form(
                    key: _keys,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10 ),
                          child: TextFormField(
                            onTap: (){},
                            //keyboardType: TextInputType.emailAddress,
                            //autofillHints: const [AutofillHints.email],
                            // enableSuggestions: true,
                            onChanged: (user){name = user;},
                            validator: (value){
                              if(value!.isEmpty){
                                return " UserName can't be Empty";
                              }
                              else{
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                                labelText: "UserName",
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white,width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26,width: 2),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              TextFormField(
                                onTap: (){},
                                onChanged: (user){pass = user;},
                                obscureText: hidePass,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return " Password can't be Empty";
                                  }
                                  else if(value.length<8){
                                    return "Password short like ur DICK";
                                  }
                                  else{
                                    return null;
                                  }
                                }, 
                                decoration: const InputDecoration(
                                    labelText: "Password",
                                    labelStyle: TextStyle(
                                      fontSize: 20,
                                    ),
                                    enabledBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white,width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black26,width: 2),
                                    )
                                ),
                              ),
                              IconButton(onPressed: () => showPass(), icon: eyeIcon),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25,),
                  InkWell(
                    onTap: () async {
                      if(_keys.currentState!.validate() ){
                        setState(() {
                          changeButton = false;
                        });
                        await Future.delayed( const Duration(milliseconds: 400));
                        widget.changeValue(name,pass);
                        if(!mounted)return;
                        await Navigator.pushReplacementNamed(context , "/home");
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: changeButton? const EdgeInsets.symmetric(vertical: 10,horizontal: 20) : const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      decoration: BoxDecoration(
                        shape: changeButton? BoxShape.rectangle : BoxShape.circle,
                        gradient: const LinearGradient(colors: [Colors.deepPurple,Colors.purpleAccent],begin: Alignment.topLeft,end: Alignment.bottomRight),
                        // borderRadius:  BorderRadius.circular(9),
                      ),
                      child: changeButton? const Text("Login",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w500),) : const Icon(Icons.done,color: Colors.white,),
                    ),
                  ),
                  const SizedBox(height: 45,),
                  const Text('or Continue with',style: TextStyle(fontSize: 20),),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset( width: 40,'images/apple.png'),
                      const SizedBox(width: 40),
                      Image.asset( width: 40,'images/google.png'),
                    ],
                  ),
                  //forgot pass

                  //sign in

                  //or continue with

                  //register?
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
// Text(
// "Login Page",
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// color: Colors.blueAccent,
// ),
// ),
// validator: (value) {
// Pattern pattern =
// r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
// RegExp regex = new RegExp(pattern);
// if (!regex.hasMatch(value))
// return 'Enter a valid email';
// else
// return null;
// },