class ModelTodo {
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
    this.status = false,
  });
}
