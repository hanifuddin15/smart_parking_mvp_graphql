import 'package:get/get.dart';
import 'package:smart_parking_mvp_graphql/app/data/models/post_model.dart';
import 'package:smart_parking_mvp_graphql/app/data/repositories/post_repository.dart';

class PostController extends GetxController {
  final PostRepository _repository;
  PostController(this._repository);

  final RxList<PostModel> posts = <PostModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      final result = await _repository.getPosts();
      posts.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createPost(String title, String content) async {
    isLoading.value = true;
    try {
      final newPost = await _repository.createPost(title, content);
      posts.add(newPost);
      Get.back();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
