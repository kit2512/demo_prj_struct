class Task {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool completed;

  Task({
    required this.id,
    required this.title,
    required this.description,
    DateTime? dueDate,
    this.completed = false,
  }) : dueDate = dueDate ?? DateTime.now().add(const Duration(days: 1));

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        dueDate: DateTime.parse(json['dueDate']),
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'dueDate': dueDate.toIso8601String(),
        'completed': completed,
      };

  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    bool? completed,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        dueDate: dueDate ?? this.dueDate,
        completed: completed ?? this.completed,
      );
}
