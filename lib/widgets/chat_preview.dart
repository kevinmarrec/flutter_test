import 'package:flutter/material.dart';

const avatarImage = NetworkImage(
  'https://scontent-cdt1-1.xx.fbcdn.net/v/t1.0-9/72439280_10217608053185775_5842917185000833024_o.jpg?_nc_cat=110&_nc_sid=09cbfe&_nc_ohc=YXBSRbZl8lsAX_uQBUa&_nc_ht=scontent-cdt1-1.xx&oh=2347dffe5bcf04b606cd506fd997219d&oe=5F9F4D84',
);

class ChatPreview extends StatelessWidget {
  const ChatPreview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: avatarImage,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jean Michel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text('Some message'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text('•'),
                  ),
                  Text('19:00')
                ],
              )
            ],
          ),
          Expanded(child: Container()),
          Icon(
            Icons.check_circle,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
