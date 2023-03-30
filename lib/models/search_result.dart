class SearchResult {
  final bool cancel;
  final bool? manual;

  SearchResult({required this.cancel, this.manual = false});

  //TODO:
  //name, desciption, latlon

  @override
  String toString() {
    return 'Cancel:$cancel, Manual:$manual';
  }
}
