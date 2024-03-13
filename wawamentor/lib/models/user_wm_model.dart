// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int idUser;
  final String firstName;
  final String? secondName;
  final String lastName;
  final String? secLastName;
  final String idCed;
  final String userProvince;
  final String userCity;
  final String userAddress;
  final String birthdate;
  final String gender;
  final String phone;
  final String? phone2;
  final String userMail;
  final String userPassword;
  final String accountStatus;
  final String? userPhoto;
  final int creationUser;
  UserModel({
    required this.idUser,
    required this.firstName,
    this.secondName,
    required this.lastName,
    this.secLastName,
    required this.idCed,
    required this.userProvince,
    required this.userCity,
    required this.userAddress,
    required this.birthdate,
    required this.gender,
    required this.phone,
    this.phone2,
    required this.userMail,
    required this.userPassword,
    required this.accountStatus,
    this.userPhoto,
    required this.creationUser,
  });

  UserModel copyWith({
    int? idUser,
    String? firstName,
    String? secondName,
    String? lastName,
    String? secLastName,
    String? idCed,
    String? userProvince,
    String? userCity,
    String? userAddress,
    String? birthdate,
    String? gender,
    String? phone,
    String? phone2,
    String? userMail,
    String? userPassword,
    String? accountStatus,
    String? userPhoto,
    int? creationUser,
  }) {
    return UserModel(
      idUser: idUser ?? this.idUser,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      lastName: lastName ?? this.lastName,
      secLastName: secLastName ?? this.secLastName,
      idCed: idCed ?? this.idCed,
      userProvince: userProvince ?? this.userProvince,
      userCity: userCity ?? this.userCity,
      userAddress: userAddress ?? this.userAddress,
      birthdate: birthdate ?? this.birthdate,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      phone2: phone2 ?? this.phone2,
      userMail: userMail ?? this.userMail,
      userPassword: userPassword ?? this.userPassword,
      accountStatus: accountStatus ?? this.accountStatus,
      userPhoto: userPhoto ?? this.userPhoto,
      creationUser: creationUser ?? this.creationUser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'firstName': firstName,
      'secondName': secondName,
      'lastName': lastName,
      'secLastName': secLastName,
      'idCed': idCed,
      'userProvince': userProvince,
      'userCity': userCity,
      'userAddress': userAddress,
      'birthdate': birthdate,
      'gender': gender,
      'phone': phone,
      'phone2': phone2,
      'userMail': userMail,
      'userPassword': userPassword,
      'accountStatus': accountStatus,
      'userPhoto': userPhoto,
      'creationUser': creationUser,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      idUser: map['ID_USER'] as int,
      firstName: map['FIRST_NAME'] as String,
      secondName:
          map['SECOND_NAME'] != null ? map['SECOND_NAME'] as String : null,
      lastName: map['LAST_NAME'] as String,
      secLastName:
          map['SEC_LAST_NAME'] != null ? map['SEC_LAST_NAME'] as String : null,
      idCed: map['ID_CED'] as String,
      userProvince: map['USER_PROVINCE'] as String,
      userCity: map['USER_CITY'] as String,
      userAddress: map['USER_ADDRESS'] as String,
      birthdate: map['BIRTHDATE'] as String,
      gender: map['GENDER'] as String,
      phone: map['PHONE1'] as String,
      phone2: map['PHONE2'] != null ? map['PHONE2'] as String : null,
      userMail: map['USER_MAIL'] as String,
      userPassword: map['USER_PASSWORD'] as String,
      accountStatus: map['ACCOUNT_STATUS'] as String,
      userPhoto: map['USER_PHOTO'] != null ? map['USER_PHOTO'] as String : null,
      creationUser: map['CREATION_USER'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(idUser: $idUser, firstName: $firstName, secondName: $secondName, lastName: $lastName, secLastName: $secLastName, idCed: $idCed, userProvince: $userProvince, userCity: $userCity, userAddress: $userAddress, birthdate: $birthdate, gender: $gender, phone: $phone, phone2: $phone2, userMail: $userMail, userPassword: $userPassword, accountStatus: $accountStatus, userPhoto: $userPhoto, creationUser: $creationUser)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.idUser == idUser &&
        other.firstName == firstName &&
        other.secondName == secondName &&
        other.lastName == lastName &&
        other.secLastName == secLastName &&
        other.idCed == idCed &&
        other.userProvince == userProvince &&
        other.userCity == userCity &&
        other.userAddress == userAddress &&
        other.birthdate == birthdate &&
        other.gender == gender &&
        other.phone == phone &&
        other.phone2 == phone2 &&
        other.userMail == userMail &&
        other.userPassword == userPassword &&
        other.accountStatus == accountStatus &&
        other.userPhoto == userPhoto &&
        other.creationUser == creationUser;
  }

  @override
  int get hashCode {
    return idUser.hashCode ^
        firstName.hashCode ^
        secondName.hashCode ^
        lastName.hashCode ^
        secLastName.hashCode ^
        idCed.hashCode ^
        userProvince.hashCode ^
        userCity.hashCode ^
        userAddress.hashCode ^
        birthdate.hashCode ^
        gender.hashCode ^
        phone.hashCode ^
        phone2.hashCode ^
        userMail.hashCode ^
        userPassword.hashCode ^
        accountStatus.hashCode ^
        userPhoto.hashCode ^
        creationUser.hashCode;
  }
}
