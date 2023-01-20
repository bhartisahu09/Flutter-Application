import 'package:get/get.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/product.dart';

class CartController extends GetxController {
  List<Product> selectedProducts = <Product>[].obs;
  void addProductToCart(Product product) {
    selectedProducts.add(product);
    Get.snackbar(
      'Product Added',
      'you have added the ${product.productName} to the cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
    update();
  }

  void removeProductsFromCart(Product product) {
    selectedProducts.remove(product);
    Get.snackbar(
      'Product removed',
      'you have removed the ${product.productName} to the cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
    update();
  }

  void increaseQuantityProduct(index) {
    selectedProducts[index].quantity++;
    selectedProducts[index].quantityPrice =
        selectedProducts[index].price * selectedProducts[index].quantity;
    update();
  }

  void decreaseQuantityProduct(index) {
    if (selectedProducts[index].quantity == 1) {
      removeProductsFromCart(selectedProducts[index]);
    } else {
      selectedProducts[index].quantity--;
      selectedProducts[index].quantityPrice =
          selectedProducts[index].price * selectedProducts[index].quantity;
    }
    update();
  }

  double get totalCost => selectedProducts.fold(
      0, (total, selectedProduct) => total + selectedProduct.quantityPrice);
}
