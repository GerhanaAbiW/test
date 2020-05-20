//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hydroponic/menuMarket/productClick.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList=[
    {
    "name" : "Bayam",
    "picture" : "images/bayam.jpeg",
    "price" : 100
    },
    {
    "name" : "Bayam",
    "picture" : "images/bayam.jpeg",
    "price" : 100
    },
    {
    "name" : "Bayam",
    "picture" : "images/bayam.jpeg",
    "price" : 100
    },
    {
    "name" : "Bayam",
    "picture" : "images/bayam.jpeg",
    "price" : 100
    },];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: SingleProduct(
          productPicture: productList[index]["picture"],
          productName: productList[index]["name"],
          productPrice: productList[index]["price"],
        ),
        );
      },);
  }
}

class SingleProduct extends StatelessWidget {
  final productPicture;
  final productName;
  final productPrice;
  SingleProduct({
    this.productPicture,
    this.productName,
    this.productPrice
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text("ProductDetail"), 
        child: Material(
          child: InkWell(
            onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ProductDetails(
              //parsing data
              productDetailName: productName,
              productDetailPicture: productPicture,
              productDetailPrice: productPrice,
            ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    productName, 
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  title: Text(
                    "\$$productPrice",
                    style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    "\$$productPrice",
                    style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w800, decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
            child: Image.asset(
              productPicture,
              fit: BoxFit.cover,),),
          )
        )),
      
    );
  }
}