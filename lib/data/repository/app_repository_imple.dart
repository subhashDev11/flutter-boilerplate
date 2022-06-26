import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../core/failure.dart';
import '../../services/connectivity_service.dart';
import '../../services/http_services.dart';
import '../../utils/logger_utils.dart';
import '../data_source/app_data_source.dart';
import '../models/guard/user_model.dart';
import 'app_repository.dart';

class AppRepositoryImple extends AppRepository {
  final ConnectivityService connectivityService;
  final AppDataSource appDataSource;


  AppRepositoryImple({
    required this.appDataSource,
    required this.connectivityService,
  });

  @override
  Future<Either<Failure, User?>> login(
      {required String email, required String password}) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res =
        await appDataSource.login(email: email, password: password);
        if(res['status']!=200){
          return Left(NotFound(message: res['message'] ?? 'Failed to login, Invalid Credential'));
        }
        return Right(User.fromJson(res));
      } catch (e) {
        AppLogger.e(e.toString());
        return const Left(NotFound(message: 'Failed to login, Invalid Credential'));
      }
    } else {
      return const Left(NotFound(message: 'Internet connection not found!'));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadImage(
      {required String userId, required File image}) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CustomResponse>> register({
    required String fullName,
    required String emailId,
    required String password,
  }) async {
    if (await connectivityService.hasInternetConnectivity()) {
      try {
        final res = await appDataSource.register(
            fullName: fullName,
            emailId: emailId,
            password: password
        );
        if(res['statusCode']!=null && res['statusCode']=='200'){
          return Right(CustomResponse(
            isSuccess: true,
            data: '',
            message: res['message'],
          ));
        }else{
          return Right(CustomResponse(
            isSuccess: false,
            data: '',
            message: res['message'],
          ));
        }
      } catch (e) {
        return Left(NotFound(message: e.toString()));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool?>> deleteUserSessionData() async{
    try {
      await appDataSource.deleteUserSession();
      return const Right(true);
    } catch (e) {
      AppLogger.e(e.toString());
      return const Left(NotFound());
    }
  }

  @override
  Future<Either<Failure, User?>> getUserSessionData() async{
    try {
      final res = await appDataSource.getUserSession();
      if (res != null) {
        return Right(res);
      }
      return const Left(NotFound(message: 'Failed to load data!'));
    } catch (e) {
      AppLogger.e(e.toString());
      return const Left(NotFound());
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool?>> setUserSessionData({required User user}) async{
    try {
      await appDataSource.setUserSession(userDataModel: user);
      return const Right(true);
    } catch (e) {
      AppLogger.e(e.toString());
      return const Left(NotFound());
    }
  }


}

