class FavoriteDataBaseModel {
  int? id;
  String quotes;
  String author;
  int favorite;

  FavoriteDataBaseModel({
    required this.id,
    required this.quotes,
    required this.author,
    required this.favorite,
  });

  factory FavoriteDataBaseModel.fromMap({required Map data}) {
    return FavoriteDataBaseModel(
      id: data['id'],
      quotes: data['quote'],
      author: data['author'],
      favorite: data['favorite'],
    );
  }
}