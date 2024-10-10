import 'package:flutter/material.dart';
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
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Text(
                'Get Started With',
                style: textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 24),
              TextFormField(),
              TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
