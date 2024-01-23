import 'dart:math';
import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';

List<String> categories = [
  'Espresso',
  'Latte',
  'Cappuccino',
  'Americano',
  'Macchiato'
];

List<String> sizes = ['S', 'M', 'L'];

List<String> images = [
  'https://img.freepik.com/free-photo/beautiful-fresh-relax-morning-coffee-cup-set_1150-7052.jpg?w=1380&t=st=1706026811~exp=1706027411~hmac=61e8ee1a64c9b0d886e6e2f0fc0c18a5710c81d004563da0228d406925a32dc4',
  'https://img.freepik.com/free-photo/front-view-cup-cappuccino-with-cookies-book-table_141793-2825.jpg?w=740&t=st=1706026841~exp=1706027441~hmac=a700a35d6ee6ac466c6ae18347290025efd0b39ca485fbf808625d112b62f6fc',
  'https://img.freepik.com/free-photo/barista-cafe-breakfast-hand-training_1286-291.jpg?w=740&t=st=1706026839~exp=1706027439~hmac=a61d965eb6f7e00a975fe9b13da03a0f56fcea17271c1c56ff1cc660aaf1707b',
];

List<Product> generateDummyProducts() {
  Random random = Random();

  List<Product> dummyProducts = [];

  for (int i = 0; i < 50; i++) {
    String productId = 'product_$i';
    String category = categories[random.nextInt(categories.length)];
    String size = sizes[random.nextInt(sizes.length)];
    double price =
        (random.nextDouble() * 10) + 3; // Random price between $3 and $13
    String title = 'Coffee $i';
    String subtitle = 'Subtitle $i';
    String description = 'This is a description for Coffee $i.';
    String image = images[random.nextInt(images.length)];
    double rating = (random.nextDouble() * 5); // Random rating between 0 and 5

    dummyProducts.add(Product(
      id: productId,
      category: category,
      size: size,
      price: price,
      title: title,
      subtitle: subtitle,
      description: description,
      images: image,
      rating: rating,
    ));
  }

  return dummyProducts;
}
