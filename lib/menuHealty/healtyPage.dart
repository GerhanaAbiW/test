import 'package:flutter/material.dart';
import 'package:hydroponic/dataBase/symtoms.dart';
import 'package:hydroponic/menuHealty/healtyPageDetail.dart';


//import 'package:http/http.dart' as http;

class HealtyPage extends StatefulWidget{
  @override 
  _HealtyPageState createState() => _HealtyPageState();
}

class _HealtyPageState extends State<HealtyPage>{

List<Symptoms> symptoms = [
  Symptoms (id: 1,name:'Pusing'),
  Symptoms (id: 1,name:'Darah Tinggi'),
  Symptoms (id: 1,name:'Sembelit'),
  Symptoms (id: 1,name:'Radang'),
  
];

 @override
//  void initState() {
//    super.initState();
   
//    setState(() {
//      symptoms = symptoms;
//      fileterdGejala = symptoms;
//    });
//  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Healty"),
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon (Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context,false),
        ),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              hintText: ('Search Symptoms...'),
            ),
          ),
          Expanded(
            child: ListView.builder(
             itemCount: symptoms.length,
             itemBuilder: (context,index){
             return Card(
             child: ListTile(
               title: Text(symptoms[index].name),
               trailing:Icon(Icons.arrow_right),
               onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HealtyDetailPage();
                  }));
               },
             ),
            );
           },
          ), 
        ),
      ],
    ),
  );
  }
}
