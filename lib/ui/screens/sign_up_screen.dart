import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text(
                'Join With Us',
                style: textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              _buildSignUpForm(),
              const SizedBox(height: 24),
              Center(child: _buildHaveAccountSection()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'First Name',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Last Name',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Mobile',
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Password',
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            _onTapNextButton();
          },
          child: Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _buildHaveAccountSection() {
    return RichText(
      text: TextSpan(
        text: "Have account?  ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 1,
        ),
        children: [
          TextSpan(
              text: 'Sign In',
              style: TextStyle(
                  color: AppColors.themeColor,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w800),
              recognizer: TapGestureRecognizer()..onTap = _onTapSignIn),
        ],
      ),
    );
  }

  void _onTapSignIn() {
    Navigator.pop(context);
  }

  void _onTapForgetPassword() {
    // TODO: implement on tap forget password
  }

  void _onTapNextButton() {
    // TODO: implement on tap next/sign up button
  }
}
