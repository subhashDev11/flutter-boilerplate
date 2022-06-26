
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  final String? message;
  const Failure({this.message});

  @override
  List<Object?> get props => [

  ];
}

/// Other Failure

class ServerFailure extends Failure {}

class NotFound extends Failure {
  const NotFound({String? message}) : super(message: message);
}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

