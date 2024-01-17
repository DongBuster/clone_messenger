import 'package:flutter/material.dart';
import 'package:clone_messenger/features/screensRoute/screenVideoNews.dart';

// can use package: cached_network_image when image is error

Widget buildListPhoneCall(String linkImage, String title, IconData icon) {
  return Card(
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    color: Colors.transparent,
    elevation: 0.0,
    child: ListTile(
      // leading: buildCircleImage(linkImage, icon),
      title: Text(title),
    ),
  );
}

Widget buildNews(String linkImage, String title, String linkImageUser,
    BuildContext context) {
  return InkWell(
    onTap: () => Navigator.of(context).push(routeVideoNews()),
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(linkImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.blue)),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(linkImage),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
