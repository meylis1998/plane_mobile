import 'package:equatable/equatable.dart';

/// Base class for all failures in the application.
abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '$runtimeType: $message';
}

/// A failure originating from the server/API.
class ServerFailure extends Failure {
  const ServerFailure(super.message, {this.statusCode});

  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

/// A failure originating from the local cache/storage.
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// A failure originating from a network connectivity issue.
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// A failure originating from input validation.
class ValidationFailure extends Failure {
  const ValidationFailure(super.message, {this.fieldErrors});

  final Map<String, String>? fieldErrors;

  @override
  List<Object?> get props => [message, fieldErrors];
}
