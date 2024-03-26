import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/comments_provider.dart';
class FetchComments extends StatelessWidget {
  const FetchComments({Key? key});

  @override
  Widget build(BuildContext context) {
    final commentsProvider = Provider.of<CommentsProvider>(context);
    print('Provider $commentsProvider');
    return FutureBuilder<void>(
      future: commentsProvider.fetchCommentsData(),
      builder: (context, snapshot) {
        print("Snapshot: $snapshot");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator(

          ));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.done) {
          print("Comments length: ${commentsProvider.comments?.length}");
         return ListView.builder(
            itemCount: commentsProvider.comments?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final comment = commentsProvider.comments![index];
              print('Response $comment');
              return ListTile(
                title: Text(comment['name'], style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                subtitle: Text(comment['body']),
              );
            },
          );

        } else {
          return Text("Connection state: ${snapshot.connectionState}");
        }
      },
    );
  }
}
