import 'package:flutter/material.dart';
import 'package:hydroponic/dataBase/vegies.dart';


class HealtyDetailPage extends StatefulWidget{
  @override 
  _HealtyDetailPageState createState() => _HealtyDetailPageState();
}

class _HealtyDetailPageState extends State<HealtyDetailPage>{

List<Vegies> veggiesAndFruits = [
  Vegies (id: 1,name:'Pisang'),
  Vegies (id: 1,name:'Bayam'),
  Vegies (id: 1,name:'Semangka'),
  Vegies (id: 1,name:'Kangkung'),
  Vegies (id: 1,name:'Selada'),
  Vegies (id: 1,name:'Kacang'),
  Vegies (id: 1,name:'Daun bawang'),
  Vegies (id: 1,name:'Kangkung'),
];


 @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Healty Detail"),
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon (Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context,false),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
                  height: 10.0,
            ),
            buildTitle(),
            SizedBox(
                  height: 10.0,width: 10.0,
            ),
            buildSubTitle(),
            // SizedBox(
            //   height: 10.0,
            // ),
            Expanded(
              child: ListView.builder(
              itemCount: veggiesAndFruits.length,
              itemBuilder: (context,index){
              return Card(
              child: ListTile(
              title: Text(veggiesAndFruits[index].name),
              trailing:Icon(Icons.arrow_right),
              onTap: (){},
              ),
              );
            },
            ), 
          ),
        ],
      ),
    );
  }



  Widget buildTitle(){
    return Container(
      height: 120.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
      child: Center(
       child: Text(
              'Pusing',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }

  Widget buildSubTitle(){
    return Container(
       height: 56.0,
      width: MediaQuery.of(context).size.width,
      //margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
  // decoration: BoxDecoration(
  //   color: Colors.white,
  //   borderRadius: BorderRadius.only(
  //     topLeft: Radius.circular(10),
  //       topRight: Radius.circular(10),
  //       bottomLeft: Radius.circular(10),
  //       bottomRight: Radius.circular(10)
  //   ),
  //   boxShadow: [
  //     BoxShadow(
  //       color: Colors.grey.withOpacity(0.5),
  //       spreadRadius: 5,
  //       blurRadius: 7,
  //       offset: Offset(0, 3), // changes position of shadow
  //     ),
  //   ],
  // ),
      child: Row(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.center,
       // mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "\t\t\tKami tahu Buah atau Sayuran yang bisa anda tanam! \n\t\t\tkalian bisa tap untuk mulai menanam.",
            style: TextStyle(
             // fontSize: 10.0,
            ),
          )
        ],
      ),
      
    );
  }

}