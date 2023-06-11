

import 'package:flutter/material.dart';
import 'package:news/views/homeView.dart';
import '../CustomShapes/CurveFour.dart';
import '../CustomShapes/CurveThree.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*.28,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: CustomPaint(
                          size: Size(MediaQuery.of(context).size.width,(MediaQuery.of(context).size.width*0.55).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: RPSCustomPainter4(),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: CustomPaint(
                          size: Size(MediaQuery.of(context).size.width,(MediaQuery.of(context).size.width*0.55).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: RPSCustomPainter3(),
                        ),
                      ),
                      /*
                                            Positioned(
                                              top: -20,
                                              right: -60,
                                              child: Container(
                                                  height: 250,width: 250,
                                                  child:Image.asset('assets/splash.png',fit: BoxFit.cover,color: Color.fromARGB(255, 165, 209, 245),)
                                                /*
               const Text('WinPay',style: TextStyle(fontSize: 25),),*/
                                              ),
                                            ),

                                             */
                    ],
                  ),),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text("LOGIN",
                          style: TextStyle(color: Colors.blue,
                              fontWeight: FontWeight.bold,fontSize: 35),),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'UserName',
                        ),
                        validator: (value) =>
                        value!.isEmpty ? 'UserName cannot be blank' : null,
                        onChanged: (value) {
                          setState(() {
                            _emailController.text = value;
                          });
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: (value) =>
                        value!.isEmpty ? 'Password cannot be blank' : null,
                        onChanged: (value) {
                          setState(() {
                            _passwordController.text = value;
                          });
                        },
                      ),
                      SizedBox(height: 40.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  fixedSize: Size.fromHeight(50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  )
                              ),
                              child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20),),
                              onPressed: () {
                                _authenticateWithEmailAndPassword(context);
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Don't have an account? sign up",style: TextStyle(fontSize: 12,color: Colors.blue),)
                          ],
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      if(_emailController.text == "admin" && _passwordController.text == "admin"){
        Navigator.push(context,MaterialPageRoute(builder:(((context) => HomeView()))));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("UserName or Password wrong")));
      }

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You should fill fields")));
    }
  }
}
