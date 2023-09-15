import 'package:flutter/material.dart';
import 'package:primeiro_app/model/card_detail.dart';
import 'package:primeiro_app/pages/home_page.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                        }, icon: Icon(Icons.close)),
                    Row(
                        children: [
                          Image.asset(
                            cardDetail.assets,
                            height: 100,
                          ),
                        ],
                      ),
                    Text(
                            cardDetail.title,
                            style:TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700,),
                          ),
                    Expanded(
                      child: Text(
                        cardDetail.text,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ]),
                ),
        ),
      ),
    );
  }
}