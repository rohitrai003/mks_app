import 'package:flutter/material.dart';
import 'package:mks_app/src/constant/textstyle.dart';
import 'package:mks_app/src/view/createDocScreen.dart';

customOptionButton(String icon, String title, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateDocScreen(
              appbartitle: title,
              t: title,
            ),
          ));
    },
    child: Ink(
      child: Column(
        children: [
          CircleAvatar(
            // radius: 45,
            backgroundColor: Colors.white,
            maxRadius: 45,
            minRadius: 30,
            child: Image.asset(
              icon,
              height: 50,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: secondaryStyle,
          )
        ],
      ),
    ),
  );
}
