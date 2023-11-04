import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'block_user_state.dart';

class BlockUserCubit extends Cubit<BlockUserState> {
  BlockUserCubit() : super(BlockUserInitial());
}
