import 'package:flutter/material.dart';

class ImageAssetsPage extends StatelessWidget {
  const ImageAssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Image.asset(
              "assets/image/user1.png",
              height: 50,
            ),
            Image.asset(
              "assets/image/user2.png",
              height: 50,
            ),
            Image.asset(
              "assets/image/user3.png",
              height: 50,
            ),
            Image.asset(
              "assets/image/paisagem1.jpg",
              height: 50,
            ),
            Image.asset(
              "assets/image/paisagem2.jpg",
              width: double.infinity,
            ),
            Image.asset(
              "assets/image/paisagem3.jpg",
              height: 50,
            ),
          ],
        ),
      ],
    );
  }
}
