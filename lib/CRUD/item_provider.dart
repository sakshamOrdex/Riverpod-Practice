import 'package:riverpod/legacy.dart';
import 'package:riverpod_try/CRUD/item.dart';

final itemProvider=StateNotifierProvider<ItemNotifier,List<Item>>((ref){
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>>{
  ItemNotifier():super([]);

  void addItem(String name){
    final item = Item(id: DateTime.now().toString(), name: name);
    state.add(item);
    state=state.toList();
  }

  void deleteItem(String id){
    state.removeWhere((item)=>item.id==id);
    state=state.toList();
  }

  void updateItem(String id,String name){
    int found=state.indexWhere((item)=>item.id==id);
    state[found].name=name;
    state=state.toList();
  }
}