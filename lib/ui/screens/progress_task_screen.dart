import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/task_card.dart';

class ProgressTaskScreen extends StatelessWidget {
  const ProgressTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // TODO: Rafat Bhai doing on ListView.separated
      itemCount: 10,
      itemBuilder: (context, index) {
        return TaskCard();
      },
    );
  }
}
