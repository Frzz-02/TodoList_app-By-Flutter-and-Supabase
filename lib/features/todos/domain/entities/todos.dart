
class Todos {
  final String id, title, description;
  final bool isChecked;
  final DateTime createdAt, deadline;

  const Todos({
    required this.id,
    required this.title,
    required this.description,
    required this.isChecked,
    required this.createdAt,
    required this.deadline
  });
}
