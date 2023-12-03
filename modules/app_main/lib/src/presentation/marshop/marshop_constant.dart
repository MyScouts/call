enum RegisterMarshopRule { isJA, isRefIdMarshop }

extension RegisterMarshopRuleExt on RegisterMarshopRule {
  String getText() {
    switch (this) {
      case RegisterMarshopRule.isJA:
        return "Đã là JA";
      case RegisterMarshopRule.isRefIdMarshop:
        return "ID MarShop giới thiệu";
    }
  }
}
