class Failure<T> {
  final String message;
  final T? error;

  Failure({
    this.message = "Something went wrong",
    this.error,
  });
}
