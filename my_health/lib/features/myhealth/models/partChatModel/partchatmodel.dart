// Second Class
import 'dart:convert';

import 'package:hive/hive.dart';

part 'partchatmodel.g.dart';

@HiveType(typeId: 1)
class PartChatModel {
  @HiveField(0)
  final String text;
  PartChatModel({required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory PartChatModel.fromMap(Map<String, dynamic> map) {
    return PartChatModel(
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PartChatModel.fromJson(String source) =>
      PartChatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
