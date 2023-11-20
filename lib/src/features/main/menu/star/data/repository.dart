import 'package:fairtech_mobile/src/features/main/menu/profile/data/local_data.dart';
import 'package:fairtech_mobile/src/features/pdf/data/models/order_item.dart';


class StarRepository {
  Future<List<OrderItem>?> getData() async{
    try {
      final data = LocalData.orderItems;
      return data;
    } catch (e) {
     print('error');
     return null;
    }
  }
}