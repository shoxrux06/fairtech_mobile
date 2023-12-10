// To parse this JSON data, do
//
//     final productInfoResponse = productInfoResponseFromJson(jsonString);

import 'dart:convert';

ProductInfoResponse productInfoResponseFromJson(String str) => ProductInfoResponse.fromJson(json.decode(str));

class ProductInfoResponse {
  int status;
  String message;
  List<Datum> data;

  ProductInfoResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductInfoResponse.fromJson(Map<String, dynamic> json) => ProductInfoResponse(
    status: json["status"] ??0,
    message: json["message"] ??'',
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );
}

class Datum {
  String id;
  String regNumber;
  String process;
  String sendStir;
  String senderName;
  String receiverName;
  String? idn;
  String contractCurrency;
  double currencyDollr;
  double currentCurrency;
  String departureRecipientCountry;
  String contractCurrencyName;
  String departureRecipientCountryName;
  String entryExitDate;
  List<Good> goods;

  Datum({
    required this.id,
    required this.regNumber,
    required this.process,
    required this.sendStir,
    required this.senderName,
    required this.receiverName,
    required this.idn,
    required this.contractCurrency,
    required this.currencyDollr,
    required this.currentCurrency,
    required this.departureRecipientCountry,
    required this.contractCurrencyName,
    required this.departureRecipientCountryName,
    required this.entryExitDate,
    required this.goods,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ??'',
    regNumber: json["reg_number"] ?? '',
    process: json["process"],
    sendStir: json["send_stir"] ??'',
    senderName: json["sender_name"] ??'',
    receiverName: json["receiver_name"] ?? '',
    idn: json["idn"] ??'',
    contractCurrency: json["contract_currency"] ??'',
    currencyDollr: json["currency_dollr"]?.toDouble()??0.0,
    currentCurrency: json["current_currency"]?.toDouble() ??0.0,
    departureRecipientCountry: json["departure_recipient_country"] ??'',
    contractCurrencyName: json["contract_currencyName"],
    departureRecipientCountryName: json["departure_recipient_countryName"] ??'',
    entryExitDate: json["entry_exit_date"] ??'',
    goods: List<Good>.from(json["goods"].map((x) => Good.fromJson(x))),
  );
}

class Good {
  String numberCommodity;
  String tnCode;
  String productName;
  double weightNetto;
  double brutto;
  double statisticalValue;
  double invoiceValue;
  String madeInCountry;
  num characteristicProduct;
  num addedQuantity;
  double amountPayments20;
  num amountPayments27;
  double amountPayments29;
  double totalPayments;
  double amountBenefits20;
  num amountBenefits27;
  double amountBenefits29;
  double totalBenefits;
  String madeInCountryName;
  String addedUnitsMeasure;
  String addedUnitsMeasureName;
  List<DocumentLgot> documentLgot;

  Good({
    required this.numberCommodity,
    required this.tnCode,
    required this.productName,
    required this.weightNetto,
    required this.brutto,
    required this.statisticalValue,
    required this.invoiceValue,
    required this.madeInCountry,
    required this.characteristicProduct,
    required this.addedQuantity,
    required this.amountPayments20,
    required this.amountPayments27,
    required this.amountPayments29,
    required this.totalPayments,
    required this.amountBenefits20,
    required this.amountBenefits27,
    required this.amountBenefits29,
    required this.totalBenefits,
    required this.madeInCountryName,
    required this.addedUnitsMeasure,
    required this.addedUnitsMeasureName,
    required this.documentLgot,
  });

  factory Good.fromJson(Map<String, dynamic> json) => Good(
    numberCommodity: json["number_commodity"] ??'',
    tnCode: json["tn_code"] ??'',
    productName: json["product_name"] ??"",
    weightNetto: json["weight_netto"]?.toDouble() ??0.0,
    brutto: json["brutto"]?.toDouble() ??0.0,
    statisticalValue: json["statistical_value"]?.toDouble() ??0.0,
    invoiceValue: json["invoice_value"]?.toDouble() ??0.0,
    madeInCountry: json["made_in_country"] ??'',
    characteristicProduct: json["characteristic_product"],
    addedQuantity: json["added_quantity"],
    amountPayments20: json["amount_payments20"]?.toDouble()??0.0,
    amountPayments27: json["amount_payments27"],
    amountPayments29: json["amount_payments29"]?.toDouble()??0.0,
    totalPayments: json["total_payments"]?.toDouble()??0.0,
    amountBenefits20: json["amount_benefits20"]?.toDouble()??0.0,
    amountBenefits27: json["amount_benefits27"],
    amountBenefits29: json["amount_benefits29"]?.toDouble()??0.0,
    totalBenefits: json["total_benefits"]?.toDouble()??0.0,
    madeInCountryName: json["made_in_countryName"] ??'',
    addedUnitsMeasure: json["added_units_measure"] ??'',
    addedUnitsMeasureName:json["added_units_measureName"] ??'',
    documentLgot: List<DocumentLgot>.from(json["documentLgot"].map((x) => DocumentLgot.fromJson(x))),
  );

}

class DocumentLgot {
  String docdata;
  String? docno;
  String docname;

  DocumentLgot({
    required this.docdata,
    required this.docno,
    required this.docname,
  });

  factory DocumentLgot.fromJson(Map<String, dynamic> json) => DocumentLgot(
    docdata: json["docdata"],
    docno: json["docno"] ??'',
    docname: json["docname"],
  );
}

