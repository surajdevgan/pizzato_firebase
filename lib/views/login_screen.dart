import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato_firebase/Providers/authentication.dart';
import 'package:pizzato_firebase/views/home_page.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white24),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      color: Colors.black12,
                      onPressed: () {
                        loginSheet(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  MaterialButton(
                      color: Colors.black12,
                      onPressed: () {
                        signUpSheet(context);
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400.0,
            width: 400.0,
            decoration: BoxDecoration(color: Colors.blueGrey.shade700),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          )),
                      controller: emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          )),
                      controller: passwordController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                        color: Colors.lightGreenAccent,
                        child: Text('SignIn',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () =>
                            Provider.of<Authentication>(context, listen: false)
                                .signIn(emailController.text,
                                    passwordController.text)
                                .whenComplete(() {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    child: HomeScreen(),
                                    type: PageTransitionType.leftToRight,
                                  ));
                            })),
                  )
                ],
              ),
            ),
          );
        });
  }

  signUpSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400.0,
            width: 400.0,
            decoration: BoxDecoration(color: Colors.blueGrey.shade700),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          )),
                      controller: emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          )),
                      controller: passwordController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                        color: Colors.lightGreenAccent,
                        child: Text('SignUp',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () =>
                            Provider.of<Authentication>(context, listen: false)
                                .signUp(emailController.text,
                                    passwordController.text)
                                .whenComplete(() {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    child: HomeScreen(),
                                    type: PageTransitionType.leftToRight,
                                  ));
                            })),
                  )
                ],
              ),
            ),
          );
        });
  }
}
