import 'dart:math';
import 'package:Healthwise/helpers/backEnd.dart';
import 'package:Healthwise/pages/listPage.dart';
import 'package:Healthwise/pages/resultPage.dart';
import 'package:Healthwise/helpers/dataVariables.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Healthwise/main.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tflite/tflite.dart';
import '../helpers/frontEnd.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String docId = '';
  String objectToString = '';

  // List of string for storing..
  var dataAsString = <String>[];

  bool isWorking = false;
  String result = '';
  final searchItem = TextEditingController();

  CameraController? cameraController;
  CameraImage? imgCamera;

  initCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.max);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        print("Camera Not Mounted");
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageFromStream) {
            if (!isWorking) {
              isWorking = true;
              imgCamera = imageFromStream;
              runModelOnStreamFrames();
            }
          });
        });
      }
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  void initState() {
    super.initState();
    getUserById();
    loadModel();
  }

  int randomNumber1 = Random().nextInt(3);
  getUserById() async {
    // print("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
    int randomNumber = Random().nextInt(3);
    while (randomNumber == randomNumber1) {
      randomNumber = Random().nextInt(3);
    }
    randomNumber1 = randomNumber;
    // print("randomNumber" + randomNumber.toString());
    String id = CardFruitList[randomNumber];
    print(id);
    await fruitQuoteDoc.doc(id).get().then((DocumentSnapshot doc) {
      // final x = doc.data();
      // docId= doc.id;
      objectToString = doc.data().toString();
      print(objectToString);
      String temp = '';
      // print(doc.data());
      // print(doc.id);
      int i = 1;

      bool end = false;
      //We are just parsing the object into string.
      while (objectToString[i] != '}') {
        if (objectToString[i - 1] == ' ' && objectToString[i - 2] == ':') {
          while (objectToString[i] != ',' && end != true) {
            temp += objectToString[i];
            if (objectToString[i + 1] != '}') {
              i++;
            } else {
              end = true;
            }
          }
          //Here I add all the strings to list...
          // This line works fine.
          dataAsString.add(temp);

          temp = '';
          // print(dataAsString.length);
          // print(dataAsString[0]);
        }
        i++;
      }
      end = false;
      // print(dataAsString[0]);
      // for (var k in dataAsString) {
      //   print(k);
      // }
      print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%the data%%%%%%%%%%%%%%%%%%%%%%%");
      print(dataAsString);

      id = '';
      setState(() {});
      print('^^^^^^^^^^^^^^^^^^^^^^^^^^SetStateCalled^^^^^^^^^^^^^^^^^^^^^^^');
    });
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();
    await Tflite.close();
    await cameraController?.dispose();
  }

  runModelOnStreamFrames() async {
    var racognitions = await Tflite.runModelOnFrame(
      bytesList: imgCamera!.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: imgCamera!.height,
      imageWidth: imgCamera!.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 90,
      numResults: 1,
      threshold: 0.1,
      asynch: true,
    );

    racognitions!.forEach((response) {
      var res = response['confidence'] as double;

      if (res > 0.99) {
        result = response['label'];
        result = result.substring(2, result.length);

        //  +
        //     ' ' +
        //     (response['confidence'] as double).toStringAsFixed(2);
      }
    });
    if (mounted) {
      setState(() {
        result;
      });
    }

    isWorking = false;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: imgCamera == null
              ? FloatingButtons(
                  callFunction: () {
                    initCamera();
                  },
                  floatingIcon: Icons.camera)
              : CloseCameraAndSearch(cameraController),
          // appBar:
          //     AppBar(backgroundColor: primary_color, title: application_name),
          body: SafeArea(
            child: Stack(children: [
              Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 232, 244),
                  image: DecorationImage(
                      image: AssetImage("assets/SVG/BackGround2.png"),
                      fit: BoxFit.fill),
                ),
              ),
              Container(
                // height: 560,
                child: Container(
                    height: double.infinity,
                    width: 360,
                    child: imgCamera == null
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                width: 340,
                                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  //
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 253, 209, 209),
                                      blurRadius: 3.0, // soften the shadow
                                      spreadRadius: 3.0, //extend the shadow
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 240,
                                      child: TextField(
                                        textInputAction: TextInputAction.search,
                                        onSubmitted: (term) async {
                                          print(
                                              "##########################################" +
                                                  searchItem.text);
                                          result = searchItem.text;

                                          if (result != '') {
                                            print(
                                                "##########################################" +
                                                    result);
                                            itemName = result;
                                            print(itemName);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResultPage()));
                                          }
                                        },
                                        controller: searchItem,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Search Pomegranate'),
                                      ),
                                    ),
                                    Spacer(),
                                    TextButton(
                                      style: ButtonStyle(
                                          alignment:
                                              AlignmentDirectional.centerEnd),
                                      onPressed: () async {
                                        print(
                                            "##########################################" +
                                                searchItem.text);
                                        result = searchItem.text;

                                        if (result != '') {
                                          print(
                                              "##########################################" +
                                                  result);
                                          itemName = result;
                                          print(itemName);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResultPage()));
                                        }
                                      },
                                      child: Icon(
                                        Icons.search,
                                        color:
                                            Color.fromARGB(255, 253, 126, 153),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Builder(builder: (context) {
                                print(
                                    "***************builderbhai************************");
                                if (dataAsString.length > 0) {
                                  return Center(
                                      child: GestureDetector(
                                    onDoubleTap: () => {
                                      dataAsString.clear(),
                                      getUserById(),
                                    },
                                    child:
                                        FruitCard(dataAsString: dataAsString),
                                  ));
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                ;
                              }),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : AspectRatio(
                            aspectRatio: cameraController!.value.aspectRatio,
                            child: CameraPreview(cameraController!),
                          )),
              ),
            ]),
          )

          //   body: Container(
          //     decoration: BoxDecoration(),
          //     child: Column(children: [
          //       Stack(
          //         children: [
          //           Center(
          //             child: Container(
          //               margin: EdgeInsets.only(top: 100.0),
          //               height: 220,
          //               width: 320,
          //               child: Container(),
          //             ),
          //           ),
          //           Center(
          //             child: TextButton(
          //               onPressed: () {
          //                 initCamera();
          //               },
          //               child: Container(
          //                   margin: EdgeInsets.only(top: 5),
          //                   height: 550,
          //                   width: 360,
          //                   child: imgCamera == null
          //                       ? Container(
          //                           height: 550,
          //                           width: 360,
          //                           child: Icon(
          //                             Icons.photo_camera_front,
          //                             color: Colors.pink,
          //                             size: 60,
          //                           ),
          //                         )
          //                       : AspectRatio(
          //                           aspectRatio:
          //                               cameraController!.value.aspectRatio,
          //                           child: CameraPreview(cameraController!),
          //                         )),
          //             ),
          //           )
          //         ],
          //       ),
          //       Center(
          //         child: Container(
          //           color: primary_color,
          //           margin: EdgeInsets.only(top: 10.0),
          //           child: SingleChildScrollView(
          //               // controller: controller,
          //               child: Text(
          //             result,
          //             style: const TextStyle(
          //                 backgroundColor: Colors.black87,
          //                 fontSize: 10.0,
          //                 color: Colors.white),
          //             textAlign: TextAlign.center,
          //           )),
          //         ),
          //       ),
          //       ElevatedButton(
          //           onPressed: () async {
          //             if (result != '') {
          //               await cameraController?.stopImageStream();
          //               await cameraController?.pausePreview();
          //               itemName = result.toString();
          //               print("--------------------------------------------");
          //               print(itemName);
          //               Navigator.of(context).pushReplacement(
          //                   MaterialPageRoute(builder: (context) => ResultPage()));
          //             }
          //           },
          //           child: Container(
          //             child: Text("Next"),
          //             color: Colors.blue,
          //           ))
          //     ]),
          //   ),
          ),
    );
  }

  Padding FloatingButtons(
      {required callFunction, required IconData floatingIcon}) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 50,
        width: 50,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            // color: Colors.blue,
            // borderRadius: BorderRadius.all(
            //   Radius.circular(30),
            // ),
            ),
        child: Center(
          child: Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.pink,
            child: IconButton(
                iconSize: 30,
                splashRadius: 120,
                splashColor: Color.fromARGB(255, 255, 223, 223),
                // tooltip: 'Opening Camera',
                icon: Icon(
                  floatingIcon,
                  color: Color.fromARGB(255, 255, 254, 254),
                ),
                onPressed: () {
                  callFunction();
                }),
          ),
        ),
      ),
    );
  }

  Row CloseCameraAndSearch(CameraController? cameraController) =>
      Row(children: [
//Camera Close
        FloatingButtons(
            callFunction: () async {
              await cameraController?.stopImageStream();
              await cameraController?.pausePreview();
              result = '';
              imgCamera = null;
              setState(() {});
            },
            floatingIcon: Icons.clear),

//Result
        Spacer(),

        Container(
          color: primary_color,
          child: SingleChildScrollView(
              // controller: controller,
              child: Text(
            result,
            style: const TextStyle(
                backgroundColor: Colors.black87,
                fontSize: 10.0,
                color: Colors.white),
            textAlign: TextAlign.center,
          )),
        ),

//Camera Close Next Page
        Spacer(),
        FloatingButtons(
            callFunction: () async {
              if (result != '') {
                print("##########################################" + result);
                await cameraController?.stopImageStream();
                await cameraController?.pausePreview();
                itemName = result.toString();
                print(itemName);
                imgCamera = null;

                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage()));
                setState(() {});
              }
            },
            floatingIcon: Icons.search)
      ]);

  // Camera Open

//SearchBar
}
