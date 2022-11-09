class RemotePackage {
  final String url;
  final Map<String, dynamic> headers;
  final Map<String, dynamic> queries;
  final Map<String, dynamic> urlParams;
  final Map<String, dynamic> data;

  /// default constructor
  const RemotePackage._({
    this.url = '',
    this.headers = const {},
    this.queries = const {},
    this.urlParams = const {},
    this.data = const {},
  });

  factory RemotePackage.get(
    String url, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> queries = const {},
    Map<String, dynamic> addressParams = const {},
  }) =>
      RemotePackage._(
        url: url,
        headers: headers,
        queries: queries,
        urlParams: addressParams,
      );

  factory RemotePackage.post(
    String url, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> queries = const {},
    Map<String, dynamic> addressParams = const {},
    Map<String, dynamic> data = const {},
  }) =>
      RemotePackage._(
        url: url,
        headers: headers,
        queries: queries,
        urlParams: addressParams,
        data: data,
      );
}
