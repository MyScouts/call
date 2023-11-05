import 'package:app_core/app_core.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';

typedef GetListGroupsBloc = GetListBloc<Group>;

typedef GetListTeamsBloc = GetListBlocParam1<Team, String>;

typedef GetFanGroupBloc = GetDetailBloc<FanGroup>;
