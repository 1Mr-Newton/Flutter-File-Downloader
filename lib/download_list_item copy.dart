// // ignore_for_file: prefer_const_constructors

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:downloadmanager/custom_snackbar.dart';
// import 'package:downloadmanager/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';

// class DownloadListItem extends StatelessWidget {
//   const DownloadListItem({
//     super.key,
//     this.data,
//     this.onTap,
//     this.onActionTap,
//     this.onCancel,
//   });

//   final ItemHolder? data;
//   final void Function(TaskInfo?)? onTap;
//   final void Function(TaskInfo)? onActionTap;
//   final void Function(TaskInfo)? onCancel;

//   Widget? _buildTrailing(TaskInfo task) {
//     if (task.status == DownloadTaskStatus.undefined ||
//         task.status == DownloadTaskStatus.failed &&
//             task.progress!.toInt() < 100) {
//       onActionTap?.call(task);
//     }
//     if (task.status == DownloadTaskStatus.undefined) {
//       return IconButton(
//         onPressed: () => onActionTap?.call(task),
//         constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//         icon: const Icon(Icons.file_download),
//         tooltip: 'Start',
//       );
//     } else if (task.status == DownloadTaskStatus.running) {
//       return Row(
//         children: [
//           Text('${task.progress}%'),
//           IconButton(
//             onPressed: () => onActionTap?.call(task),
//             constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//             icon: const Icon(Icons.pause, color: Colors.yellow),
//             tooltip: 'Pause',
//           ),
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.paused) {
//       return Row(
//         children: [
//           Text('${task.progress}%'),
//           IconButton(
//             onPressed: () => onActionTap?.call(task),
//             constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//             icon: const Icon(Icons.play_arrow, color: Colors.green),
//             tooltip: 'Resume',
//           ),
//           if (onCancel != null)
//             IconButton(
//               onPressed: () => onCancel?.call(task),
//               constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//               icon: const Icon(Icons.cancel, color: Colors.red),
//               tooltip: 'Cancel',
//             ),
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.complete) {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           const Text('Ready', style: TextStyle(color: Colors.green)),
//           IconButton(
//             onPressed: () => onActionTap?.call(task),
//             constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//             icon: const Icon(Icons.delete),
//             tooltip: 'Delete',
//           )
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.canceled) {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           const Text('Canceled', style: TextStyle(color: Colors.red)),
//           if (onActionTap != null)
//             IconButton(
//               onPressed: () => onActionTap?.call(task),
//               constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//               icon: const Icon(Icons.cancel),
//               tooltip: 'Cancel',
//             )
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.failed) {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           const Text('Failed', style: TextStyle(color: Colors.red)),
//           IconButton(
//             onPressed: () => onActionTap?.call(task),
//             constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
//             icon: const Icon(Icons.refresh, color: Colors.green),
//             tooltip: 'Refresh',
//           )
//         ],
//       );
//     } else if (task.status == DownloadTaskStatus.enqueued) {
//       return const Text('Pending', style: TextStyle(color: Colors.orange));
//     } else {
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         margin: EdgeInsets.only(bottom: 10),
//         height: 150,
//         padding: const EdgeInsets.only(left: 16, right: 8),
//         child: Column(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: InkWell(
//                       onTap: data!.task!.status == DownloadTaskStatus.complete
//                           ? () {
//                               onTap!(data!.task);
//                             }
//                           : () {
//                               CustomSnackbar(
//                                   context: context,
//                                   message: "Download not completed!");
//                             },
//                       child: SizedBox(
//                         height: 145,
//                         child: AspectRatio(
//                           aspectRatio: 1,
//                           child: CachedNetworkImage(
//                               fit: BoxFit.cover,
//                               imageUrl: data!.thumbnailURL!,
//                               placeholder: (context, url) => Icon(Icons.image),
//                               errorWidget: (c, u, e) => Icon(Icons.error)),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             data!.name!,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           _buildTrailing(data!.task!)!,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     data!.size!,
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Icon(
//                                     data!.fileType! == 'video'
//                                         ? Icons.videocam
//                                         : Icons.image,
//                                     size: 18,
//                                   ),
//                                 ],
//                               ),
//                               Image(
//                                 image: AssetImage(
//                                   'assets/icons/${data!.site}.png',
//                                 ),
//                                 fit: BoxFit.cover,
//                                 height: 25,
//                                 width: 25,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 5,
//               child: LinearProgressIndicator(
//                 value: data!.task!.progress! / 100,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
