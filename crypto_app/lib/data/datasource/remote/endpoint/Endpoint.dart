class Endpoint {
  static const String BASE = "https\://api.coinbase.com/v2/";
  static const String BASE_TEST = "https://a1ecc56c-be79-4379-87e0-07a5e68bb01a.mock.pstmn.io/";

  static const String CURRENCIES = BASE + "currencies/crypto";
  static const String EXCHANGE_RATE = BASE + "prices/{currency_pair}/spot";
}
