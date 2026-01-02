import 'package:flutter/material.dart';
import 'package:smart_parking_mvp_graphql/app/data/models/post_model.dart';

class PostDetailsView extends StatelessWidget {
  final PostModel post;
  const PostDetailsView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            Text(post.content),
          ],
        ),
      ),
    );
  }
}
