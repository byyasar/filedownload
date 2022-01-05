// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:google_sheet_db/model/ders_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:google_sheet_db/main.dart';

void main() {
  setUp(() {});
  test('Name Box Create and Put', () async {
    final List<DersModel> dersler = [];
    var raw = await http
        .get("https://script.google.com/macros/s/AKfycbxdfmOBc8UooJSD_iTdjhgR0ts5ux9JBhuRtHLdPml4uY21oLfy/exec");
    if (raw.statusCode == 200) {
      var jsonFeedback = convert.jsonDecode(raw.body);
      //print('this is json Feedback ${jsonFeedback}');
      for (var item in jsonFeedback) {
        DersModel dersModel = DersModel();
        dersModel.ders = item['ders'];
        dersler.add(dersModel);
      }
    }

    expect(dersler, isNotNull);
  });
}
