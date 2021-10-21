class TimeTicker {
  const TimeTicker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(milliseconds: 500), (x) => x)
        .take(ticks);
  }
}
