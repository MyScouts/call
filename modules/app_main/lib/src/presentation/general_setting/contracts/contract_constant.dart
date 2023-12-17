enum TypeContract {
  bossGroup,
}

extension TypeContractExt on TypeContract {
  int getValue() {
    switch (this) {
      case TypeContract.bossGroup:
        return 0;
      default:
        return 0;
    }
  }
}
