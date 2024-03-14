// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NivelModel {
  final int idTeacher;
  final String courseLevel;
  NivelModel({
    required this.idTeacher,
    required this.courseLevel,
  });

  NivelModel copyWith({
    int? idTeacher,
    String? courseLevel,
  }) {
    return NivelModel(
      idTeacher: idTeacher ?? this.idTeacher,
      courseLevel: courseLevel ?? this.courseLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idTeacher': idTeacher,
      'courseLevel': courseLevel,
    };
  }

  factory NivelModel.fromMap(Map<String, dynamic> map) {
    return NivelModel(
      idTeacher: map['T_ID_USER'] as int,
      courseLevel: map['COURSE_LEVEL'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NivelModel.fromJson(String source) =>
      NivelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NivelModel(idTeacher: $idTeacher, courseLevel: $courseLevel)';

  @override
  bool operator ==(covariant NivelModel other) {
    if (identical(this, other)) return true;

    return other.idTeacher == idTeacher && other.courseLevel == courseLevel;
  }

  @override
  int get hashCode => idTeacher.hashCode ^ courseLevel.hashCode;
}
