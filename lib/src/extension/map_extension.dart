extension MapExtension<E> on Map {
  /// 不为空
  bool get isNotEmptyOfNull {
    return !this.isEmptyOfNull;
  }

  /// 为空
  bool get isEmptyOfNull {
    return (this == null) || this.isEmpty;
  }
}
