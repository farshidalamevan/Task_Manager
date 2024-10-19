import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/reset_password_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class ForgetPasswordOtpScreen extends StatefulWidget {
  const ForgetPasswordOtpScreen({super.key});

  @override
  State<ForgetPasswordOtpScreen> createState() =>
      _ForgetPasswordOtpScreenState();
}

class _ForgetPasswordOtpScreenState extends State<ForgetPasswordOtpScreen> {
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
                'PIN Verification',
                style: textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'A 6 Digits verification OTP has been sent to your email address',
                style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              _buildVerifyOTPForm(),
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

  Widget _buildVerifyOTPForm() {
    return Column(
      children: [
        PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 45,
              activeFillColor: Colors.white,
              inactiveFillColor: Colors.white70,
              selectedFillColor: Colors.white70,
              inactiveColor: Colors.blueGrey),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          appContext: context,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            _onTapNextButton();
          },
          child: Text('Verify'),
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
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
        (_) => false);
  }

  void _onTapNextButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResetPasswordScreen(),
      ),
    );
  }
}
