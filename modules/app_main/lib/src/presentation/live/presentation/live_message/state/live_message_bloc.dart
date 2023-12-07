import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/core/bloc/core_state.dart';
import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_comment.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LiveMessageBloc extends CoreBloc<LiveMessageEvent, LiveMessageState> {
  LiveMessageBloc() : super(LiveMessageState()) {
    on<SendEvent>(onSendEvent);
    on<UpdateMessage>(
      onUpdateMessage,
      transformer: (event, mapper) => event.asyncExpand(mapper),
    );
    on<_ListenMessage>(onListenMessage);
    add(_ListenMessage());
  }

  void onListenMessage(_, __) {
    NotificationCenter.subscribe(
      channel: receiveMessage,
      observer: this,
      onNotification: (msg) {
        if (msg is LiveMessageData) add(UpdateMessage(msg));
      },
    );
  }

  void onSendEvent(
    SendEvent event,
    Emitter<LiveMessageState> emit,
  ) {
    NotificationCenter.post(channel: sendMessage, options: event.message);
  }

  void onUpdateMessage(
    UpdateMessage event,
    Emitter<LiveMessageState> emit,
  ) {
    emit(state.copyWith(
      comments: [...state.comments, event.comment],
    ));
  }

  @override
  Future<void> close() {
    NotificationCenter.unsubscribe(channel: receiveMessage, observer: this);
    return super.close();
  }
}

class LiveMessageState extends CoreState {
  final List<LiveMessageData> comments;

  LiveMessageState({
    super.status,
    this.comments = const [],
  });

  LiveMessageState copyWith({
    List<LiveMessageData>? comments,
  }) {
    return LiveMessageState(
      status: status,
      comments: comments ?? this.comments,
    );
  }
}

abstract class LiveMessageEvent {}

class SendEvent extends LiveMessageEvent {
  final String message;

  SendEvent(this.message);
}

class UpdateMessage extends LiveMessageEvent {
  final LiveMessageData comment;

  UpdateMessage(this.comment);
}

class _ListenMessage extends LiveMessageEvent {}
