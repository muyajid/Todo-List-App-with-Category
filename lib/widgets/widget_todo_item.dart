import 'package:flutter/material.dart';

class TodoItemTile extends StatelessWidget {
  final String leadingText; // kiri (misal nomor)
  final String title; // judul todo
  final String category; // kategori
  final String? description; // deskripsi (opsional)
  final bool done; // status selesai
  final VoidCallback? onCheck; // klik tombol centang
  final VoidCallback? onTap; // klik tile
  final Color? tileColor; // warna background tile

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
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: tileColor,
      leading: Text(
        leadingText,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(decoration: done ? TextDecoration.lineThrough : null),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (description != null && description!.isNotEmpty)
            Text(description!, maxLines: 2, overflow: TextOverflow.ellipsis),
          Text(category),
        ],
      ),
      trailing: IconButton(
        onPressed: onCheck,
        icon: Icon(done ? Icons.check_circle : Icons.check_circle_outline),
        tooltip: done ? 'Sudah selesai' : 'Tandai selesai',
      ),
    );
  }
}
