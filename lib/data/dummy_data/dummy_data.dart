import 'dart:math';
import 'package:coffee_shop_app_coding_challenge/data/model/product_model.dart';

List<String> categories = [
  'Espresso',
  'Latte',
  'Cappuccino',
  'Americano',
  'Macchiato'
];

List<String> produtSizes = ['S', 'M', 'L'];

List<String> images = [
  'https://img.freepik.com/premium-photo/cup-coffee-coffee-time_41050-2990.jpg?w=740',
  'https://img.freepik.com/free-vector/3d-realistic-cup-coffee-beans_1441-2083.jpg?w=740&t=st=1706113809~exp=1706114409~hmac=27ae129d0f8e31030ffcd6e0a23311b1925d48b84ba7b418667d93ee2294fed9',
  'https://img.freepik.com/premium-photo/south-indian-filter-coffee-served-traditional-tumbler-cup-roasted-raw-beans_466689-88200.jpg?w=740',
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
    String size = produtSizes[random.nextInt(produtSizes.length)];
    double price = (random.nextDouble() * 10) + 3;
    String title = 'Coffee $i';
    String subtitle = 'Subtitle $i';
    String description =
        'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the for This is a description for Coffee $i A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the for This is a description for Coffee $i';
    String image = images[random.nextInt(images.length)];
    double rating = (random.nextDouble().toDouble() * 5);
    int ratingPerson = random.nextInt(500);

    dummyProducts.add(
      Product(
        id: productId,
        category: category,
        size: size,
        price: price,
        title: title,
        subtitle: subtitle,
        description: description,
        images: image,
        rating: rating,
        ratingPerson: ratingPerson,
        isFavorite: false,
      ),
    );
  }

  return dummyProducts;
}
