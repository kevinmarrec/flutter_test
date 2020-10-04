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
                onTap: () => print('bonsoir'),
              ),
              SizedBox(width: 16),
              CustomActionButton(
                icon: Icons.edit,
                onTap: () => print('bonsoir'),
              ),
              SizedBox(width: 16),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) => InkWell(
                onTap: () => print('Tapped $index'),
                child: ChatPreview(),
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
  final Function onTap;

  const CustomActionButton({
    Key key,
    @required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      child: LayoutBuilder(builder: (context, constraints) {
        return Ink(
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: InkWell(
            customBorder: const CircleBorder(),
            splashColor: Colors.grey[400],
            onTap: onTap,
            child: Icon(icon),
          ),
        );
      }),
    );
  }
}
