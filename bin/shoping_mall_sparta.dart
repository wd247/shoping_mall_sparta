import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000)
  ];
  int total = 0;

  void showProducts() {
    for (final product in products) {
      print('${product.name} / ${product.price}원');
    }
  }

  void addToCart() {
    print('상품 이름을 입력해 주세요 !');
    String? name = stdin.readLineSync();
    print('상품 개수를 입력해 주세요 !');
    String inputCount = stdin.readLineSync() ?? "";
    try {
      Product product = products.firstWhere((product) => product.name == name);
      int count = int.parse(inputCount);
      if (count > 0) {
        total += (product.price * count);
        print('장바구니에 상품이 담겼어요 !');
      } else {
        print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
      }
    } catch (error) {
      print('입력값이 올바르지 않아요 !');
    }
  }

  void showTotal() {
    print('장바구니에 $total원 어치를 담으셨네요 !');
  }
}

void main() {
  ShoppingMall shoppingMall = ShoppingMall();
  bool isTerminated = false;
  while (!isTerminated) {
    print(
        '--------------------------------------------------------------------------------------------------------');
    print(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    print(
        '--------------------------------------------------------------------------------------------------------');
    String? input = stdin.readLineSync();
    switch (input) {
      case '1':
        shoppingMall.showProducts();
      case '2':
        shoppingMall.addToCart();
      case '3':
        shoppingMall.showTotal();
      case '4':
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
        isTerminated = true;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
