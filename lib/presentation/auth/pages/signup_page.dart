import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/presentation/auth/pages/signin_page.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signupText(),
            const SizedBox(height: 24),
            _emailField(),
            const SizedBox(height: 12),
            _passField(),
            const SizedBox(height: 36),
            _signupButton(),
            const SizedBox(height: 24),
            _signinText(context),
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return Text(
      "Sign Up",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(decoration: InputDecoration(hintText: 'Email'));
  }

  Widget _passField() {
    return TextField(decoration: InputDecoration(hintText: 'Password'));
  }

  Widget _signupButton() {
    return ReactiveButton(
      title: "Sign in",
      onPressed: () async {},
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Have account?"),
          TextSpan(
            text: ' Sign In',
            style: const TextStyle(color: Colors.blue),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SigninPage());
                  },
          ),
        ],
      ),
    );
  }
}
