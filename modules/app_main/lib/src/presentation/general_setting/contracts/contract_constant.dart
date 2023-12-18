enum TypeContract { bossGroup, purchasePack, rentPack }

extension TypeContractExt on TypeContract {
  int getValue() {
    switch (this) {
      case TypeContract.bossGroup:
        return 0;
      case TypeContract.purchasePack:
        return 1;
      case TypeContract.rentPack:
        return 2;
      default:
        return 0;
    }
  }
}
