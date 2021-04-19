import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/widgets/upcoming_room.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

import '../data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.search,
            size: 28.0,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.envelope_open, size: 26.0),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.calendar, size: 28.0),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.bell, size: 28.0),
            onPressed: () {},
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 20, 10.0),
              child: UserProfileImage(
                imageUrl: currentUser.imageUrl,
                size: 36.0,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
              padding: const EdgeInsets.fromLTRB(
                20.0,
                20.0,
                20.0,
                120.0,
              ),
              children: [
                UpcomingRooms(
                  upcomingRooms: upcomingRoomsList,
                ),
                const SizedBox(height: 12.0),
                ...roomsList.map((e) => RoomCard(room: e))
              ]),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                Theme.of(context).scaffoldBackgroundColor
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
              bottom: 60.0,
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(24.0)),
                child: const Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Icon(
                    CupertinoIcons.add,
                    size: 21.0,
                    color: Colors.white,
                  )),
                  TextSpan(
                      text: ' Start a room',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500))
                ])),
              )),
          Positioned(
            bottom: 60.0,
            right: 40.0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                    icon: const Icon(
                      CupertinoIcons.circle_grid_3x3_fill,
                      size: 25.0,
                    ),
                    onPressed: () {}),
                Positioned(
                    bottom: 7.6,
                    right: 11.8,
                    child: Container(
                      height: 15.0,
                      width: 15.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).accentColor),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
