import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_hack3/utils/MyRoutes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://media.gettyimages.com/id/517764562/photo/indias-captain-mahendra-singh-dhoni-walks-off-the-pitch-after-the-end-of-the-australian.jpg?s=612x612&w=gi&k=20&c=B1cAu94kUTRikmXPrifZ9sj2DYfoLdF3iLQ_CJf5uBM=";
    return Drawer(
      child: Container(
        color: const Color.fromARGB(222, 51, 136, 179),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Abhishek D"),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(222, 51, 136, 179),
                  ),
                  accountEmail: Text("abhi@gmail.com"),
                  margin: EdgeInsets.zero,
                  //currentAccountPicture: Image.network(imageUrl),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl, scale: 1.0),
                  ),
                )),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(MyRoutes.homepage);
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(MyRoutes.loginRoutes);
              },
              leading: const Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: const Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Mail",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(MyRoutes.foodroutes);
              },
              leading: const Icon(
                CupertinoIcons.arrow_2_circlepath,
                color: Colors.white,
              ),
              title: const Text(
                "Products",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
