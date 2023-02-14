// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class ListPage extends StatefulWidget {
//   const ListPage({super.key});

//   @override
//   State<ListPage> createState() => _ListPageState();
// }

// class _ListPageState extends State<ListPage> {
//   var snap;

//   @override
//   Widget build(BuildContext context) {
//     DocumentReference docRef = FirebaseFirestore.instance
//         .collection('fruitsAndVegetable')
//         .doc('0 Apple');
//     docRef.get().then((DocumentSnapshot snapshot) async {
//       print('================================================================');
//       print(snapshot.data());
//       if (snapshot.exists) {
//         snap = snapshot.data();
//         print(snap['x']);
//       }
//     });
//     @override
//     void initState() {
//       super.initState();
//     }

//     return Scaffold(
//         appBar: AppBar(
//           title: Text("some data"),
//         ),
//         body: snap != null
//             ? Column(
//                 children: [
//                   ListTile(
//                     title: Text(this.snap['x']!.toString()),
//                   ),
//                   ListTile(
//                     title: Text(snap['id']!.to),
//                   ),
//                   ListTile(
//                     title: Text(snap['name']!.toString()),
//                   ),
//                 ],
//               )
//             : Center(
//                 child: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ));
//     // Container(
//     //   child: StreamBuilder(
//     //       stream: FirebaseFirestore.instance
//     //           .collection('fruitsAndVegetable')
//     //           .snapshots(),
//     //       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     //         if (snapshot.hasData) {
//     //           return ListView.builder(
//     //             itemCount: snapshot.data!.docs.length,
//     //             itemBuilder: (BuildContext context, int index) {
//     //               return Container(
//     //                 child: Text(snapshot.data!.docs[index]['id']),
//     //               );
//     //             },
//     //           );
//     //         } else {
//     //           return Container();
//     //         }
//     //       }),
//     // ),
//   }
// }
