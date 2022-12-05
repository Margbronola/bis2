// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> makePdf(dynamic user, dynamic grade) async {
  final pdf = Document();

  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BAGACAY INTEGRATED SCHOOL",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "LRN :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  user['lrn'],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Name :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "${user['firstname']} ${user['lastname']}",
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Strand :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 10),
                Text(user['strand']),
              ],
            ),
            Row(
              children: [
                Text(
                  "Grade & Section :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 10),
                Text("${user['grade']} - ${user['section']}"),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            // ListView.separated(
            //   padding: const EdgeInsets.all(0),
            //   itemCount: order.items.length,
            //   itemBuilder: (_, x) {
            //     final List<ItemsModel> items = order.items;
            //     return Container(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           items[x].product?.dishName ??
            //               items[x].formula!.name,
            //         ),
            //         Text(
            //           items[x].unitprice.toStringAsFixed(2),
            //         ),
            //       ],
            //     ),
            //     Text(
            //       "x${items[x].qty}",
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
            // Divider(
            //   height: 5,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Total",
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     Text(
            //       items[x].amount.toStringAsFixed(2),
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // )
            //         ],
            //       ),
            //     );
            //   },
            //   separatorBuilder: (_, i) => SizedBox(height: 5),
            // ),
            // SizedBox(height: 10),
            // SizedBox(height: 10),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Sous Total",
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     Text(order.subtotal.toStringAsFixed(2)),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "TVA",
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     Text(order.vat.toStringAsFixed(2)),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Total",
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     Text(
            //       order.total.toStringAsFixed(2),
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // )
          ],
        );
      },
    ),
  );
  final Uint8List imageInUnit8List = await pdf.save();
  return imageInUnit8List;
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        textAlign: align,
      ),
    );
