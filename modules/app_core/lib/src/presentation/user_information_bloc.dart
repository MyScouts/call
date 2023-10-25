import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../domain/entities/user/user.dart';

@singleton
class UserInformationCubit extends Cubit<User?> {
  UserInformationCubit() : super(null);

  void notifyUserChange(User? userNew) {
    emit(userNew);
  }
}
