abstract class BaseUseCase<R extends Object?, I extends dynamic> {
  R call(I data);
}

abstract class FacadeUseCase<I extends dynamic>
    extends BaseUseCase<Future<void>, I> {}

abstract class CommandUseCase<I extends dynamic>
    implements BaseUseCase<void, I> {}

abstract class FutureCommandUseCase<I extends dynamic>
    implements BaseUseCase<Future<void>, I> {}

abstract class QueryUseCase<R extends dynamic, I extends dynamic>
    implements BaseUseCase<R, I> {}
