import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidating = false;
  TextEditingController conUser = TextEditingController();
  TextEditingController conPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: InputDecoration(hintText: 'Email'),
    );
    final txtPwd = TextField(
      obscureText: true,
      controller: conPwd,
      decoration: InputDecoration(hintText: 'Contraseña'),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/wall.jpg"),
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 200,
              child: Text(
                'Star Wars',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Vanilla',
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    txtUser,
                    txtPwd,
                    Row(mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      onPressed: () {
                        isValidating = true;
                        setState(() {});
                        Future.delayed(Duration(seconds: 2)).then(
                          (value) => Navigator.pushNamed(context, "/home"),
                        );
                      },
                      icon: Icon(Icons.login_rounded, size: 20), label: Text('Iniciar sesion'),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        icon: Icon(Icons.app_registration, size: 20),
                        label: Text('Registrarse')
                      ),
                    ]
                      ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: isValidating
                  ? Lottie.asset('assets/loading.json', width: 150, height: 150)
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
