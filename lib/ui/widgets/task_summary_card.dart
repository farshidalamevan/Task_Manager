import 'package:flutter/material.dart';

class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({
    super.key,
    required this.count,
    required this.title,
  });

  final int count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 15,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              FittedBox(
                  child: Text('$count',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600))),
              const SizedBox(height: 4),
              FittedBox(
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
