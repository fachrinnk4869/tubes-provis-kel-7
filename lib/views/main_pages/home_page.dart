// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Container(
//       width: double.infinity,
//       height: 568,
//       child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Container(
//             padding: EdgeInsets.fromLTRB(0, 62, 0, 0),
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//                 color: Color(0xffffffff),
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [BoxShadow(color: Color())])),
//       ),
//     ));
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Test"),
    );
  }
}