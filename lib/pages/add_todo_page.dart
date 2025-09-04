import 'package:flutter/material.dart';
import '../widgets/widget_textfield.dart';
import '../widgets/widget_dropdown.dart';
import '../widgets/widget_button.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  static const List<String> categories = ['Work', 'Personal', 'Study'];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.playlist_add_check_rounded,
                              color: cs.primary,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Tambah Todo',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(),

                        const SizedBox(height: 12),
                        const AppTextField(
                          label: 'Judul',
                          prefixIcon: Icon(Icons.edit_outlined),
                        ),
                        const SizedBox(height: 12),
                        const AppTextField(
                          label: 'Deskripsi',
                          maxLines: 3,
                          prefixIcon: Icon(Icons.notes_outlined),
                        ),
                        const SizedBox(height: 12),
                        CategoryDropdown(
                          label: 'Kategori',
                          items: categories,
                          value: null,
                          onChanged: (_) {},
                        ),

                        const SizedBox(height: 16),
                        AppButton(text: 'Tambah', onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
