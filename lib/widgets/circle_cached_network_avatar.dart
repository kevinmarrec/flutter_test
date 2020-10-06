import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleCachedNetworkAvatar extends StatelessWidget {
  final String url;
  final double size;

  CircleCachedNetworkAvatar({@required this.url, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: size,
        width: size,
        child: CachedNetworkImage(
          imageUrl: url,
          placeholder: (context, url) => Container(
            color: Theme.of(context).accentColor,
            child: Icon(Icons.person),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
