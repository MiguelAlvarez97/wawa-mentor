// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CursosModel {
  final int idCourse;
  final String courseName;
  final String? courseDesc;
  final String? courseImg;
  final String courseVideo;
  final int isOptional;
  final String startDate;
  final String endDate;
  final String courseLink;
  final String startSchedule;
  final String endSchedule;
  final String daySchedule;
  CursosModel({
    required this.idCourse,
    required this.courseName,
    this.courseDesc,
    this.courseImg,
    required this.courseVideo,
    required this.isOptional,
    required this.startDate,
    required this.endDate,
    required this.courseLink,
    required this.startSchedule,
    required this.endSchedule,
    required this.daySchedule,
  });

  CursosModel copyWith({
    int? idCourse,
    String? courseName,
    String? courseDesc,
    String? courseImg,
    String? courseVideo,
    int? isOptional,
    String? startDate,
    String? endDate,
    String? courseLink,
    String? startSchedule,
    String? endSchedule,
    String? daySchedule,
  }) {
    return CursosModel(
      idCourse: idCourse ?? this.idCourse,
      courseName: courseName ?? this.courseName,
      courseDesc: courseDesc ?? this.courseDesc,
      courseImg: courseImg ?? this.courseImg,
      courseVideo: courseVideo ?? this.courseVideo,
      isOptional: isOptional ?? this.isOptional,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      courseLink: courseLink ?? this.courseLink,
      startSchedule: startSchedule ?? this.startSchedule,
      endSchedule: endSchedule ?? this.endSchedule,
      daySchedule: daySchedule ?? this.daySchedule,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCourse': idCourse,
      'courseName': courseName,
      'courseDesc': courseDesc,
      'courseImg': courseImg,
      'courseVideo': courseVideo,
      'isOptional': isOptional,
      'startDate': startDate,
      'endDate': endDate,
      'courseLink': courseLink,
      'startSchedule': startSchedule,
      'endSchedule': endSchedule,
      'daySchedule': daySchedule,
    };
  }

  factory CursosModel.fromMap(Map<String, dynamic> map) {
    return CursosModel(
      idCourse: map['ID_COURSE'] as int,
      courseName: map['COURSE__NAME'] as String,
      courseDesc:
          map['COURSE_DESC'] != null ? map['COURSE_DESC'] as String : null,
      courseImg: map['COURSE_IMG'] != null ? map['COURSE_IMG'] as String : null,
      courseVideo: map['COURSE_VIDEO'] as String,
      isOptional: map['IS_OPTIONAL'] as int,
      startDate: map['START_DATE'] as String,
      endDate: map['END_DATE'] as String,
      courseLink: map['COURSE_LINK'] as String,
      startSchedule: map['START_SCHEDULE'] as String,
      endSchedule: map['END_SCHEDULE'] as String,
      daySchedule: map['DAY_SCHEDULE'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CursosModel.fromJson(String source) =>
      CursosModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CursosModel(idCourse: $idCourse, courseName: $courseName, courseDesc: $courseDesc, courseImg: $courseImg, courseVideo: $courseVideo, isOptional: $isOptional, startDate: $startDate, endDate: $endDate, courseLink: $courseLink, startSchedule: $startSchedule, endSchedule: $endSchedule, daySchedule: $daySchedule)';
  }

  @override
  bool operator ==(covariant CursosModel other) {
    if (identical(this, other)) return true;

    return other.idCourse == idCourse &&
        other.courseName == courseName &&
        other.courseDesc == courseDesc &&
        other.courseImg == courseImg &&
        other.courseVideo == courseVideo &&
        other.isOptional == isOptional &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.courseLink == courseLink &&
        other.startSchedule == startSchedule &&
        other.endSchedule == endSchedule &&
        other.daySchedule == daySchedule;
  }

  @override
  int get hashCode {
    return idCourse.hashCode ^
        courseName.hashCode ^
        courseDesc.hashCode ^
        courseImg.hashCode ^
        courseVideo.hashCode ^
        isOptional.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        courseLink.hashCode ^
        startSchedule.hashCode ^
        endSchedule.hashCode ^
        daySchedule.hashCode;
  }
}
