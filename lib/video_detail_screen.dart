import 'package:flutter/material.dart';

import 'video_model.dart';

class VideoDetailScreen extends StatelessWidget {
  final VideoModel video;
  const VideoDetailScreen({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Video Player',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(video.thumbnail, fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              Text(
                video.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // CHannel info (Avatar) and Subscribe button
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(video.avatar),
                  ), // for channel Dp
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${video.channel} • ${video.view}',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  // subscribe button (White Pill Shape)
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Subscribe",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Action Buttons (Like Dislike Share download)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(Icons.thumb_up_outlined, "12k"),
                    SizedBox(width: 8),
                    _buildActionButton(Icons.thumb_down_outlined, "Dislike"),
                    SizedBox(width: 8),
                    _buildActionButton(Icons.share_outlined, "Share"),
                    SizedBox(width: 8),
                    _buildActionButton(Icons.download, "Download"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // For Action Button Design banany ka liye Chota helper mean 'METHOD"
  Widget _buildActionButton(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 12),
          SizedBox(width: 6),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}
