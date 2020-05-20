import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hydroponic/dataBase/admin/brand.dart';
import 'package:hydroponic/dataBase/admin/category.dart';
import 'package:hydroponic/dataBase/admin/product.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  ProductService _productService = ProductService();
  CategoryService _categoryService = CategoryService();
  BrandService _brandService = BrandService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  final priceController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropdown = <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropdown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _currentBrand;
  List<String> selectedSize = <String>[];
  File _image1;
  File _image2;
  File _image3;
  bool isLoading = false;

  @override
  void initState() {
    _getCategories();
    _getBrands();

  }
  List<DropdownMenuItem<String>>getCategoriesDropdown(){
    List<DropdownMenuItem<String>> items = new List();
    for(int i =0; i<categories.length; i++){
      setState(() {
        items.insert(0, DropdownMenuItem(child: Text(categories[i].data["category"]),
          value: categories[i].data['category'],));
      });
    }
    return items;

  }
  List<DropdownMenuItem<String>>getBrandDropdown(){
    List<DropdownMenuItem<String>> items = new List();
    for(int i =0; i<brands.length; i++){
      setState(() {
        items.insert(0, DropdownMenuItem(child: Text(categories[i].data["brand"]),
          value: brands[i].data['brand'],));
      });
    }
    return items;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Text("add product", style: TextStyle(color: Colors.black),),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: isLoading? CircularProgressIndicator():Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(borderSide: BorderSide(color: Colors.grey.withOpacity(0.8),width: 2.0),
                      onPressed: (){
                        _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),1);
                      },
                      child: _displayChild1()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(borderSide: BorderSide(color: Colors.grey.withOpacity(0.8),width: 2.0),
                        onPressed: (){
                          _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),2);
                        },
                        child: _displayChild2()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(borderSide: BorderSide(color: Colors.grey.withOpacity(0.8),width: 2.0),
                        onPressed: (){
                          _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),3);
                        },
                        child: _displayChild3()),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("enter the product name with 10 characters maximum",textAlign: TextAlign.center, style: TextStyle(color: Colors.green, fontSize: 12),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: productNameController,
                  decoration: InputDecoration(
                    hintText: "Product name"
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return "you must enter the product name";
                    }else if(value.length>10){
                      return "product name cant have more than 10 letters";
                    }
                  },
                ),
              ),

              //select category
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Category: ", style: TextStyle(color: Colors.green),),
                  ),
                  DropdownButton(items: categoriesDropdown, onChanged: changeSelectedCategory, value: _currentCategory,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Brand: ", style: TextStyle(color: Colors.green),),
                  ),
                  DropdownButton(items: brandsDropdown, onChanged: changeSelectedBrand, value: _currentBrand,),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: quantityController,
                  initialValue: "1",
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      //labelText: "Price"
                      hintText: "Quantity"
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return "you must input the product quantity";
                    }
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: "0.00",
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    //labelText: "Price",
                      hintText: "Price"
                  ),
                  validator: (value){
                    if(value.isEmpty){
                      return "you must input the product price";
                    }
                  },
                ),
              ),


              Text("Available Size"),
              Row(
                children: <Widget>[
                  Checkbox(value: selectedSize.contains("S"), onChanged: (value)=>changeSelectedSize("S") ),
                  Text("S"),
                  Checkbox(value: selectedSize.contains("M"), onChanged: (value)=>changeSelectedSize("M") ),
                  Text("M"),
                  Checkbox(value: selectedSize.contains("XL"), onChanged: (value)=>changeSelectedSize("XL") ),
                  Text("XL"),
                ],
              ),

              //select brand
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("add product"),
                onPressed: (){
                  validateAndUpload();
                },
              )




            ],
          ),
        ),
      ),
    );
  }

  _getCategories() async{
    List<DocumentSnapshot> data = await _categoryService.getCategories();
    print(data.length);
    setState(() {
      //print(data.length);
      categories = data;
      categoriesDropdown=getCategoriesDropdown();
      _currentCategory = categories[0].data["category"];
      print(categories.length);
    });
  }

  changeSelectedCategory(String selectedCategory) {
    setState(() {
      _currentCategory = selectedCategory;
    });

  }
  _getBrands() async{
    List<DocumentSnapshot> data = await _brandService.getBrands();
    print(data.length);
    setState(() {
      //print(data.length);
      brands = data;
      brandsDropdown=getCategoriesDropdown();
      _currentBrand = brands[0].data["brand"];
      print(brands.length);
    });
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() {
      _currentBrand= selectedBrand;
    });

  }

  changeSelectedSize(String size) {
    if(selectedSize.contains(size)){
      setState(() {
        selectedSize.remove(size);
      });
    }else{
      setState(() {
        selectedSize.add(size);
      });
    }
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async{
    File tempImg = await pickImage;
    switch(imageNumber){
      case 1: setState(() {
        _image1 = tempImg;
      });
      break;
      case 2: setState(() {
        _image2 = tempImg;
      });
      break;
      case 3: setState(() {
        _image3 = tempImg;
      });
      break;
  };
  }

  _displayChild1() {
    if(_image1==null){
     return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: Icon(Icons.add,color: Colors.grey,),
      );
    }else{
      return Image.file(_image1, fit: BoxFit.fill, width: double.infinity,);
    }
  }

  _displayChild3() {
    if(_image2==null){
     return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: Icon(Icons.add,color: Colors.grey,),
      );
    }else{
     return Image.file(_image2, fit: BoxFit.fill, width: double.infinity,);
    }
  }

  _displayChild2() {
    if(_image3==null){
     return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: Icon(Icons.add,color: Colors.grey,),
      );
    }else{
      return Image.file(_image3, fit: BoxFit.fill, width: double.infinity,);

    }
  }

  void validateAndUpload() async {
    if(_formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      if(_image1 != null && _image2 != null && _image3 != null){
        if(selectedSize.isNotEmpty){
          String imageURL1;
          String imageURL2;
          String imageURL3;
          final FirebaseStorage storage = FirebaseStorage.instance;

          final String picture1 = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 = storage.ref().child(picture1).putFile(_image1);


          final String picture2 = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task2 = storage.ref().child(picture1).putFile(_image2);


          final String picture3 = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task3 = storage.ref().child(picture1).putFile(_image3);

          StorageTaskSnapshot snapshot1 = await task1.onComplete.then((snapshot)=>snapshot);
          StorageTaskSnapshot snapshot2 = await task1.onComplete.then((snapshot)=>snapshot);

          task3.onComplete.then((snapshot3)async{
            imageURL1 = await snapshot1.ref.getDownloadURL();
            imageURL2 = await snapshot2.ref.getDownloadURL();
            imageURL3= await snapshot3.ref.getDownloadURL();
            List<String>imageList = [imageURL1,imageURL2,imageURL3];
            _productService.uploadProduct(productName: productNameController.text,
            price: double.parse(priceController.text), sizes: selectedSize, images: imageList,quantity: int.parse(quantityController.text));
            _formKey.currentState.reset();
            setState(() {
              isLoading=false;
            });
            Fluttertoast.showToast(msg: "product added");
            Navigator.pop(context);
          });
        }else{
          Fluttertoast.showToast(msg: "select at least one size");
        }
      }else{
        Fluttertoast.showToast(msg: "all the images must be provided");
      }
    }
  }
}
