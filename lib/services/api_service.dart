import 'package:dio/dio.dart';
import 'package:youtube_app/video_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      // BASEURL is main address of website
      // jasonHolder is testing server
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      responseType: ResponseType.json,
    ),
  );
  // Constructor: in console showing requests and responsesing
  ApiService() {
    _dio.interceptors.add(
      LogInterceptor(
        // yeh sub chhexy terminal ma show hogii
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
  }
  // for videos fetching
  Future<List<VideoModel>> fetchVideos() async {
    try {
      final response = await _dio.get("/posts");
      if (response.statusCode == 200) {
        //response.data ma data paraa haii uskoo humny rawList ma layaa,dynamic is liye use kiya kyu ka data ka pataa nahi int hai String hai Bool hia
        List<dynamic> rawList = response.data;
        //clean mapping
        List<VideoModel> videos = rawList.take(10).map((item) {
          return VideoModel.fromJson(item);
        }).toList();
        return videos;
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Internet issue: ${e.message}');
    } catch (e) {
      throw Exception('Masla aya: $e');
    }
  }
}
