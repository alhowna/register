import 'package:flutter/material.dart';
import 'strings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'images/color.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            const LoginScreen(),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isInvalidCredentials = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginPressed() {
    if (emailController.text == 'alhona@plsp' && passwordController.text == 'intern@batch04') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const strings()),
      );
    } else {
      setState(() {
        isInvalidCredentials = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
        Container(
        alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Text(
            '',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Text(
            '',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(2),
          child: const Text(
            'WELCOME',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.person, size: 60, color: Colors.white),
          padding: EdgeInsets.all(20),
          onPressed: () {
            //TODO: Implement sign-in functionality
          },
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Sign in',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Material(
            color: Colors.transparent,
            child: TextField(
              controller: emailController,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
        ),
        Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Material(
    color: Colors.transparent,
    child: TextField(
    controller: passwordController,
    obscureText: true
      ,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.5),
      ),
    ),
    ),
        ),
            isInvalidCredentials
                ? Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(
                'Invalid email or password',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
                : SizedBox(height: 0),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: loginPressed,
              ),
            ),
          ],
        ),
    );
  }
}