import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData(String deliverid) async {
    var response =
        await crud.postData(AppLink.viewaechiveOrders, {"id": deliverid});
    return response.fold((l) => l, (r) => r);
  }
}
