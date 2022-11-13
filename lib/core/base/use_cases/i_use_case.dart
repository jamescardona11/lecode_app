abstract class CommandData {}

abstract class BaseUseCase<R extends dynamic, I extends CommandData> {
  R call(I data);
}

typedef CommandUseCase<I extends CommandData> = BaseUseCase<void, I>;

typedef QueryUseCase<R, I extends CommandData> = BaseUseCase<R, I>;

typedef FutureCommandUseCase<I extends CommandData>
    = BaseUseCase<Future<void>, I>;

typedef FutureQueryUseCase<R, I extends CommandData>
    = BaseUseCase<Future<R>, I>;

typedef StreamQueryUseCase<R, I extends CommandData>
    = BaseUseCase<Stream<R>, I>;
