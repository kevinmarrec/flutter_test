import 'package:flutter/material.dart';

import '../widgets/chat_preview.dart';
import '../widgets/circle_cached_network_avatar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Row(
              children: [
                CircleCachedNetworkAvatar(
                  url: 'https://api.adorable.io/avatars/48',
                  size: 36,
                ),
                SizedBox(width: 24),
                Text(
                  'Chats',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            actions: [
              CustomActionButton(
                icon: Icons.camera_alt,
                onPressed: () => print('bonsoir 1'),
              ),
              SizedBox(width: 16),
              CustomActionButton(
                icon: Icons.edit,
                onPressed: () => print('bonsoir 2'),
              ),
              SizedBox(width: 16),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: Colors.grey[200],
              ),
              child: Text('Search'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) => InkWell(
                onTap: () => print('Tapped $index'),
                child: ChatPreview(key: ValueKey(index)),
              ),
              childCount: 100,
            ),
          )
        ],
      ),
    );
  }
}

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const CustomActionButton({
    Key key,
    @required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(width: 38),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 0,
      highlightElevation: 0,
      shape: CircleBorder(),
      fillColor: Colors.grey[200],
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}
