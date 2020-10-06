import 'package:flutter/material.dart';

import '../widgets/chat_preview.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text('Chats',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                )),
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
