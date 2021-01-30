import 'dart:math';

extension IntExtension<E> on int {
  ///随机数生成类
  int get random {
    var rng = Random();
    return rng.nextInt(this);
  }
}
