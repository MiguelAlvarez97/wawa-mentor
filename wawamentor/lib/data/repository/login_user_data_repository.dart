import 'dart:convert';

import 'package:wawamentor/data/data_provider/login_user_data_provider.dart';
import 'package:wawamentor/models/user_wm_model.dart';

class LoginUserDataRepository {
  final LoginUserDataProvider loginUserDataProvider;

  LoginUserDataRepository(this.loginUserDataProvider);

  Future<UserModel> getUserData(
      String username, String password, String apiLogin) async {
    try {
      final dataUser =
          await loginUserDataProvider.getUserData(username, password, apiLogin);
      final userlist = jsonDecode(dataUser);

      // Mapea cada elemento de la lista a una instancia del modelo de Cursos
      // List<UserModel> user =
      //     userlist.map((user) => UserModel.fromMap(user)).toList();
      return UserModel.fromMap(userlist);
    } catch (e) {
      throw e.toString();
    }
  }
}
