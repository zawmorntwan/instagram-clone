import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     onPressed: () {},
    //     icon: const Icon(
    //       Icons.upload,
    //       color: ColorManager.primaryColor,
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post to'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Post',
              style: getSemiBoldTextStyle(
                color: ColorManager.blueColor,
                fontSize: FontSize.s16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1676734032797-21789f57978a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Write a caption...',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://plus.unsplash.com/premium_photo-1676734032797-21789f57978a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider()
            ],
          ),
        ],
      ),
    );
  }
}
