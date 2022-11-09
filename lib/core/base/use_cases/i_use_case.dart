abstract class CommandParam {}

abstract class BaseUseCase<R extends dynamic, I extends CommandParam> {
  R call(I data);
}

typedef CommandUseCase<I extends CommandParam> = BaseUseCase<void, I>;

typedef QueryUseCase<I extends CommandParam> = BaseUseCase<void, I>;

// typedef FutureCommandUseCase<I extends CommandParam>
//     = BaseUseCase<Future<void>, I>;

// typedef FutureQueryUseCase<I extends CommandParam>
//     = BaseUseCase<Future<void>, I>;

// typedef StreamQueryUseCase<I extends CommandParam>
//     = BaseUseCase<Stream<void>, I>;
