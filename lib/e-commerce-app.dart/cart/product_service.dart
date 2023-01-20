import 'package:new_flutter_application/e-commerce-app.dart/cart/product.dart';
class ProductService {
List<Product> getProducts() {
List<Product> products = [
Product(
productId: 101,
productName: 'To Kill a Mockingbird',
price: 595,
quantity: 1,
quantityPrice: 595,
imageUrl:
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1339392178l/37449.jpg',
),
Product(
productId: 102,
productName: 'The Catcher in the Rye',
price: 385,
quantity: 1,
quantityPrice: 385,
imageUrl:
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz3hnGm3hi-6B6c7kaIpkr667k4-nHhiG5nQ&usqp=CAU',
),
Product(
productId: 103,
productName: 'The Great Gatsby',
price: 299,
quantity: 1,
quantityPrice: 299,
imageUrl:
'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/The_Great_Gatsby_cover_1925_%281%29.jpg/800px-The_Great_Gatsby_cover_1925_%281%29.jpg',
),
Product(
productId: 104,
productName: 'The Kite Runner',
price: 899,
quantity: 1,
quantityPrice: 899,
imageUrl:
'https://m.media-amazon.com/images/I/51gm9Jrp2CL._SL500_.jpg',
),
Product(
productId: 105,
productName: 'The Book Thief',
price: 385,
quantity: 1,
quantityPrice: 385,
imageUrl:
'https://images-na.ssl-images-amazon.com/images/I/41nQuO7uH+S._SX312_BO1,204,203,200_.jpg',
),
Product(
productId: 106,
productName: 'Lord of the Flies',
quantity: 1,
quantityPrice: 685,
price: 685,
imageUrl:
'https://images-na.ssl-images-amazon.com/images/I/81WUAoL-wFL.jpg',
),
Product(
productId: 107,
productName: 'The Lion, the Witch and the Wardrobe',
price: 599,
quantity: 1,
quantityPrice: 599,
imageUrl:
'https://images-na.ssl-images-amazon.com/images/I/614469ES26L._SX340_BO1,204,203,200_.jpg',
),
Product(
productId: 108,
productName: 'The Color Purple',
price: 499,
quantity: 1,
quantityPrice: 499,
imageUrl:
'https://rukminim2.flixcart.com/image/416/416/kerfl3k0/regionalbooks/s/d/8/the-color-purple-original-imafvdek5zwj7qye.jpeg?q=70',
)
];
return products;
}
}