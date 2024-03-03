import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecommandationModel {
  final String id;
  final String name;
  final String description;
  final String type;
  final String imageurl;
  final String? calories;
  final String? fiber;
  final String? glycemicIndex;
  final String? protein;
  final List<String>? likes;

  final List<String>? values;
  RecommandationModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.imageurl,
    this.calories,
    this.fiber,
    this.likes,
    this.glycemicIndex,
    this.protein,
    this.values,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'type': type,
      'imageurl': imageurl,
      'calories': calories,
      'fiber': fiber,
      'glycemicIndex': glycemicIndex,
      'protein': protein,
      'values': values,
      'likes': likes,
    };
  }

  factory RecommandationModel.fromMap(
      DocumentSnapshot<Map<String, dynamic>> map) {
    return RecommandationModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      type: map['type'] as String,
      imageurl: map['imageurl'] as String,
      calories: map['calories'] != null ? map['calories'] as String : null,
      fiber: map['fiber'] != null ? map['fiber'] as String : null,
      glycemicIndex:
          map['glycemicIndex'] != null ? map['glycemicIndex'] as String : null,
      protein: map['protein'] != null ? map['protein'] as String : null,
      values: map['values'] != null
          ? List<String>.from(
              (map['values']),
            )
          : null,
      likes: map['likes'] != null
          ? List<String>.from(
              (map['likes']),
            )
          : null,
    );
  }
}
