class SearchModel {
  static List<Coins> coins = [];

  SearchModel.fromMap(Map<String, dynamic> json) {

    json['coins'].forEach((element) {
      Coins item = Coins.fromJson(json: element);
      coins.add(item);
    });


  }

}

class Coins {
  String? id;
  String? name;
  String? symbol;
  String? imageUrl;
  dynamic rank;

  Coins.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    imageUrl = json['large'];
    rank = json['market_cap_rank'];
  }
}
