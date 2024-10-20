import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/forget_password_email_address.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                'Get Started With',
                style: textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              _buildSignInForm(),
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        _onTapForgetPassword();
                      },
                      child: Text(
                        'Forget Password !',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    _buildSignUpSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email',
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          obscureText: true,
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

  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
        text: "Don't have an account?  ",
        style: TextStyle(
          color: Colors.black,
          letterSpacing: 1,
        ),
        children: [
          TextSpan(
              text: 'Sign up',
              style: TextStyle(
                  color: AppColors.themeColor,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w800),
              recognizer: TapGestureRecognizer()..onTap = _onTapSignup),
        ],
      ),
    );
  }

  void _onTapSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  void _onTapForgetPassword() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForgetPasswordEmailScreen()));
  }

  void _onTapNextButton() {
    //TODO convert push to pushremoveuntil
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MainBottomNavBarScreen()));
  }
}
