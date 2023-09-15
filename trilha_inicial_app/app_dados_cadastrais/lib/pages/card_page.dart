import 'package:flutter/material.dart';
import 'package:primeiro_app/model/card_detail.dart';
import 'package:primeiro_app/pages/card_detail.dart';

class CArdPage extends StatefulWidget {
  const CArdPage({super.key});

  @override
  State<CArdPage> createState() => _CArdPageState();
}

class _CArdPageState extends State<CArdPage> {
  var cardDetail = CardDetail(1, "Lorem Ipsum", "assets/image/logo_dio.png",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          width: double.infinity,
          child: Hero(
            tag: cardDetail.id,
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          cardDetail.assets,
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            cardDetail.title,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      cardDetail.text,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CardDetailPage(
                                    cardDetail: cardDetail,
                                  ),
                                ));
                          },
                          child: const Text(
                            "Ler mais",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          )))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
