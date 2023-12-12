import 'dart:async';

import 'package:flutter/widgets.dart';

class PlayerRegistry {
  final ChangeNotifier controller;
  final FutureOr Function(ChangeNotifier controller) _pause;

  PlayerRegistry(this.controller, this._pause);

  FutureOr pause() {
    return _pause(controller);
  }

  void addListener(VoidCallback listener) {
    controller.addListener(listener);
  }

  void removeListener(VoidCallback listener) {
    controller.removeListener(listener);
  }
}

class _SinglePlayerPlayingManager {
  List<PlayerRegistry> players = [];

  PlayerRegistry? _currentPlaying;

  _SinglePlayerPlayingManager();

  void addPlayer(PlayerRegistry player) {
    if (!players.contains(player)) {
      players.add(player);
    }
  }

  void removePlayer(PlayerRegistry player) {
    if (players.contains(player)) {
      players.remove(player);
    }
    if (player == _currentPlaying) {
      _currentPlaying = null;
    }
  }

  bool isThisCurrentPlaying(PlayerRegistry player) {
    return _currentPlaying == player;
  }

  void setCurrentPlaying(PlayerRegistry player) {
    _currentPlaying == player;

    for (final p in players) {
      if (p != player) {
        p.pause();
      }
    }
  }
}

// Singleton
final _manager = _SinglePlayerPlayingManager();

mixin SinglePlayerPlayingMixin<T extends StatefulWidget> on State<T> {
  PlayerRegistry? _playerCtrl;

  bool? _lastStateIsPlaying;

  @override
  void initState() {
    super.initState();
    _playerCtrl = PlayerRegistry(
      registerPlayer(context),
      pause,
    );
    _setupListener();
  }

  @override
  void dispose() {
    _removePlayerCtroller();
    _playerCtrl = null;
    super.dispose();
  }

  ChangeNotifier registerPlayer(BuildContext context);

  bool isPlaying(ChangeNotifier controller);

  /// Calling when the manage tell this controller need to pause because of
  /// other player want to play
  FutureOr pause(ChangeNotifier controller);

  void _setupListener() {
    if (_playerCtrl != null) {
      _manager.addPlayer(_playerCtrl!);

      _playerCtrl!.addListener(_valueChangeListionable);
    }
  }

  void _removePlayerCtroller() {
    if (_playerCtrl != null) {
      _manager.removePlayer(_playerCtrl!);
      _playerCtrl!.removeListener(_valueChangeListionable);
    }
  }

  void _valueChangeListionable() {
    if (_playerCtrl != null) {
      final playing = isPlaying(_playerCtrl!.controller);
      if (_lastStateIsPlaying != true && playing) {
        if (!_manager.isThisCurrentPlaying(_playerCtrl!)) {
          _manager.setCurrentPlaying(_playerCtrl!);
        }
      }
      _lastStateIsPlaying = playing;
    }
  }
}
