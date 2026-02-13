import 'package:core_foundation/src/either/either.dart';

/// Convenience extensions on [Either].
extension EitherExtensions<L, R> on Either<L, R> {
  /// Returns the [Left] value or null.
  L? get leftOrNull => fold((l) => l, (_) => null);

  /// Returns the [Right] value or null.
  R? get rightOrNull => getOrNull();

  /// Runs [action] if this is a [Right], returning the original [Either].
  Either<L, R> tap(void Function(R right) action) {
    if (this is Right<L, R>) {
      action((this as Right<L, R>).value);
    }
    return this;
  }

  /// Runs [action] if this is a [Left], returning the original [Either].
  Either<L, R> tapLeft(void Function(L left) action) {
    if (this is Left<L, R>) {
      action((this as Left<L, R>).value);
    }
    return this;
  }
}

/// Convenience extensions on [Future<Either>].
extension FutureEitherExtensions<L, R> on Future<Either<L, R>> {
  /// Applies [onLeft] if [Left] or [onRight] if [Right] on the resolved value.
  Future<T> foldAsync<T>(
    T Function(L left) onLeft,
    T Function(R right) onRight,
  ) async {
    final result = await this;
    return result.fold(onLeft, onRight);
  }

  /// Maps the [Right] value of the resolved [Either].
  Future<Either<L, T>> mapAsync<T>(T Function(R right) f) async {
    final result = await this;
    return result.map(f);
  }
}
