extension IterableExtension<E> on Iterable {
  /// Iterable index 不存才就会报错
  E elementAtOfNull(int index) {
    if (this.length > index) {
      return this.elementAt(index);
    } else {
      return null;
    }
  }

  /// 不为空
  bool get isNotEmptyOfNull {
    return !this.isEmptyOfNull;
  }

  /// 为空
  bool get isEmptyOfNull {
    return this == null || this.isEmpty;
  }
}

