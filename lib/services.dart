import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

String baseURL = 'https://1ae6-41-210-27-224.ngrok-free.app/';
var uuid = const Uuid();
// await Future.delayed(const Duration(milliseconds: 200));

// return {
//   "uid": uuid.v4().toString(),
//   "downloadURL":
//       'https://scontent.cdninstagram.com/v/t66.30100-16/48706324_233024606123620_9082105079393261933_n.mp4?_nc_ht=scontent.cdninstagram.com&_nc_cat=104&_nc_ohc=hvnImHb4seUAX_zdOCk&edm=APs17CUBAAAA&ccb=7-5&oh=00_AfCM4kpfNqGerIix1hBdoTqqY_qrqXUwbZN2FRWF6cWhcw&oe=65510FEE&_nc_sid=10d13b',
//   "thumbnailURL":
//       "https://scontent.cdninstagram.com/v/t51.2885-15/391214095_269767875434181_7083522734383538253_n.jpg?stp=dst-jpg_e35_p1080x1080_sh0.08&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=55Ne2X7NpUcAX-XE3a8&edm=APs17CUBAAAA&ccb=7-5&oh=00_AfA-xmruIa55VxeO40c1gICuOWjlOrMymkzHZWFeIXrvXQ&oe=6550D617&_nc_sid=10d13b",
//   "fileType": "video",
//   "size": "6.25 MB",
//   "originalURL":
//       "https://www.instagram.com/p/CyQhFEqL424/?utm_source=ig_web_copy_link",
//   "site": "instagram",
//   "filename": '${uuid.v4()}.mp4',
//   "thumbnailFilename": "amd-16994556100917.jpg",
//   'progress': 0,
//   'taskId': '',
//   'filePath': '',
//   "status": 0,
//   "thumbnailPath": ""
// };
Future<Map<String, dynamic>> makeApiCall(String url) async {
  Map<String, String> queryParams = {'url': url};
  Uri uri =
      Uri.parse('$baseURL/api/download').replace(queryParameters: queryParams);
  try {
    var response = await http.get(uri);
    var jsonResponse = json.decode(response.body);
    return jsonResponse;
  } catch (err) {
    return {
      "status": "failed",
      "message": "failed with\n$err",
    };
  }
}
