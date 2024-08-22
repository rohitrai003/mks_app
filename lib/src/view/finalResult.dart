import 'package:flutter/material.dart';
import 'package:mks_app/src/constant/icons.dart';

class FinalResult extends StatelessWidget {
  const FinalResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: Image.asset(logo),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "NOTIFICATION",
            style:
                TextStyle(fontSize: 20, decoration: TextDecoration.underline),
          ),
          const Text(
            "Dated : 01-04-2024",
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Text(
              "lorefljsdfj sdjfjsd lfdsjlfj dslfldsjfl jdslfj dsl jflsdj fljdslf jdsl flsdj flk dsj lfkjdslkfj lsdkjflkdsjflk jdsl kfjdskl fjdsl jfldsj lfjdslfj dskl jfl kdsj fldsjfljdsklfj sdklj flkdsjflk dsjlkf jdslfjdsklj flkdsjflksdj f kldsjlkf jsdklfjdskljfldsj flkdsjfkldjs klfjldsjf ldsjlfk dsj klfj",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w100),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Thank You all",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w100),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: const Column(
                      children: [],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: const Column(
                      children: [
                        Text("Rajen Rai",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w100)),
                        Text("( General Secretary MKS)",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w100))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
