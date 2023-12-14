// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodosItem {
  final int? id;
  final String title;
  final String description;
  final int isDone;

  TodosItem({
    this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory TodosItem.fromMap(Map<String, dynamic> map) {
    return TodosItem(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodosItem.fromJson(String source) =>
      TodosItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodosItem(id: $id, title: $title, description: $description, isDone: $isDone)';
  }

  TodosItem copyWith({
    int? id,
    String? title,
    String? description,
    int? isDone,
  }) {
    return TodosItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
