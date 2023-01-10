// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {

    Future takePhoto() async {
      final PickedFile = await picker.getImage(source: ImageSource.camera);
      setState(() {
        _image = File(PickedFile!.path);
      });
    }

    Future getImage() async {
      final PickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _image = File(PickedFile!.path);
      });
    }

    Future<void>_dialogbox(){
      return showDialog(
          context: context,
          builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.greenAccent,
          shape: const RoundedRectangleBorder(),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget> [
                GestureDetector(
                  child: Text("Picture from Camera",
                  style: TextStyle(fontSize: 18,
                  color: Colors.black,
                    ),
                  ),
                  onTap: takePhoto,
                ),
                 const Padding(padding: EdgeInsets.only(top: 20)),
                GestureDetector(
                  child: Text("Picture from Gallery",
                      style: TextStyle(fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  onTap: getImage,
                  ),
                ],
              ),
            ),
          );
        });
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Image Picker'
        ),
      ),
      body: Center(
        child: _image == null ? Text('No Image') : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _dialogbox,
          child: Icon(Icons.add_a_photo),
        tooltip: 'Open Camera',
      ),
    );
  }
}
