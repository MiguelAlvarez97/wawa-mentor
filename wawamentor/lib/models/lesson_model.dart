// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LessonModel {
  final int idLesson;
  final int idCourse;
  final String lessonTitle;
  final String lessonContent;
  final String lessonCreationDate;
  final int isVisible;
  LessonModel({
    required this.idLesson,
    required this.idCourse,
    required this.lessonTitle,
    required this.lessonContent,
    required this.lessonCreationDate,
    required this.isVisible,
  });

  LessonModel copyWith({
    int? idLesson,
    int? idCourse,
    String? lessonTitle,
    String? lessonContent,
    String? lessonCreationDate,
    int? isVisible,
  }) {
    return LessonModel(
      idLesson: idLesson ?? this.idLesson,
      idCourse: idCourse ?? this.idCourse,
      lessonTitle: lessonTitle ?? this.lessonTitle,
      lessonContent: lessonContent ?? this.lessonContent,
      lessonCreationDate: lessonCreationDate ?? this.lessonCreationDate,
      isVisible: isVisible ?? this.isVisible,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idLesson': idLesson,
      'idCourse': idCourse,
      'lessonTitle': lessonTitle,
      'lessonContent': lessonContent,
      'lessonCreationDate': lessonCreationDate,
      'isVisible': isVisible,
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    return LessonModel(
      idLesson: map['ID_LESSON'] as int,
      idCourse: map['ID_COURSE'] as int,
      lessonTitle: map['LESSON_TITLE'] as String,
      lessonContent: map['LESSON_CONTENT'] as String,
      lessonCreationDate: map['LESSON_CREATION_DATE'] as String,
      isVisible: map['IS_VISIBLE'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonModel.fromJson(String source) =>
      LessonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LessonModel(idLesson: $idLesson, idCourse: $idCourse, lessonTitle: $lessonTitle, lessonContent: $lessonContent, lessonCreationDate: $lessonCreationDate, isVisible: $isVisible)';
  }

  @override
  bool operator ==(covariant LessonModel other) {
    if (identical(this, other)) return true;

    return other.idLesson == idLesson &&
        other.idCourse == idCourse &&
        other.lessonTitle == lessonTitle &&
        other.lessonContent == lessonContent &&
        other.lessonCreationDate == lessonCreationDate &&
        other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return idLesson.hashCode ^
        idCourse.hashCode ^
        lessonTitle.hashCode ^
        lessonContent.hashCode ^
        lessonCreationDate.hashCode ^
        isVisible.hashCode;
  }
}
