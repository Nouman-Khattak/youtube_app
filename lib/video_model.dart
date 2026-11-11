class VideoModel {
  final String title;
  final String channel;
  final String view;
  final String time;
  final String duration;
  final String thumbnail;
  final String avatar;
  VideoModel({
    required this.title,
    required this.channel,
    required this.view,
    required this.time,
    required this.duration,
    required this.thumbnail,
    required this.avatar,
  });
  // server sy data ayaa json form ma , ab yeh method usko samjy gy dart ko samjany ka isko hum factory constructor kahta hai
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    int id = json['id'] ?? 1;
    return VideoModel(
      title: json['title'] ?? 'YouTube Video',
      channel: 'Channel $id • Tech Studio',
      view: '${id * 85}K views',
      time: '$id days ago',
      duration: '${id * 2}:${id * 5}',
      thumbnail: 'https://picsum.photos/seed/$id/600/340',
      avatar: 'https://i.pravatar.cc/150?img=$id',
    );
  }
}
