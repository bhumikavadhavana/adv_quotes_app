class QuotesDatabaseModel {
  int? id;
  String quotes;
  String author;
  int? favorite;

  QuotesDatabaseModel({
    required this.id,
    required this.quotes,
    required this.author,
    required this.favorite,
  });

  factory QuotesDatabaseModel.formMap({required Map data}) {
    return QuotesDatabaseModel(
      id: data['id'],
      quotes: data['quote'],
      author: data['author'],
      favorite: data['favorite'],
    );
  }
}
