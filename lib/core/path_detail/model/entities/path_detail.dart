// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pocket/pocket.dart';

class PathDetailModel extends IPocketModel {
  @override
  final String id;

  PathDetailModel({
    required this.id,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory PathDetailModel.fromJson(Map<String, dynamic> json) =>
      PathDetailModel(
        id: json['id'] as String,
      );
}
