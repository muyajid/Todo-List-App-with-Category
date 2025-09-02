import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String? category;
  final bool done;
  final ValueChanged<bool?>? onChanged;

  const TaskCard({
    super.key,
    required this.title,
    this.category,
    this.done = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(value: done, onChanged: onChanged),
        title: Text(
          title,
          style: TextStyle(
            decoration: done ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: category == null ? null : Text(category!),
      ),
    );
  }
}
