import '../../services/app_json_store.dart';
import '../../services/base_api.dart';
import '../../services/http_services.dart';
import '../models/guard/user_model.dart';
import 'app_data_source.dart';

class AppDataSourceImple extends AppDataSource {
  final ApiProvider apiProvider;
  final AppJsonStore appJsonStore;

  AppDataSourceImple({required this.apiProvider,required this.appJsonStore});


  @override
  Future<User?> getUserSession() async {
    return await appJsonStore.getUserData();
  }

  @override
  Future<void> deleteUserSession() async{
    await appJsonStore.deleteUserSessionData();
  }

  @override
  Future<User?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<dynamic> login(
      {required String email, required String password}) async {
    var data = ({
      "email": email,
      "password": password,
    });
    return await apiProvider.post(
        url: "${BaseApi.login}?email=$email&&password=$password",
        data: data);
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }


  @override
  Future<User> getUserById() {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future register({required String fullName, required String emailId, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> setUserSession({required User userDataModel}) async{
    await appJsonStore.setUserData(userDataModel);
  }
}
