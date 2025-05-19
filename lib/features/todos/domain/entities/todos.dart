
class Todos {
  final String id, title, description;
  final bool isChecked;
  final DateTime createdAt;

  const Todos({
    required this.id,
    required this.title,
    required this.description,
    required this.isChecked,
    required this.createdAt,
  });
}
