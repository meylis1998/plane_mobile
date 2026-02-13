import 'package:core_foundation/src/either/either.dart';
import 'package:core_foundation/src/failure/failure.dart';

/// A [Future] that returns an [Either] with [Failure] on the left.
typedef FutureEither<T> = Future<Either<Failure, T>>;

/// A [Future] that returns an [Either] with [Failure] or void.
typedef FutureVoid = Future<Either<Failure, void>>;
