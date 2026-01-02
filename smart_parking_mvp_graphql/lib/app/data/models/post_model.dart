import 'base_model.dart';

class PostModel extends BaseModel {
  final String id;
  final String title;
  final String content;

  PostModel({required this.id, required this.title, required this.content});

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }
}
