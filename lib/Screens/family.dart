import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';

final familyProvider = StateProvider.family<int, int>((ref, nums) {
  return nums * 2;
});

class Family extends ConsumerWidget {
  const Family({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(familyProvider(10));
    return Scaffold(
      appBar: AppBar(title: Text("Family Class"), centerTitle: true),
      body: Center(child: Text(provider.toString())),
    );
  }
}
