

import 'package:dbminer_quotes_app/modals/quote_database.dart';

class GetQuotesMethod {
  Future<List<QuotesDatabaseModel>> getAllQuotes;

  GetQuotesMethod({
    required this.getAllQuotes,
  });
}
