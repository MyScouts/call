enum TypeContract { bossGroup, purchasePack, rentPack, jA }

extension TypeContractExt on TypeContract {
  int getValue() {
    switch (this) {
      case TypeContract.bossGroup:
        return 0;
      case TypeContract.purchasePack:
        return 1;
      case TypeContract.rentPack:
        return 2;
      case TypeContract.jA:
        return 3;
      default:
        return 0;
    }
  }
}
