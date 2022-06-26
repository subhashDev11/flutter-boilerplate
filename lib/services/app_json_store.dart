import 'package:json_store/json_store.dart';

import '../data/models/guard/user_model.dart';

class AppJsonStore {
  late final JsonStore jsonStore;

  AppJsonStore.init() {
    jsonStore = JsonStore();
  }

  Future<User?> getUserData() async {
    final jsonData = await jsonStore.getItem('guard_session');
    if (jsonData != null) {
      return User.fromJson(jsonData);
    }
    return null;
  }

  Future<void> setUserData(User userDataModel) async {
    await jsonStore.setItem('guard_session', userDataModel.toJson());
  }

  Future<void> deleteUserSessionData() async {
    return await jsonStore.deleteItem('guard_session');
  }


}
