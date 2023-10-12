import 'package:primeiro_app/model/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts();
}