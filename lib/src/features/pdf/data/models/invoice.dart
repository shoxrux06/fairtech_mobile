import 'package:fairtech_mobile/src/features/pdf/data/models/order_item.dart';

class Invoice {
  final int id;
  final List<OrderItem> orderItems;
  final DateTime dateTime;

  Invoice({
    required this.id,
    required this.orderItems,
    required this.dateTime,
  });

}
