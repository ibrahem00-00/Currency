class HomeModel {
  String? id;
  String? name;
  String? symbol;
  String? imageUrl;
  dynamic price;
  double? priceChange;
  double? priceChangePercentage;
  int? marketCapRank;

  HomeModel(
      {this.id,
      this.name,
      this.imageUrl,
      this.price,
      this.symbol,
      this.priceChange,
      this.priceChangePercentage,
      this.marketCapRank});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'image': imageUrl,
      'current_price': price,
      'priceChange': priceChange,
      'price_change_percentage_24h': priceChangePercentage,
      'market_cap_rank': marketCapRank,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      id: map['id'] as String?,
      name: map['name'] as String?,
      symbol: map['symbol'] as String?,
      imageUrl: map['image'] as String?,
      price: map['current_price'] as dynamic,
      priceChange: map['priceChange'] as double?,
      priceChangePercentage: map['price_change_percentage_24h'] as double?,
      marketCapRank: map['market_cap_rank'] as int?,
    );
  }
}
