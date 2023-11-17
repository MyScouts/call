part of 'upgrade_cubit.dart';

@immutable
sealed class UpgradeState {}

final class UpgradeInitial extends UpgradeState {}

final class OnUpgradePdoneOTP extends UpgradeState {}

final class UpgradePdoneOTPSuccess extends UpgradeState {}

final class UpgradePdoneOTPFail extends UpgradeState {
  final String code;
  UpgradePdoneOTPFail({required this.code});
}

final class OnUpgradeEkyc extends UpgradeState {}

final class UpgradeEkycSuccess extends UpgradeState {}

final class UpgradeEkycFail extends UpgradeState {
  final String code;
  UpgradeEkycFail({required this.code});
}
