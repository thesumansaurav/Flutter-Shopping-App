import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://png.pngtree.com/png-vector/20190704/ourmid/pngtree-businessman-user-avatar-free-vector-png-image_1538405.jpg";

    return Drawer(
      child: Container(
        color: Colors.purple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(    
                accountName: Text("Suman"), 
                accountEmail: Text("suman@tb.com)"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
              ),
            title: Text(
              "Home", 
              textScaleFactor: 1.2,
              style: TextStyle(
              color: Colors.white,
                ),
              ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
              ),
            title: Text(
              "Profile", 
              textScaleFactor: 1.2,
              style: TextStyle(
              color: Colors.white,
                ),
              ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.white,
              ),
            title: Text(
              "Settings", 
              textScaleFactor: 1.2,
              style: TextStyle(
              color: Colors.white,
                ),
              ),
          ),
        ],
      ),
      ),
    );
  }
}