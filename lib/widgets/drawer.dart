import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
             accountName: Text("accountName"),
             accountEmail: Text("accountEmail"),
             currentAccountPicture: Icon(Icons.lock_clock_rounded,size: 40),
           ),
          ListTile(
            tileColor: Colors.blueAccent,
            leading: IconButton(onPressed: (){}, icon: const Icon(Icons.home,size: 30)),
            title: const Text("Home",textScaleFactor: 1.3,),
          ),
          ListTile(
            tileColor: Colors.blueAccent,
            leading: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.profile_circled,size: 30)),
            title: const Text("Profile",textScaleFactor: 1.3,),
          ),
          ListTile(
            tileColor: Colors.blueAccent,
            leading: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.mail_solid,size: 30)),
            title: const Text("Mail",textScaleFactor: 1.3,),
          ),
        ],
      ),
    );
  }
}
