import 'package:chatapptute/components/my_button.dart';
import 'package:chatapptute/components/my_text_file.dart';
import 'package:chatapptute/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 50),
          //logo
          const Icon(
            Icons.message,
            size: 80,
            color: Color.fromARGB(255, 5, 67, 148),
          ),
          const SizedBox(height: 30),
          //Text wellcome
          const Text(
            "Wellcome back you\ 've been missed",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 50),
          //mail textfiled
          MyTextFiled(
              controller: emailController,
              hintText: 'Email',
              obscureText: false),
          const SizedBox(height: 10),
          MyTextFiled(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true),
          const SizedBox(height: 20),
          //Button Singin
          MyButton(onTap: signIn, text: "SingIn"),
          const SizedBox(height: 20),
          //not a remember?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Not a remember?'),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  'Register now',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ]),
      )),
    );
  }
}
