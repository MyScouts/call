import 'dart:developer';

const String addDashBoardItemEvent = 'addDashBoardItemEvent';
const String changeGroupEvent = 'changeGroupEvent';
const String changeBg = 'changeBg';
const String cancelEditMode = 'cancelEditMode';
const String showEditMode = 'showEditMode';
const String showAppStore = 'showAppStore';
const String refreshUser = 'refreshUser';
const String dashboardPageChange = 'dashboardPageChange';

typedef ObserverCallback = void Function(dynamic options);

class NotificationCenter {
  final Map<String, Map<int, ObserverCallback>> _channelObservers = {};

  static final NotificationCenter _sharedCenter = NotificationCenter._();

  NotificationCenter._();

  static void subscribe({
    required String channel,
    required Object observer,
    required ObserverCallback onNotification,
  }) {
    if (_sharedCenter._channelObservers[channel] == null) {
      _sharedCenter._channelObservers[channel] = {};
    }

    assert(
    _sharedCenter._channelObservers[channel]?[observer.hashCode] == null,
    'Observer $observer ${observer.hashCode} is already subscribed to the channel $channel',
    );

    _sharedCenter._channelObservers[channel]?[observer.hashCode] =
        onNotification;
  }

  ///
  /// Unsubscribe the [observer] from listening on a notification [channel].
  ///
  /// When the [observer] unsubscribes, its onNotification callback will not be
  /// called when a poster posts. This must be called when an object is to be disposed of
  /// or else a retain cycle will occur.
  ///
  /// Throws if the [observer] is not subscribed to the [channel].
  ///
  static void unsubscribe({required String channel, required Object observer}) {
    if (_sharedCenter._channelObservers[channel] == null) return;

    assert(
    _sharedCenter._channelObservers[channel]![observer.hashCode] != null,
    'Observer $observer ${observer.hashCode} is not subscribed to channel $channel',
    );

    _sharedCenter._channelObservers[channel]!.remove(observer.hashCode);
  }

  ///
  /// Post a notification to the [channel] with optional [options].
  ///
  /// When a post is sent to a channel, all observers that are subscribed will
  /// get notified via their callbacks. If options are supplied, they will be sent
  /// to the callback.
  ///
  static void post({required String channel, dynamic options}) {
    log('NOTIFICATION_CENTER_POST: $channel $options');
    for (final callback in _sharedCenter._channelObservers[channel]?.values ??
        <Function(dynamic)>[]) {
      Future(() => callback(options));
    }
  }
}