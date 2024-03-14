// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeacherModel {
  final int idUser;
  final String teacherRol;
  final String? teacherAboutMe;
  final String? teacherWP;
  final String? teacherFB;
  final String? teacherIG;
  TeacherModel({
    required this.idUser,
    required this.teacherRol,
    this.teacherAboutMe,
    this.teacherWP,
    this.teacherFB,
    this.teacherIG,
  });

  TeacherModel copyWith({
    int? idUser,
    String? teacherRol,
    String? teacherAboutMe,
    String? teacherWP,
    String? teacherFB,
    String? teacherIG,
  }) {
    return TeacherModel(
      idUser: idUser ?? this.idUser,
      teacherRol: teacherRol ?? this.teacherRol,
      teacherAboutMe: teacherAboutMe ?? this.teacherAboutMe,
      teacherWP: teacherWP ?? this.teacherWP,
      teacherFB: teacherFB ?? this.teacherFB,
      teacherIG: teacherIG ?? this.teacherIG,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'teacherRol': teacherRol,
      'teacherAboutMe': teacherAboutMe,
      'teacherWP': teacherWP,
      'teacherFB': teacherFB,
      'teacherIG': teacherIG,
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      idUser: map['ID_USER'] as int,
      teacherRol: map['TEACHER_ROLE'] as String,
      teacherAboutMe: map['TEACHER_ABOUT_ME'] != null
          ? map['TEACHER_ABOUT_ME'] as String
          : null,
      teacherWP:
          map['TEACHER_WSP'] != null ? map['TEACHER_WSP'] as String : null,
      teacherFB: map['TEACHER_FB'] != null ? map['TEACHER_FB'] as String : null,
      teacherIG: map['TEACHER_IG'] != null ? map['TEACHER_IG'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) =>
      TeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherModel(idUser: $idUser, teacherRol: $teacherRol, teacherAboutMe: $teacherAboutMe, teacherWP: $teacherWP, teacherFB: $teacherFB, teacherIG: $teacherIG)';
  }

  @override
  bool operator ==(covariant TeacherModel other) {
    if (identical(this, other)) return true;

    return other.idUser == idUser &&
        other.teacherRol == teacherRol &&
        other.teacherAboutMe == teacherAboutMe &&
        other.teacherWP == teacherWP &&
        other.teacherFB == teacherFB &&
        other.teacherIG == teacherIG;
  }

  @override
  int get hashCode {
    return idUser.hashCode ^
        teacherRol.hashCode ^
        teacherAboutMe.hashCode ^
        teacherWP.hashCode ^
        teacherFB.hashCode ^
        teacherIG.hashCode;
  }
}
