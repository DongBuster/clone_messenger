import 'package:flutter/material.dart';

class ListCardCall extends StatelessWidget {
  String image, title, subtitle, timeDate;
  // IconData? icon1;
  IconData iconSub, icon2;
  ListCardCall({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.timeDate,
    // required this.icon1,
    required this.iconSub,
    required this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      elevation: 0.0,
      child: ListTile(
        // leading: buildCircleImage(image, icon1),
        title: Padding(
            padding: const EdgeInsets.only(bottom: 10), child: Text(title)),
        subtitle: Row(children: [
          Icon(
            iconSub,
            size: 15,
          ),
          Text(' $subtitle . $timeDate')
        ]),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.black12,
          ),
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          width: 30,
          height: 30,
          child: Center(
            child: IconButton(
              onPressed: null,
              icon: Icon(icon2),
              iconSize: 18,
              padding: const EdgeInsets.all(0),
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
