enum TypeContract { joinBossGroup, purchasePack, rentPack, jA, isBossGroup }

extension TypeContractExt on TypeContract {
  int getValue() {
    switch (this) {
      case TypeContract.isBossGroup:
        return 0;
      case TypeContract.purchasePack:
        return 1;
      case TypeContract.rentPack:
        return 2;
      case TypeContract.jA:
        return 3;
      case TypeContract.joinBossGroup:
        return 4;
      default:
        return 0;
    }
  }
}
