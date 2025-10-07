import 'package:riverpod_try/Favourite/item.dart';

class FavouriteState {
  final List<Item> allItems;
  final List<Item> filteredItems;
  final String search;
  FavouriteState({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  FavouriteState copyWith({
    List<Item>? allItems,
    List<Item>? filteredItems,
    String? search,
  }) {
    return FavouriteState(
      search: search ?? this.search,
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
    );
  }
}
