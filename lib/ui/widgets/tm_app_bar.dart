import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/profile_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/utils/assets_path.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
    this.isProfileScreenOpen = false,
  });

  final bool isProfileScreenOpen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isProfileScreenOpen) {
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );
      },
      child: AppBar(
        backgroundColor: AppColors.themeColor,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 22,
              child: Icon(Icons.person),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Farshid Alam Evan',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    'mail@example.com',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                await AuthController.clearUserData();

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                    (predicate) => false);
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
