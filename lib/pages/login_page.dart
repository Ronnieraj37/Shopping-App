import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50,),
                //image
                const Icon(Icons.lock,size: 100,),
                const SizedBox(height: 50,),
                //uve been missed
                const Text(
                    "Welcome Back !",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 50,),
                //pass & text
                 Container(
                  padding: const EdgeInsets.all(10 ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "UserName",
                      hintStyle: TextStyle(
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

                         obscureText: hidePass,
                         decoration: const InputDecoration(
                             hintText: "Password",
                             hintStyle: TextStyle(
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
                const SizedBox(height: 25,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerRight,
                    child: ElevatedButton(onPressed: (){}, child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Login",style: TextStyle(fontSize: 24,fontStyle: FontStyle.italic),),
                    ),
                    ),
                ),
                const SizedBox(height: 45,),
                const Text('or Continue with',style: TextStyle(fontSize: 20),),
                const SizedBox(height: 10,),
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