import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarUser extends StatelessWidget {
  String isOnline;
  String link;
  AvatarUser({super.key, required this.isOnline, required this.link});

  @override
  Widget build(BuildContext context) {
    return isOnline == "false"
        ? Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                height: 40,
                width: 40,
                imageUrl: link,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 20,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    height: 40,
                    width: 40,
                    imageUrl: link,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 1,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
