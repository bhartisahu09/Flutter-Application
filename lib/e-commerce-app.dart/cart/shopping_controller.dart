import 'package:get/get.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/product.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/product_service.dart';

class ShoppingController extends GetxController {
List<Product> products = <Product>[].obs;
@override
void onInit() {
super.onInit();
getProductDetails();
}
void getProductDetails() async {
products.assignAll(ProductService().getProducts().toList());
}
}