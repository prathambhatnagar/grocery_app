import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:grocery/pages/widgets/services/database.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discriptionController = TextEditingController();

  final List<String> category = ['Ice-Cream', 'Pizza', 'Salad', 'Burger'];
  String? value;

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  String randomAlphaNumeric(int length) {
    const characters =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(
            length, (index) => characters[random.nextInt(characters.length)])
        .join();
  }

  uploadItem() async {
    if (selectedImage != null &&
        _nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        value != null) {
      try {
        String addId = randomAlphaNumeric(10);
        // Initialize Firebase Storage reference
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child('blogImages').child(addId);

        // Upload image to Firebase Storage
        final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
        final snapshot = await task.whenComplete(() {});
        var imageUrl = await snapshot.ref.getDownloadURL();

        Map<String, dynamic> addItem = {
          'Image': imageUrl,
          'Name': _nameController.text,
          'Price': _priceController.text,
          'Details': _discriptionController.text,
          'Category': value
        };

        // Add food item details to Firestore
        await DataBaseMethod().addFoodItem(addItem, value!).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text("Item added successfully"),
          ));
        }).catchError((e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("Error: $e"),
          ));
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Failed to upload image: $e"),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("Please fill in all fields and upload an image."),
      ));
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _discriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Item',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload the item picture',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20),
              selectedImage == null
                  ? GestureDetector(
                      onTap: pickImage,
                      child: Center(
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 30,
                            ),
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.black, width: 2.5)),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.black, width: 2.5)),
                        ),
                      ),
                    ),
              SizedBox(height: 20),
              Text(
                "Item Name",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: 'Enter item name', border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Item Price",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _priceController,
                  decoration: InputDecoration(
                      hintText: "Enter item's Price", border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Item Description",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  maxLines: 6,
                  controller: _discriptionController,
                  decoration: InputDecoration(
                      hintText: "Enter item's description",
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Item Category",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: category.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                    dropdownColor: Colors.white,
                    hint: Text(
                      'Select the category',
                      style: TextStyle(fontSize: 26),
                    ),
                    iconSize: 25,
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                    ),
                    value: value,
                  ),
                ),
              ),
              GestureDetector(
                onTap: uploadItem,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    margin: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Add Item",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
