import 'package:primeiro_app/model/comment_model.dart';
import 'package:primeiro_app/repositories/comments/comments_repository.dart';
import 'package:primeiro_app/repositories/jsonplaceholder_custom_dio.dart';

class CommentsDioRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jasonPlaceHolderCustonDio = JasonPlaceHolderCustonDio();
    var response = await jasonPlaceHolderCustonDio.dio.get("/posts/$postId/comments");
    return (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
  }
  
}