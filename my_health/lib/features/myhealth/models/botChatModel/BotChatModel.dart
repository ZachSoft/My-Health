// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:my_health/features/myhealth/models/partChatModel/partchatmodel.dart';

// BotModel
part 'BotChatModel.g.dart';

@HiveType(typeId: 0)
class BotchatModel {
  @HiveField(0)
  final String role;
  @HiveField(1)
  final List<PartChatModel> parts;
  BotchatModel({
    required this.role,
    required this.parts,
  });

  // // Helpers function
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory BotchatModel.fromMap(Map<String, dynamic> map) {
    return BotchatModel(
      role: map['role'] as String,
      parts: List<PartChatModel>.from(
        (map['parts'] as List<int>).map<PartChatModel>(
          (x) => PartChatModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BotchatModel.fromJson(String source) =>
      BotchatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
