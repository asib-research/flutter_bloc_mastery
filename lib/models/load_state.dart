class LoadState<T> {
  final bool loading;
  final T? data;
  final String? error;

  LoadState({this.loading = false, this.data, this.error});
}
