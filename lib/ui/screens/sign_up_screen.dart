import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/centered_circular_process_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snackBar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.email_outlined),
              hintText: 'Email',
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Enter a valid Email';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _firstNameTEController,
            decoration: InputDecoration(
              hintText: 'First Name',
              suffixIcon: Icon(Icons.person_2_outlined),
            ),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter First Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lastNameTEController,
            decoration: InputDecoration(
              hintText: 'Last Name',
              suffixIcon: Icon(Icons.person_2_outlined),
            ),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter Last Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mobileTEController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Mobile',
              suffixIcon: Icon(Icons.phone),
            ),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter a valid Number';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordTEController,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: Icon(Icons.visibility_off_outlined),
            ),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter your password';

              } if (value!.length <= 5 ){
                return 'Enter a password minimum 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: _inProgress == false,
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

  void _onTapNextButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    _inProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text
    };

    NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.registration, body: requestBody);

    _inProgress = false;
    setState(() {});
    if (response.isSuccess) {
      _clearTextFields();
      snackBarMessage(context, 'Registration Successfully');
    } else {
      snackBarMessage(context, response.errorMessage, true);
    }
  }

  void _onTapSignIn() {
    Navigator.pop(context);
  }

  void _clearTextFields() {
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _firstNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
