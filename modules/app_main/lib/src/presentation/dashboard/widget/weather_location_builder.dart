import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class WeatherLocationBuilder extends StatefulWidget {
  const WeatherLocationBuilder({super.key, required this.builder});
  final Widget Function(Position? currentPosition, String? country) builder;
  @override
  State<WeatherLocationBuilder> createState() => _WeatherLocationBuilderState();
}

class _WeatherLocationBuilderState extends State<WeatherLocationBuilder> {
  StreamSubscription? _positionSub;
  Placemark? _address;
  Position? _currentPosition;


  Future<void> checkPermission() async {
    try {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
      if (permission == LocationPermission.deniedForever) {
        return;
      }
    } catch (e) {
      debugPrint("checkPermission exception $e");
    }
    if (_positionSub != null) {
      await _positionSub?.cancel();
    }
    _positionSub = Geolocator.getPositionStream().listen(handlePosition);

    try {
      final position = await Geolocator.getCurrentPosition();
      handlePosition(position);
    } catch (e) {
      debugPrint("checkPermission exception $e");
    }
  }

  void handlePosition(Position position) async {
    final latitude = position.latitude;
    final longitude = position.longitude;
    setState(() {
      _currentPosition = position;
    });
    final output = await placemarkFromCoordinates(latitude, longitude);
    _address = Placemark();
    if (output.isNotEmpty) {
      if (mounted) {
        setState(() {
          _address = output[0];
        });
      }
    }
  }

  @override
  void dispose() {
    _positionSub?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkPermission();
  }


  @override
  Widget build(BuildContext context) {
    return widget.builder(_currentPosition, _address?.subAdministrativeArea);
  }
}
