import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/forget_password_otp_address.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class ForgetPasswordEmailScreen extends StatefulWidget {
  const ForgetPasswordEmailScreen({super.key});

  @override
  State<ForgetPasswordEmailScreen> createState() =>
      _ForgetPasswordEmailScreenState();
}

class _ForgetPasswordEmailScreenState extends State<ForgetPasswordEmailScreen> {
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
                'Your Email Address',
                style: textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'A 6 Digit verification pin will send to your\nemail address',
                style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              _buildVerifyEmailForm(),
              const SizedBox(height: 32),
              Center(
                child: _buildHaveAccountSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyEmailForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email',
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

  void _onTapNextButton() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ForgetPasswordOtpScreen()));
  }
}
