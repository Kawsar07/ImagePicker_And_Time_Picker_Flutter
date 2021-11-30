// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void  main (){
//   runApp(MaterialApp(home: HomePage(),));
// }
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // create TimeOfDay variable
//   TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);
//
//   // show time picker method
//   void _showTimePicker() {
//     showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     ).then((value) {
//       setState(() {
//         _timeOfDay = value!;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             // display the chosen time
//             Text(
//               _timeOfDay.format(context).toString(),
//               style: TextStyle(fontSize: 50),
//             ),
//
//             // button
//             MaterialButton(
//               onPressed: _showTimePicker,
//               child: const Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Text('PICK TIME',
//                     style: TextStyle(color: Colors.white, fontSize: 30)),
//               ),
//               color: Colors.blue,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String imagePath = "";
  final Picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40.0,),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 120.0,),
                FloatingActionButton(
                  onPressed: ()async{
                    final pickfile = await ImagePicker().getImage(source: ImageSource.camera);
                    if(pickfile != null) {
                      setState(() {
                        imagePath = pickfile.path;
                      });
                    }
                  },
                  child:Icon(Icons.camera),backgroundColor: Colors.tealAccent,),
                SizedBox(width: 20.0,),
                FloatingActionButton(onPressed: ()async{
                  final pickfile = await ImagePicker().getImage(source: ImageSource.gallery);
                  if(pickfile != null) {
                    setState(() {
                      imagePath = pickfile.path;
                    });
                  }
                },
                  child:Icon(Icons.twenty_mp),backgroundColor: Colors.indigo,),
              ],
            ),
          ),
          imagePath!=""?
          Container(
            padding: EdgeInsets.all(30.0),
            child: Image.file(File(imagePath)),
          ):Container(),
        ],
      ),
    );
  }
}