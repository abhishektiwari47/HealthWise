import 'package:Healthwise/pages/listPage.dart';
import 'package:Healthwise/pages/resultPage.dart';
import 'package:Healthwise/helpers/user.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:Healthwise/main.dart';
import 'package:tflite/tflite.dart';
import '../helpers/frontEnd.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isWorking = false;
  String result = '';

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
    loadModel();
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

      if (res > 0.95) {
        result = response['label'];
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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: imgCamera == null
            ? CameraOpeningButton()
            : CloseCameraAndSearch(cameraController),
        // appBar:
        //     AppBar(backgroundColor: primary_color, title: application_name),
        body: SafeArea(
          child: Stack(children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/SVG/MainBackground.png"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              // height: 560,
              child: Container(
                  height: 650,
                  width: 360,
                  child: imgCamera == null
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SearchBar(),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                                child: Container(
                              height: 500,
                              width: 340,
                              decoration: const BoxDecoration(
                                color: Color(0xFFffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 2.0, //extend the shadow
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: double.infinity,
                                    color: Color.fromARGB(255, 253, 126, 153),
                                    child: Center(
                                      child: Text(
                                        "Banana",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Image.network(
                                            'https://images.everydayhealth.com/images/diet-nutrition/all-about-bananas-nutrition-facts-health-benefits-recipes-and-more-rm-722x406.jpg?w=1110'),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 30, horizontal: 30),
                                          child: Text(
                                            '"If you feel recurrent soreness of muscles after a workout, you may lack magnesium in your body. A magnesium-rich banana may help with muscle contraction and relaxation that increase lean muscle mass."',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 80, 80, 80),
                                              fontSize: 20,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
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
        );
  }

  Row CloseCameraAndSearch(CameraController? cameraController) =>
      Row(children: [
//Camera Close
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.pink),
          onPressed: () async {
            await cameraController?.stopImageStream();
            await cameraController?.pausePreview();
            imgCamera = null;
            setState(() {});
          },
          child: Image(
            image: AssetImage('assets/SVG/CloseCamera.png'),
            height: 60,
            width: 60,
          ),
        ),

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
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.pink),
          onPressed: () async {
            if (result != '') {
              await cameraController?.stopImageStream();
              await cameraController?.pausePreview();
              itemName = result.toString();
              print(itemName);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ResultPage()));
            }
          },
          child: Image(
            image: AssetImage('assets/SVG/SearchFruitButton.png'),
            height: 60,
            width: 60,
          ),
        )
      ]);

  // Camera Open

  TextButton CameraOpeningButton() {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: Colors.pink),
      onPressed: () {
        initCamera();
      },
      child: Image(
        image: AssetImage('assets/SVG/CameraButton.png'),
        height: 60,
        width: 60,
      ),
    );
  }

//SearchBar
  Container SearchBar() {
    return Container(
      height: 50,
      width: 340,
      padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        //
        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0, // soften the shadow
            spreadRadius: 2.0, //extend the shadow
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 240,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Search Pomegranate'),
            ),
          ),
          Spacer(),
          TextButton(
            style: ButtonStyle(alignment: AlignmentDirectional.centerEnd),
            onPressed: () => {result},
            child: Icon(
              Icons.search,
              color: Color.fromARGB(255, 253, 126, 153),
            ),
          )
        ],
      ),
    );
  }
}
