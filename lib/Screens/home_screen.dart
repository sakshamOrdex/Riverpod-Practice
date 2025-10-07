import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_try/Screens/future_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Future Provider")),
      // body: Center(
      //   child: provider.when(
      //   data: (value) => Text(value.toString()), // when it become successful
      //   error: (error,stack)=>Text(error.toString()), // if there is any error occur
      //   loading: ()=>CircularProgressIndicator() //used for loading time -> waiting time in duration
      // ),
      // ),
      body: Center(
        child: provider.when(
          skipLoadingOnRefresh: false, //used to rebuild state with loading state
          data: (value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(value[index]));
            },
          ),
          error: (error, stack) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(
            futureProvider,
          ); // used to refresh or rebuild the state in case of error arise
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
