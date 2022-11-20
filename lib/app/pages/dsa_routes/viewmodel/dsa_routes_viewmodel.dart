import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'dsa_routes_state.dart';

class DsaRoutesViewModel extends BaseViewModel<DsaRoutesState> {
  DsaRoutesViewModel(this._readAllRoutes) : super(const DsaRoutesState()) {
    _listenStreams();
  }

  final StreamQueryUseCase<Iterable<DsaRouteProblemsModel>,
      ReadAllRoutesProblemsData> _readAllRoutes;

  late StreamSubscription<Iterable<DsaRouteProblemsModel>>
      _streamRoutesProblemsSubscription;

  @override
  void close() {
    _streamRoutesProblemsSubscription.cancel();
    super.close();
  }

  Future<void> _listenStreams() async {
    _streamRoutesProblemsSubscription = _readAllRoutes
        .call(const ReadAllRoutesProblemsData())
        .doOnData(_emitNewRouteData)
        .listen((_) {});
  }

  void _emitNewRouteData(Iterable<DsaRouteProblemsModel> items) {
    emit(state.copyWith(routes: items.toList()));
  }
}
