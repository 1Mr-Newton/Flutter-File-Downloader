// class DownloadItems {
//   static const items = [
//     DownloadItem(
//       name: 'DeathValleyNationalPark.jpg',
//       url:
//           'https://upload.wikimedia.org/wikipedia/commons/b/b2/Sand_Dunes_in_Death_Valley_National_Park.jpg',
//     ),
//   ];
// }

class MyConstants {
  Map<String, String> headers = {
    "accept": "*/*",
    "accept-language": "en-US,en;q=0.9",
    "cache-control": "no-cache",
    "content-type": "application/x-www-form-urlencoded",
    "dpr": "1",
    "pragma": "no-cache",
    "sec-ch-prefers-color-scheme": "dark",
    "sec-ch-ua":
        '"Google Chrome";v="117", "Not;A=Brand";v="8", "Chromium";v="117"',
    "sec-ch-ua-full-version-list":
        '"Google Chrome";v="117.0.5938.132", "Not;A=Brand";v="8.0.0.0", "Chromium";v="117.0.5938.132"',
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-model": '""',
    "sec-ch-ua-platform": '"Windows"',
    "sec-ch-ua-platform-version": '"15.0.0"',
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-origin",
    "viewport-width": "1920",
    "x-asbd-id": "129477",
    "x-csrftoken": "RFFddOArFGt4qw3UmzrjJT9DZg8UF7lv",
    "x-ig-app-id": "936619743392459",
    "x-ig-www-claim": "0",
    "x-instagram-ajax": "1009030818",
    "x-requested-with": "XMLHttpRequest",
    "Referer": "https://www.instagram.com/",
    "Referrer-Policy": "strict-origin-when-cross-origin",
    "User-Agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36",
  };
}

// class DownloadItem {
//   const DownloadItem({required this.name, required this.url});

//   final String name;
//   final String url;
// }

class DownloadResponseObject {
  final String uid;
  final String downloadURL;
  final String thumbnailURL;
  final String fileType;
  final String size;
  final String originalURL;
  final String site;
  final String filename;
  final String thumbnailFilename;
  final int progress;
  final String? taskId;
  final String? filePath;
  final int status;
  final String? thumbnailPath;

  const DownloadResponseObject({
    required this.uid,
    required this.downloadURL,
    required this.thumbnailURL,
    required this.fileType,
    required this.size,
    required this.originalURL,
    required this.site,
    required this.filename,
    required this.thumbnailFilename,
    required this.progress,
    required this.taskId,
    required this.filePath,
    required this.status,
    required this.thumbnailPath,
  });

  DownloadResponseObject.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        downloadURL = map['downloadURL'],
        thumbnailURL = map['thumbnailURL'],
        fileType = map['fileType'],
        size = map['size'],
        originalURL = map['originalURL'],
        site = map['site'],
        filename = map['filename'],
        thumbnailFilename = map['thumbnailFilename'],
        progress = map['progress'],
        taskId = map['taskId'],
        filePath = map['filePath'],
        status = map['status'],
        thumbnailPath = map['thumbnailPath'];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'downloadURL': downloadURL,
      'thumbnailURL': thumbnailURL,
      'fileType': fileType,
      'size': size,
      'originalURL': originalURL,
      'site': site,
      'filename': filename,
      'thumbnailFilename': thumbnailFilename,
      'progress': progress,
      'taskId': taskId,
      'filePath': filePath,
      'thumbnailPath': thumbnailPath,
      'status': status,
    };
  }
}
