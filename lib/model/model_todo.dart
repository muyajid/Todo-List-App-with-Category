class ModelTodo {
  final int? id;
  String todo;
  String deskripsi;
  String kategori;
  String tanggal;
  bool status;

  ModelTodo(
    this.todo,
    this.deskripsi,
    this.kategori,
    this.tanggal, {
    this.id,
    this.status = false,
  });

  factory ModelTodo.fromMap(Map<String, dynamic> e) => ModelTodo(
    (e['title'] ?? '') as String,
    (e['description'] ?? '') as String,
    (e['category'] ?? '') as String,
    (e['date'] ?? '') as String,
    id: e['id'] as int?,
    status: ((e['is_done'] ?? 0) as int) == 1,
  );
}
