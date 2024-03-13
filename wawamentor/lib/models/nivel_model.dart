// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NivelModel {
  final String courseLevel;
  NivelModel({
    required this.courseLevel,
  });

  NivelModel copyWith({
    String? courseLevel,
  }) {
    return NivelModel(
      courseLevel: courseLevel ?? this.courseLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'courseLevel': courseLevel,
    };
  }

  factory NivelModel.fromMap(Map<String, dynamic> map) {
    return NivelModel(
      courseLevel: map['COURSE_LEVEL'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NivelModel.fromJson(String source) =>
      NivelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NivelModel(courseLevel: $courseLevel)';

  @override
  bool operator ==(covariant NivelModel other) {
    if (identical(this, other)) return true;

    return other.courseLevel == courseLevel;
  }

  @override
  int get hashCode => courseLevel.hashCode;
}
