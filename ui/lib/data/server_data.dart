class ServerData {
  final String baseUrl;
  final int port;

  const ServerData({required this.baseUrl, required this.port});

  factory ServerData.defaultLocalhost() =>
      const ServerData(baseUrl: 'localhost', port: 8000);

  List<ServerData> get listDefaultOptions => [ServerData.defaultLocalhost()];
}
