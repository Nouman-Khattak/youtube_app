import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_app/services/api_service.dart';
import 'package:youtube_app/video_model.dart';

//videoProvider ab hum use kare gyy ayy homeScreen ma thee hai kyu ka ab data yahaa hai isii variable ma store hai
final videoProvider = FutureProvider<List<VideoModel>>((ref) async {
  return ApiService().fetchVideos();
});

// final videoProvider = FutureProvider<List<VideoModel>>((ref)async{
//   return ApiService().fetchVideos();
// });
