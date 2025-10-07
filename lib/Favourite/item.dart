class Item {
  final String name;
  final int id;
  final bool fvrt;
  Item({required this.name, required this.id, required this.fvrt});

  Item copyWith({String? name, int? id, bool? fvrt}) {
    return Item(
      name: name ?? this.name,
      id: id ?? this.id,
      fvrt: fvrt ?? this.fvrt,
    );
  }
}
