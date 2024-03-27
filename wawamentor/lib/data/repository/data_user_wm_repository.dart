import 'dart:convert';

import 'package:wawamentor/data/data_provider/data_user_wm_data_provider.dart';
import 'package:wawamentor/models/user_wm_model.dart';

class DataUserRepository {
  final UserDataProvider userDataProvider;

  DataUserRepository(this.userDataProvider);

  Future<UserModel> getUserData(String idUser, String api) async {
    try {
      final dataUser = await userDataProvider.getDataWM(idUser, api);

      final dataUserDecode = jsonDecode(dataUser);

      return UserModel.fromMap(dataUserDecode);
    } catch (e) {
      throw e.toString();
    }
  }
}
