import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/modules/post/controllers/post_controller.dart';
import 'package:smart_parking_mvp_graphql/app/modules/post/views/post_details_view.dart';
import 'package:smart_parking_mvp_graphql/app/shared/widgets/loading_widget.dart';

class PostListView extends GetView<PostController> {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingWidget()
            : ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  final post = controller.posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.content),
                    onTap: () => Get.to(() => PostDetailsView(post: post)),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialog to create post
          _showCreatePostDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreatePostDialog(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    Get.defaultDialog(
      title: 'Create Post',
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: contentController,
            decoration: const InputDecoration(hintText: 'Content'),
          ),
        ],
      ),
      onConfirm: () {
        controller.createPost(titleController.text, contentController.text);
      },
    );
  }
}
