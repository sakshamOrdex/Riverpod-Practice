import 'package:riverpod/legacy.dart';
import 'package:riverpod_try/Favourite/fvrt_service.dart';
import 'package:riverpod_try/Favourite/item.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filteredItems: [], search: ' '));

  void addItem() {
    List<Item> item = [
      Item(name: "Macbook", id: 1, fvrt: true),
      Item(name: "iPhone", id: 2, fvrt: true),
      Item(name: "iPad", id: 3, fvrt: false),
      Item(name: "Apple Watch", id: 4, fvrt: false),
      Item(name: "AirPods", id: 5, fvrt: true),
      Item(name: "Dell XPS", id: 6, fvrt: false),
      Item(name: "Samsung Galaxy", id: 7, fvrt: true),
      Item(name: "Google Pixel", id: 8, fvrt: false),
      Item(name: "Sony Headphones", id: 9, fvrt: true),
      Item(name: "Lenovo ThinkPad", id: 10, fvrt: false),
    ];
    state = state.copyWith(
      allItems: item.toList(),
      filteredItems: item.toList(),
    );
  }

  void filterList(String search) {
    state = state.copyWith(filteredItems: _filterItems(state.allItems, search));
  }

  void favourite(String option) {
    state = state.copyWith(
      filteredItems: _favouriteItems(state.allItems, option),
    );
  }

  List<Item> _filterItems(List<Item> items, String search) {
    if (search.isEmpty) {
      return items;
    }

    return items
        .where(
          (items) => items.name.toLowerCase().contains(search.toLowerCase()),
        )
        .toList();
  }

  List<Item> _favouriteItems(List<Item> items, String option) {
    if (option == "All") {
      return items;
    }

    return items.where((items) => items.fvrt == true).toList();
  }
}
