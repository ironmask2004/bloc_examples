class TimeTicker {
  const TimeTicker();
  Stream<int> tick() {
    return Stream.periodic(const Duration(milliseconds: 1500), (x) => x);
  }
}
