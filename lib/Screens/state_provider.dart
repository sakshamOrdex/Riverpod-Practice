import 'package:flutter/material.dart';
// import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'package:riverpod_try/Screens/state_notifier.dart';

//State Provider that can actually change the state and re-build the widget tree.
final counter = StateProvider<int>((ref) {
  return 0;
});

class StateProviders extends ConsumerWidget {
  const StateProviders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // Consumer(
            //   builder: (ctx, ref, child) {
            //     final count = ref.watch(counter);
            //     return Text(count.toString());
            //   },
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     ref.read(counter.notifier).state++;
            //   },
            //   child: Icon(Icons.add),
            // ),
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                onChanged: (value) {
                  ref.read(searchProvider.notifier).search(value);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(search, style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
      ),
    );
  }
}

// class StateProviders extends ConsumerStatefulWidget {
//   const StateProviders({super.key});

//   @override
//   ConsumerState<StateProviders> createState() => _StateProvidersState();
// }

// class _StateProvidersState extends ConsumerState<StateProviders> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           children: [
//             Consumer(
//               builder: (_, ref, _) {
//                 final count = ref.watch(counter);
//                 return Text(count.toString());
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(counter.notifier).state++;
//               },
//               child: Icon(Icons.add),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
