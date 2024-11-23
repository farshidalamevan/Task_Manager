import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/cancelled_task_screen.dart';
import 'package:task_manager/ui/screens/completed_task_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/screens/progress_task_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.new_label,
              color:
                  _selectedIndex == 0 ? AppColors.themeColor : Colors.black54,
            ),
            label: 'New',
          ),
          NavigationDestination(
              icon: Icon(
                Icons.check_circle,
                color:
                    _selectedIndex == 1 ? AppColors.themeColor : Colors.black54,
              ),
              label: 'Completed'),
          NavigationDestination(
              icon: Icon(
                Icons.cancel,
                color:
                    _selectedIndex == 2 ? AppColors.themeColor : Colors.black54,
              ),
              label: 'Cancelled'),
          NavigationDestination(
            icon: Icon(
              Icons.add_alert,
              color:
                  _selectedIndex == 3 ? AppColors.themeColor : Colors.black54,
            ),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}

// --------------

// class MainBottomNavBarScreen extends StatefulWidget {
//   const MainBottomNavBarScreen({super.key});
//
//   @override
//   State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
// }

// class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _screens = [
//     NewTaskScreen(),
//     CompletedTaskScreen(),
//     CancelledTaskScreen(),
//     ProgressTaskScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: TMAppBar(),
//       body: _screens[_selectedIndex],
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Handle FAB action here
//           print("Floating action button pressed");
//         },
//         backgroundColor: AppColors.themeColor,
//         shape: CircleBorder(),
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 10.0,
//
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//
//               icon: Icon(
//                 Icons.new_label,
//
//                 color: _selectedIndex ==0 ? AppColors.themeColor : Colors.grey,
//               ),
//
//               onPressed: () => _onItemTapped(0),
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.check_circle,
//                 color: _selectedIndex ==1 ? AppColors.themeColor : Colors.grey,
//               ),
//               onPressed: () => _onItemTapped(1),
//             ),
//             const SizedBox(width: 40), // Space for the FAB
//             IconButton(
//               icon: Icon(
//                 Icons.cancel,
//                 color: _selectedIndex ==2 ? AppColors.themeColor : Colors.grey,
//               ),
//               onPressed: () => _onItemTapped(2),
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.add_alert,
//                 color: _selectedIndex ==3 ? AppColors.themeColor : Colors.grey,
//                 // color: _selectedIndex == 3 ? Colors. : Colors.grey,
//               ),
//               onPressed: () => _onItemTapped(3),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
