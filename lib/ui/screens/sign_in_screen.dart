import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/forget_password_email_address.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/centered_circular_process_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snackBar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  bool _inProgress = false;

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter a valid Email';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordTEController,
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter your password';
              }
              if (value!.length <= 5) {
                return 'Enter a password minimum 6 characters';
              }
              return null;
            },
            ///TODO - obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: !_inProgress,
            replacement: CenteredCircularProcessIndicator(),
            child: ElevatedButton(
              onPressed: () {
                _onTapNextButton();
              },
              child: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
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

  Future<void> _signIn() async {
    _inProgress = true;
    setState(() {});

    Map <String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text,
    };

    NetworkResponse response =
        await NetworkCaller.postRequest(url: Urls.login, body: requestBody);
    _inProgress = false;
    setState(() {});

    if (response.isSuccess) {
    await AuthController.saveAccessToken(response.responseData['token']);

      //TODO convert push to pushremoveuntil
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MainBottomNavBarScreen()));
    } else {
      snackBarMessage(context, response.errorMessage, true);
    }
  }

  void _onTapForgetPassword() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForgetPasswordEmailScreen()));
  }

  void _onTapNextButton() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _signIn();
  }
}
