// import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
// import 'package:hydroponic/menuMarket/cart.dart';
// import 'package:hydroponic/menuMarket/horizontalListView.dart';
// import 'package:hydroponic/menuMarket/product.dart';
// import 'package:hydroponic/provider/provider.dart';
// import 'package:provider/provider.dart';

// class MenuMarket extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context);
//     Widget image_carousel = new Container(
//       height: 200.0,
//       child: new Carousel(
//         boxFit: BoxFit.cover,
//         images: [
//           AssetImage('images/bayam.jpeg'),
//           AssetImage('images/hydro1.jpeg'),
//           AssetImage('images/obat.jpeg'),
//           AssetImage('images/hydro2.jpeg'),
//           AssetImage('images/pupuk.jpeg'),
//         ],
//         autoplay: true,
//         animationCurve: Curves.fastOutSlowIn,
//         animationDuration: Duration(milliseconds: 1000),
//         dotSize: 4.0,
//         indicatorBgPadding: 2.0,
//       ),
//     );
//     return Scaffold(
//         appBar: new AppBar(
//           elevation: 0.1,
//           title: Text("HydroMarket"),
//           backgroundColor: Colors.green[700],
//           actions: <Widget>[
//             new IconButton(
//                 icon: Icon(
//                   Icons.search,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {}),
//             new IconButton(
//                 icon: Icon(
//                   Icons.shopping_cart,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).push(
//                       new MaterialPageRoute(builder: (context) => new Cart()));
//                 }),
//           ],
//         ),
//         backgroundColor: Colors.green[100],
//         drawer: new Drawer(
//             child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: new Text(
//                 "Gerhana Abi W",
//                 style:
//                     new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
//               ),
//               accountEmail: new Text("gerhana@gmail.com"),
//               currentAccountPicture: CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       "https://i.pinimg.com/236x/1a/42/35/1a42353cd68205417ca72cf4fb5800c9.jpg")),
//               decoration: new BoxDecoration(color: Colors.green[700]),
//             ),
//             //body
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 leading: Icon(Icons.home),
//                 title: Text("Home"),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 leading: Icon(Icons.person),
//                 title: Text("Profil"),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 leading: Icon(Icons.vpn_key),
//                 title: Text("Change Password"),
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 leading: Icon(Icons.shopping_basket),
//                 title: Text("Orders"),
//               ),
//             ),

//             Divider(),

//             InkWell(
//               onTap: () {},
//               child: ListTile(
//                 leading: Icon(Icons.help),
//                 title: Text("About Us"),
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 user.signOut();
//               },
//               child: ListTile(
//                 leading: Icon(Icons.exit_to_app),
//                 title: Text("Log Out"),
//               ),
//             ),
//           ],
//         )),
//         body: new Column(children: <Widget>[
//           image_carousel,

//           new Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Container(
//                 alignment: Alignment.topCenter, child: new Text("Categories")),
//           ),
//           HorizontalList(),

//           new Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Container(
//                 alignment: Alignment.topCenter,
//                 child: new Text("Recent Product")),
//           ),

//           //Flexible(child: Products()),
//         ]));
//   }
// }
