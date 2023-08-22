
import 'package:get/get.dart';

import '../modals/get_qoute_controller.dart';
import '../modals/quote_database.dart';


class GetQuotesController extends GetxController {

  GetQuotesMethod getQuotesMethod = GetQuotesMethod(getAllQuotes: Future(() => []));

  getQuotesList({required Future<List<QuotesDatabaseModel>> allQuotes}) {
    getQuotesMethod.getAllQuotes = allQuotes;
    update();
  }
}
