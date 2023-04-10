import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../services/firestore_services.dart';
import '../widgets/comment_card.dart';
import '../widgets/loader.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({
    super.key,
    required this.snap,
  });

  final snap;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.mobileBackgroundColor,
        title: const Text('Comments'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(widget.snap['postId'])
            .collection('comments')
            .orderBy(
              'datePublished',
              descending: false,
            )
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Loader(),
            );
          } else if (snapshot.data.docs.length == 0) {
            return Center(
              child: Text(
                'No comments',
                style: getRegularTextStyle(
                  color: ColorManager.secondaryColor,
                ),
              ),
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (ctx, i) => CommentCard(
                snap: snapshot.data.docs[i].data(),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  user!.photoUrl,
                ),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 8.0,
                  ),
                  child: TextField(
                    controller: _commentController,
                    style: getRegularTextStyle(
                      color: ColorManager.whiteColor,
                      fontSize: FontSize.s14,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Comment as ${user.userName}',
                      hintStyle: getRegularTextStyle(
                        color: ColorManager.greyColor,
                        fontSize: FontSize.s14,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (_commentController.text.isNotEmpty) {
                    await FirestoreServices().postComment(
                      postId: widget.snap['postId'],
                      text: _commentController.text,
                      uId: user.uId,
                      userName: user.userName,
                      profilePic: user.photoUrl,
                    );
                    setState(() {
                      _commentController.text = '';
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  child: Text(
                    'Post',
                    style: getSemiBoldTextStyle(
                      color: ColorManager.blueColor,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
