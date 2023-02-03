import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children: [
        PhotoView(imageProvider: const AssetImage('images/ISP/1.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/2.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/3.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/4.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/5.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/6.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/7.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/8.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/9.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/10.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/11.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/12.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/13.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/14.jpg')),
        PhotoView(imageProvider: const AssetImage('images/ISP/15.jpg')),
      ],
    );
  }
}
