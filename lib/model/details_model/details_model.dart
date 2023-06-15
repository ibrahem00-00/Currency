class DetailsModel {
  final String? id;
  final String? name;
  final String? symbol;
  final String? description;
  final String? image;
  final int? marketCapRank;
  final double? percentChange_7d;
  final double? percentChange_24h;
  final double? percentChange_14;
  final double? percentChange_30;
  final double? percentChange_60;
  final double? percentChange_200;
  final double? percentChange_1y;
  final dynamic currentPrice;

  DetailsModel(
      {this.id,
      this.name,
      this.symbol,
      this.description,
      this.image,
      this.marketCapRank,
      this.currentPrice,
      this.percentChange_24h,
      this.percentChange_7d,
      this.percentChange_14,
      this.percentChange_30,
      this.percentChange_60,
      this.percentChange_200,
      this.percentChange_1y});

  // factory DetailsModel.fromJson(Map<String,dynamic> json){
  //   return DetailsModel(
  //       id: json["id"],
  //       name: json["name"],
  //       symbol: json["symbol"],
  //       description: json["description"]["en"],
  //       image: json["image"]["large"],
  //       market_cap_rank: json["market_cap_rank"],
  //       currentPrice: json["market_data"]["current_price"]['usd'],
  //       percentChange_24h: json["market_data"]["price_change_percentage_24h"],
  //       percentChange_7d: json["market_data"]["price_change_percentage_7d"],
  //       percentChange_14: json["market_data"]["price_change_percentage_14d"],
  //       percentChange_30: json["market_data"]["price_change_percentage_30d"],
  //       percentChange_60: json["market_data"]["price_change_percentage_60d"],
  //       percentChange_200: json["market_data"]["price_change_percentage_200d"],
  //       percentChange_1y: json["market_data"]["price_change_percentage_1y"]);
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'description': description,
      'image': image,
      'market_cap_rank': marketCapRank,
      'percentChange_24h': percentChange_24h,
      'percentChange_7d': percentChange_7d,
      'percentChange_14': percentChange_14,
      'percentChange_30': percentChange_30,
      'percentChange_60': percentChange_60,
      'percentChange_200': percentChange_200,
      'percentChange_1y': percentChange_1y,
      'currentPrice': currentPrice,
    };
  }

  factory DetailsModel.fromMap(Map<String, dynamic> map) {
    return DetailsModel(
      id: map['id'],
      name: map['name'],
      symbol: map['symbol'],
      description: map['description']['en'],
      image: map['image']['large'],
      marketCapRank: map['market_cap_rank'],
      percentChange_24h: map['market_data']['price_change_percentage_24h'],
      percentChange_7d: map['market_data']['price_change_percentage_7d'],
      percentChange_14: map['market_data']['price_change_percentage_14d'],
      percentChange_30: map['market_data']['price_change_percentage_30d'],
      percentChange_60: map['market_data']['price_change_percentage_60d'],
      percentChange_200: map['market_data']['price_change_percentage_200d'],
      percentChange_1y: map['market_data']['price_change_percentage_1y'],
      currentPrice: map['market_data']['current_price']['usd'],
    );
  }
}
