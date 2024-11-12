import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [
    Product('a', 45000),
    Product('b', 30000),
    Product('c', 35000),
    Product('d', 38000),
    Product('e', 5000)
  ];

  List<String> cartItems = []; // 장바구니에 담긴 상품 이름
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

        // 추가된 코드 시작
        for (var i = 0; i < count; i++) {
          cartItems.add(product.name); // 상품 이름을 장바구니에 추가
        } //추가된 코드 종료

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
    if (cartItems.isEmpty) {
      print('장바구니에 담긴 상품이 없습니다.');
    } else {
      String items = cartItems.join(', ');
      print('장바구니에 $items 담겨있네요. 총 $total원 입니다!');
      print('장바구니를 초기화 하려면 6을 입력해주세요');
    }
  }

  //if (total > 0) {
  //print('장바구니를 초기화 하려면 6을 입력해주세요');

  void clearCart() {
    if (total == 0) {
      print('이미 장바구니가 비었습니다.');
    } else {
      total = 0;
      print('장바구니가 초기화되었습니다.');
    }
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
        print('정말 종료하시겠습니까? (5를 입력하면 종료됩니다)');
        String? confirmInput = stdin.readLineSync();
        if (confirmInput == '5') {
          print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
          isTerminated = true;
        } else {
          print('종료하지 않습니다.');
        }
      case '6': //'6'입력시 장바구니 초기화
        shoppingMall.clearCart();
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
