import 'package:app_core/app_core.dart';

import 'core_state.dart';

abstract class CoreBloc<T, S extends CoreState> extends Bloc<T, S> {
  CoreBloc(super.initialState);
}
