import 'package:flutter/material.dart';
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
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(

                onPressed: () {},
                child: Icon(Icons.chevron_right),
              )
            ],
          ),
        ),
      ),
    );
  }
}
