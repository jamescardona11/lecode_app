abstract class CommandData {}

abstract class BaseUseCase<R extends dynamic, I extends CommandData> {
  R call(I data);
}

abstract class CommandUseCase<I extends CommandData>
    implements BaseUseCase<void, I> {}

abstract class QueryUseCase<R, I extends CommandData>
    extends BaseUseCase<R, I> {}

abstract class FutureCommandUseCase<I extends CommandData>
    extends BaseUseCase<Future<void>, I> {}

abstract class FutureQueryUseCase<R, I extends CommandData>
    extends BaseUseCase<Future<R>, I> {}

abstract class StreamQueryUseCase<R, I extends CommandData>
    extends BaseUseCase<Stream<R>, I> {}
