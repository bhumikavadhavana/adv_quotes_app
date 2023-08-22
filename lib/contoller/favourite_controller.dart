import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FavoriteController extends GetxController {
  RxList<String> favoriteQuotes = <String>[].obs;

  void toggleFavorite(String quote) {
    if (favoriteQuotes.contains(quote)) {
      favoriteQuotes.remove(quote);
    } else {
      favoriteQuotes.add(quote);
    }
  }

  bool isFavorite(String quote) {
    return favoriteQuotes.contains(quote);
  }
}