import 'package:flutter/material.dart';
import 'package:todolist_project_with_category/theme/app_color.dart';

class TodoItemTile extends StatelessWidget {
  final String leadingText; // kiri (misal nomor)
  final String title; // judul todo
  final String category; // kategori
  final String? description; // deskripsi (opsional)
  final bool done; // status selesai
  final VoidCallback? onCheck; // klik tombol centang
  final VoidCallback? onTap; // klik tile
  final Color? tileColor; // warna background tile
  final bool showSwipeHint; // opsional garis hint geser
  final String? date;

  const TodoItemTile({
    super.key,
    required this.leadingText,
    required this.title,
    required this.category,
    this.description,
    this.done = false,
    this.onCheck,
    this.onTap,
    this.tileColor,
    this.showSwipeHint = false, // default: tidak tampil
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).dividerColor.withValues(alpha: 0.35);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: Text(
          leadingText,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            decoration: done ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (description != null && description!.isNotEmpty)
              Text(description!, maxLines: 2, overflow: TextOverflow.ellipsis),
            Text("Category : $category"),
            Text("Date     : $date"),
          ],
        ),
        trailing: showSwipeHint
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: onCheck,
                    icon: Icon(
                      done ? null : Icons.check_circle_outline,
                      color: done ? null : Colors.black,
                    ),
                    tooltip: done ? 'Sudah selesai' : 'Tandai selesai',
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 2,
                    height: 40,
                    color: AppColor.neutralgraymedium,
                  ),
                ],
              )
            : IconButton(
                onPressed: onCheck,
                icon: Icon(
                  done ? null : Icons.check_circle_outline,
                  color: done ? null : Colors.black,
                ),
                tooltip: done ? 'Sudah selesai' : 'Tandai selesai',
              ),
      ),
    );
  }
}
