extension ListLimit<T> on List<T> {
  List<T> limit(int limit) {
    if (length > limit) {
      return sublist(length - limit);
    } else {
      return this;
    }
  }
}
