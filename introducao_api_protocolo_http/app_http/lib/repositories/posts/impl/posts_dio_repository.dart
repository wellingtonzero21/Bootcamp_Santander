import 'package:primeiro_app/model/post_model.dart';
import 'package:primeiro_app/repositories/jsonplaceholder_custom_dio.dart';
import 'package:primeiro_app/repositories/posts/impl/posts_repository.dart';

class PostsDioRepository implements PostsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var jasonPlaceHolderCustonDio = JasonPlaceHolderCustonDio();
    var response = await jasonPlaceHolderCustonDio.dio.get("/posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
  
}