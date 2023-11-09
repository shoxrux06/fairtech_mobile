class ProductEntity {
  final String productName;
  final double netto;
  final double brutto;
  final String unitOfMeasure;
  final String madeInCountry;

  ProductEntity({
    required this.productName,
    required this.netto,
    required this.brutto,
    required this.unitOfMeasure,
    required this.madeInCountry,
  });
}
