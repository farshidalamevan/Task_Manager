import 'package:flutter/material.dart';

import '../widgets/task_card.dart';

class CancelledTaskScreen extends StatelessWidget {
  const CancelledTaskScreen({super.key});

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
