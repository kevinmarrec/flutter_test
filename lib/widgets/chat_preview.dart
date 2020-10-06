import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './circle_cached_network_avatar.dart';

const faker = Faker();

class ChatPreview extends StatelessWidget {
  const ChatPreview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String avatarUrl = 'https://api.adorable.io/avatars/48/${key.toString()}';
    String fakeName = faker.person.name();
    String fakeMessageContent =
        faker.lorem.words(faker.randomGenerator.integer(10, min: 3)).join(' ');
    DateTime fakeDate =
        faker.date.dateTime(minYear: now.year, maxYear: now.year);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          CircleCachedNetworkAvatar(url: avatarUrl),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fakeName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        fakeMessageContent,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('•'),
                    ),
                    Text(
                      DateFormat(
                        fakeDate.difference(now).inHours < 12 ? 'Hm' : 'MMM d',
                      ).format(fakeDate),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 10),
          CircleCachedNetworkAvatar(
            url: avatarUrl,
            size: 20,
          ),
        ],
      ),
    );
  }
}
