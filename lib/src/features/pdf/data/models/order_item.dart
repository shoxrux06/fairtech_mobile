class OrderItem {
  final int id;
  final String hududlar;
  final int jamiTrade;
  final int etenderTrade;
  final int tenderMcTrade;
  final int xtXaridTrade;
  final int topshiriqAsosidaTrade;
  final int organishFoizi;
  final int kamchilikAniqlanganTrades;
  final int organilganXaridlargaNisbatanFoiz;
  final int organilmayQolganTrades;
  final int jamiOrganilganTradeNumbers;
  final int kpiTizimBoyichaToplanganJamiBallar;
  final int topshiriqAsosidaBerilganBall;
  final int xaridlarniOrganishHajmigaNisbatanBerilganBall;
  final int xaridlarniOrganishNatijasidaKamchiliklarAniqlanganlikUchunBerilganBall;

  OrderItem({
    required this.id,
    required this.hududlar,
    required this.jamiTrade,
    required this.etenderTrade,
    required this.tenderMcTrade,
    required this.xtXaridTrade,
    required this.topshiriqAsosidaTrade,
    required this.organishFoizi,
    required this.kamchilikAniqlanganTrades,
    required this.organilganXaridlargaNisbatanFoiz,
    required this.organilmayQolganTrades,
    required this.jamiOrganilganTradeNumbers,
    required this.kpiTizimBoyichaToplanganJamiBallar,
    required this.topshiriqAsosidaBerilganBall,
    required this.xaridlarniOrganishHajmigaNisbatanBerilganBall,
    required this.xaridlarniOrganishNatijasidaKamchiliklarAniqlanganlikUchunBerilganBall,
  });
//
// factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
//       id: json["id"],
//     );
}
