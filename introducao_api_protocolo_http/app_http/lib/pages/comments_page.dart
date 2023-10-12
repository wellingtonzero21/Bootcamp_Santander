import 'package:flutter/material.dart';
import 'package:primeiro_app/model/comment_model.dart';
import 'package:primeiro_app/repositories/comments_http_repository.dart';

class CommentsPage extends StatefulWidget {
  final int postId;
  const CommentsPage({super.key, required this.postId});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  var commentsRepository = CommentsHttpRepository();
  var comments = <CommentModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    comments = await commentsRepository.retornaComentarios(widget.postId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Comentários do Post: ${widget.postId}"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: comments.length == 0 ? const Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, int index) {
            var comment = comments[index];
            return Card(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(comment.name.substring(0, 5)),
                        Text(comment.email),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(comment.body),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
