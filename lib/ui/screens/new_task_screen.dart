import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/task_card.dart';
import 'package:task_manager/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummarySection(),
          Expanded(
            child: ListView.builder(
              // TODO: Rafat Bhai doing on ListView.separated
              itemCount: 10,
              itemBuilder: (context, index) {
                return TaskCard();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.green.shade500,
        foregroundColor: Colors.white,

        onPressed: _onTapAddFAB,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        children: [
          TaskSummaryCard(count: 9, title: 'New Task'),
          TaskSummaryCard(count: 10, title: 'Completed'),
          TaskSummaryCard(count: 10, title: 'Progress'),
          TaskSummaryCard(count: 50, title: 'Cancelled'),
        ],
      ),
    );
  }

  void _onTapAddFAB() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddNewTaskScreen()));
  }
}


