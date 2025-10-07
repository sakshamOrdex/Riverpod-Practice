import 'package:flutter/material.dart';
// import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// simple provider does not change the state it only sets the state.
final hello = Provider<String>((ref) {
  return "Hello";
});

final age = Provider<int>((ref) {
  return 21;
});

//STATELESS WIDGET
class SimpleProvider extends ConsumerWidget {
  const SimpleProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final one = ref.read(hello);
    final two = ref.watch(age);

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Provider"),
      ),
      body: Center(
        child: Text("$one $two", style: TextStyle(fontSize: 25)),
      ),
    );
  }
}

//  STATEFUL WIDGET
// class SimpleProvider extends ConsumerStatefulWidget {
//   const SimpleProvider({super.key});
//   @override
//   ConsumerState<SimpleProvider> createState() => _SimpleProviderState();
// }

// class _SimpleProviderState extends ConsumerState<SimpleProvider> {
//   @override
//   Widget build(BuildContext context) {
//     final one = ref.read(hello);
//     final two = ref.read(age);

//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text(one + " " + two.toString(), style: TextStyle(fontSize: 25)),
//       ),
//     );
//   }
// }
