enum RegisterMarshopRule { isJA, isRefIdMarshop }

extension RegisterMarshopRuleExt on RegisterMarshopRule {
  String getText() {
    switch (this) {
      case RegisterMarshopRule.isRefIdMarshop:
        return "Đã là JA";
      case RegisterMarshopRule.isJA:
        return "ID MarShop giới thiệu";
    }
  }
}
