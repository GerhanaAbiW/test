import 'package:flutter/material.dart';
//import 'package:flutter/semantics.dart';
//import 'package:hello_world/menuLearning.dart';



class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Hydroponic"),
        backgroundColor: Colors.green[700],
      ),
      backgroundColor: Colors.green[100],
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text("Gerhana Abi W", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
              accountEmail: new Text("gerhana@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pinimg.com/236x/1a/42/35/1a42353cd68205417ca72cf4fb5800c9.jpg")
              ),
              decoration: new BoxDecoration(color: Colors.green[700]),
              ),
          InkWell(
              onTap: (){},
              child: ListTile(
              leading : Icon(Icons.home),
              title: Text("Home"),),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
              leading : Icon(Icons.person),
              title: Text("Profil"),),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
              leading : Icon(Icons.vpn_key),
              title: Text("Change Password"),),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
              leading : Icon(Icons.shopping_basket),
              title: Text("Orders"),),
            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
              leading : Icon(Icons.help),
              title: Text("About Us"),),
            ),
              InkWell(
              onTap: (){},
              child: ListTile(
              leading : Icon(Icons.exit_to_app),
              title: Text("Log Out"),),
            ),

          ],)
      ),
      
      body: Container(
        padding: EdgeInsets.all(30.0),
        
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
          MyMenu(title: 'Learning', icon: Icons.book, warna: Colors.brown,route: "/menuLearning",),
          MyMenu(title: "Healty", icon: Icons.movie, warna: Colors.blue,route: "/menuLearning",),
          MyMenu(title: "Market",icon: Icons.shop, warna: Colors.orange,route: "/menuLearning",),
          MyMenu(title: "MyPlant", icon: Icons.cake, warna: Colors.pink,route: "/menuLearning",),
          MyMenu(title: "MyPlant", icon: Icons.cake, warna: Colors.pink,route: "/menuLearning",),
          MyMenu(title: "MyPlant", icon: Icons.cake, warna: Colors.pink,route: "/menuLearning",),
        ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget{
  MyMenu({this.title, this.icon, this.warna, this.route});
  final String title, route;
  final IconData icon;
  final MaterialColor warna;
  @override
  Widget build(BuildContext context){
    return Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(route),
              splashColor: Colors.green,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(icon, size: 70.0,color: warna,),
                    Text(title,style: new TextStyle(fontSize: 17.0),)
                    
                  ],),)
            ),
          );
  }
}