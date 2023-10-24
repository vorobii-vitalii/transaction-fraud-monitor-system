class Address {
  final String baseUrl;
  final int port;

  const Address({required this.baseUrl, required this.port});

  factory Address.defaultLocalhost() =>
      const Address(baseUrl: 'localhost', port: 8000);

  List<Address> get listDefaultOptions => [Address.defaultLocalhost()];
}
