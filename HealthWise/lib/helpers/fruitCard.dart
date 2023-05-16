import 'package:Healthwise/helpers/backEnd.dart';
import 'package:Healthwise/helpers/frontEnd.dart';
import 'package:flutter/material.dart';
import 'package:Healthwise/helpers/constants.dart';

class FruitCard extends StatelessWidget {
  const FruitCard({
    super.key,
    required this.cardDataList,
  });

  final List<String> cardDataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: 320,
      decoration: mainWhiteBoxDecoration,
      //FruitCard title
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: fadedBgColor,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  height: 200,
                  width: 300,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.fill,
                  //     image: NetworkImage(
                  //       dataAsString[0]
                  //     ),
                  //   ),
                  // ),
                  child: cardDataList[0] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ImageFromNetwork(ulr: cardDataList[0]))
                      : const Icon(
                          Icons.image,
                          color: whiteColor,
                        ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                    child: Text(
                      cardDataList[1],
                      style: TextStyle(
                        wordSpacing: 2,
                        color: textColorGrey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
