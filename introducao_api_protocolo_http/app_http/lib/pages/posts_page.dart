import 'package:flutter/material.dart';
import 'package:primeiro_app/model/post_model.dart';
import 'package:primeiro_app/pages/comments_page.dart';
import 'package:primeiro_app/repositories/posts_repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  var postsRepository = PostsRepository();
  var posts = <PostModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    posts = await postsRepository.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            var post = posts[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => CommentsPage(postId: post.id)));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Card(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            post.body,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w200),
                          ),
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
