import 'package:meta/meta.dart';

/// A type that represents either a failure [L] or a success [R].
@immutable
sealed class Either<L, R> {
  const Either();

  /// Returns true if this is a [Left].
  bool get isLeft => this is Left<L, R>;

  /// Returns true if this is a [Right].
  bool get isRight => this is Right<L, R>;

  /// Applies [onLeft] if this is a [Left] or [onRight] if this is a [Right].
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight);

  /// Maps the [Right] value using [f].
  Either<L, T> map<T>(T Function(R right) f);

  /// Maps the [Left] value using [f].
  Either<T, R> mapLeft<T>(T Function(L left) f);

  /// FlatMaps the [Right] value using [f].
  Either<L, T> flatMap<T>(Either<L, T> Function(R right) f);

  /// Returns the [Right] value or null.
  R? getOrNull();

  /// Returns the [Right] value or [defaultValue].
  R getOrElse(R Function() defaultValue);
}

/// Represents the left (failure) side of [Either].
@immutable
final class Left<L, R> extends Either<L, R> {
  const Left(this.value);

  final L value;

  @override
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) =>
      onLeft(value);

  @override
  Either<L, T> map<T>(T Function(R right) f) => Left(value);

  @override
  Either<T, R> mapLeft<T>(T Function(L left) f) => Left(f(value));

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R right) f) => Left(value);

  @override
  R? getOrNull() => null;

  @override
  R getOrElse(R Function() defaultValue) => defaultValue();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Left<L, R> && other.value == value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Left($value)';
}

/// Represents the right (success) side of [Either].
@immutable
final class Right<L, R> extends Either<L, R> {
  const Right(this.value);

  final R value;

  @override
  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) =>
      onRight(value);

  @override
  Either<L, T> map<T>(T Function(R right) f) => Right(f(value));

  @override
  Either<T, R> mapLeft<T>(T Function(L left) f) => Right(value);

  @override
  Either<L, T> flatMap<T>(Either<L, T> Function(R right) f) => f(value);

  @override
  R? getOrNull() => value;

  @override
  R getOrElse(R Function() defaultValue) => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Right<L, R> && other.value == value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Right($value)';
}
