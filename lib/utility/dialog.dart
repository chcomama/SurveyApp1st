import 'package:flutter/material.dart';
import 'package:survey_project/utility/my_style.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('images/logo.png'),
        title: Text(string,style: MyStyle().redStyle(),),
      ),
      children: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
      ],
    ),
  );
}
// Future<Null> normalDialog(BuildContext context, String string) async {
//   showDialog(
//     context: context,
//     builder: (context) => SimpleDialog(
//       title: ListTile(
//         leading: Image.asset('images/logo.png'),
//         title: Text(string),
//       ),
//       children: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text('OK'),
//         )
//       ],
//     ),
//   );
// }
