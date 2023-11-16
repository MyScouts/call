part of 'upgrade_cubit.dart';

@immutable
sealed class UpgradeState {}

final class UpgradeInitial extends UpgradeState {}

final class OnUpgradePdoneOTP extends UpgradeState {}

final class UpgradePdoneOTPSuccess extends UpgradeState {}

final class UpgradePdoneOTPFail extends UpgradeState {
  final String message;
  UpgradePdoneOTPFail({required this.message});
}
