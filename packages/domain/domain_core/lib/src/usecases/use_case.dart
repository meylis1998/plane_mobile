import 'package:core_foundation/core_foundation.dart';

/// Base class for all use cases.
///
/// [T] is the return type on success.
/// [Params] is the parameter object passed to [call].
// ignore_for_file: one_member_abstracts
abstract class UseCase<T, Params> {
  FutureEither<T> call(Params params);
}

/// Use when a use case does not require parameters.
class NoParams {
  const NoParams();
}
