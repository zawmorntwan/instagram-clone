// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../widgets/loader.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          ImageAssets.appLogo,
          color: ColorManager.whiteColor,
          height: 32,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.messenger_outline,
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder:
            (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Loader(
                shape: LoaderShape.fadingCircle,
              ),
            );
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapShot.data!.docs.length,
            itemBuilder: (ctx, i) => PostCard(
              snap: snapShot.data!.docs[i].data(),
            ),
          );
        },
      ),
    );
  }
}
