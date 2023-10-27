import 'package:chatapptute/components/my_button.dart';
import 'package:chatapptute/components/my_text_file.dart';
import 'package:chatapptute/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUP() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("password do not match")));
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailandPassword(
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
            "Let's create an account for you!",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 50),
          //mail textfiled
          MyTextFiled(
              controller: emailController,
              hintText: 'Email',
              obscureText: false),
          const SizedBox(height: 10),
          //password
          MyTextFiled(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true),
          const SizedBox(height: 20),
          //confirm password
          MyTextFiled(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true),
          const SizedBox(height: 20),
          //Button Singin
          MyButton(onTap: signUP, text: "Register"),
          const SizedBox(height: 20),
          //not a remember?

          const SizedBox(height: 20),
          //not a remember?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already a remember?'),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  'Login',
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
