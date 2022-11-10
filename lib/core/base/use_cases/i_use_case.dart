abstract class CommandData {}

abstract class BaseUseCase<R extends dynamic, I extends CommandData> {
  R call(I data);
}

typedef CommandUseCase<I extends CommandData> = BaseUseCase<void, I>;

typedef QueryUseCase<I extends CommandData> = BaseUseCase<void, I>;

typedef FutureCommandUseCase<I extends CommandData>
    = BaseUseCase<Future<void>, I>;

typedef FutureQueryUseCase<R, I extends CommandData>
    = BaseUseCase<Future<R>, I>;

// typedef StreamQueryUseCase<I extends CommandParam>
//     = BaseUseCase<Stream<void>, I>;
