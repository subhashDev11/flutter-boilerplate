import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../core/failure.dart';
import '../../services/http_services.dart';
import '../models/guard/user_model.dart';

abstract class AppRepository {
  Future<Either<Failure, User?>> login(
      {required String email, required String password});

  Future<Either<Failure, User?>> getCurrentUser();


  Future<Either<Failure, bool>> logout();

  Future<Either<Failure, CustomResponse>> register({
    required String fullName,
    required String emailId,
    required String password,
  });

  Future<Either<Failure, User?>> getUserSessionData();
  Future<Either<Failure, bool?>> deleteUserSessionData();
  Future<Either<Failure, bool?>> setUserSessionData({required User user});

}

