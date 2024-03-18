// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResourceModel {
  final int idResource;
  final int? idLesson;
  final String resourceType;
  final String? resourceDesc;
  final String? link;
  ResourceModel({
    required this.idResource,
    this.idLesson,
    required this.resourceType,
    this.resourceDesc,
    this.link,
  });

  ResourceModel copyWith({
    int? idResource,
    int? idLesson,
    String? resourceType,
    String? resourceDesc,
    String? link,
  }) {
    return ResourceModel(
      idResource: idResource ?? this.idResource,
      idLesson: idLesson ?? this.idLesson,
      resourceType: resourceType ?? this.resourceType,
      resourceDesc: resourceDesc ?? this.resourceDesc,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idResource': idResource,
      'idLesson': idLesson,
      'resourceType': resourceType,
      'resourceDesc': resourceDesc,
      'link': link,
    };
  }

  factory ResourceModel.fromMap(Map<String, dynamic> map) {
    final tipo = map['RESOURCE_TYPE'] as String;
    var enlace = map['LINK'] != null ? map['LINK'] as String : null;
    if (tipo == 'JUEGO') {
      enlace = enlace.toString().split('"')[1].toString();
    }
    return ResourceModel(
      idResource: map['ID_RESOURCE'] as int,
      idLesson: map['ID_LESSON'] != null ? map['ID_LESSON'] as int : null,
      resourceType: tipo,
      resourceDesc:
          map['RESOURCE_DESC'] != null ? map['RESOURCE_DESC'] as String : null,
      link: enlace,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceModel.fromJson(String source) =>
      ResourceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResourceModel(idResource: $idResource, idLesson: $idLesson, resourceType: $resourceType, resourceDesc: $resourceDesc, link: $link)';
  }

  @override
  bool operator ==(covariant ResourceModel other) {
    if (identical(this, other)) return true;

    return other.idResource == idResource &&
        other.idLesson == idLesson &&
        other.resourceType == resourceType &&
        other.resourceDesc == resourceDesc &&
        other.link == link;
  }

  @override
  int get hashCode {
    return idResource.hashCode ^
        idLesson.hashCode ^
        resourceType.hashCode ^
        resourceDesc.hashCode ^
        link.hashCode;
  }
}
