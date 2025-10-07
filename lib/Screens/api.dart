import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_try/Screens/api_post_provider.dart';

class API extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue.shade200,
      ),
      body: Center(
        child: postList.when(
          skipLoadingOnRefresh: false,
          data: (post) => ListView.builder(
            itemCount: post.length,
            itemBuilder: (context, index) {
              final item = post[index];
              return Card(
                child: ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.body),
                ),
              );
            },
          ),
          error: (error, stack) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(postProvider);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

// class PostModel{
//   final int id;
//   final int userId;
//   final String title;
//   final String body;

//   PostModel({required this.id,required this.userId,required this.title,required this.body});

//   factory PostModel.fromJson(Map<String,dynamic> json){
//     return PostModel(
//     id: json['id'], 
//     userId: json['userId'], 
//     title: json['title'], 
//     body: json['body']
//     );
//   }
// }