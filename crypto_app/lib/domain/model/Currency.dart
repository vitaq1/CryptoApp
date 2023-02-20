class Currency {
  Currency({
    this.code,
    this.name,
    this.color,
    this.sortIndex,
    this.exponent,
    this.type,
    this.addressRegex,
    this.assetId,
  });

  String? code;
  String? name;
  String? color;
  int? sortIndex;
  int? exponent;
  String? type;
  String? addressRegex;
  String? assetId;
}
