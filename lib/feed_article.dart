import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:instagram/data/user_data.dart';
import 'package:intl/intl.dart';

class FeedArticle extends StatefulWidget {
  final Post post;
  const FeedArticle({super.key, required this.post});

  @override
  State<FeedArticle> createState() => _FeedArticleState();
}

class _FeedArticleState extends State<FeedArticle> {
  PageController pageController = PageController();
  var isBookmarked = false;
  var isLiked = false;
  var showFullText = false;

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      setState(() {});
    });
    return Column(
      children: [
        Row(
          children: [
            ProfileImage(user: widget.post.poster),
            Text(
              widget.post.poster.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
          ],
        ),
        AspectRatio(
          aspectRatio: 1,
          child: PageView.builder(
            controller: pageController,
            itemBuilder: (context, index) {
              return Image.network(
                widget.post.content[index],
                fit: BoxFit.cover,
              );
            },
            itemCount: widget.post.content.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite_rounded : Feather.heart,
                      color: isLiked ? Colors.pink : null,
                    ),
                  ),
                  Transform.scale(
                      scaleX: -1,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Feather.message_circle))),
                  IconButton(onPressed: () {}, icon: Icon(Feather.send)),
                  Spacer(),
                  SizedBox(
                    height: 5,
                    child: ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, iteratorIndex) {
                          return Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                color: iteratorIndex == pageController.page
                                    ? Colors.blue
                                    : Colors.grey.shade300,
                                shape: BoxShape.circle),
                          );
                        },
                        separatorBuilder: (context, _) {
                          return SizedBox(
                            width: 4,
                          );
                        },
                        itemCount: 4),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isBookmarked = !isBookmarked;
                        });
                      },
                      icon: Icon(
                          !isBookmarked ? Feather.bookmark : Icons.bookmark)),
                ],
              ),
              SizedBox(
                height: widget.post.likes.length > 1 ? 4 : 0,
              ),
              Row(
                children: [
                  SizedBox(
                      height: 24,
                      width: 64,
                      child: Stack(
                        children: [
                          widget.post.likes.length > 3
                              ? Positioned(
                                  left: 32,
                                  child: ClipOval(
                                    child: Image.network(
                                      widget.post.likes[2].image,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          widget.post.likes.length > 2
                              ? Positioned(
                                  left: 16,
                                  child: ClipOval(
                                    child: Image.network(
                                      widget.post.likes[1].image,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          widget.post.likes.length > 1
                              ? Positioned(
                                  child: ClipOval(
                                    child: Image.network(
                                      widget.post.likes[0].image,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      )),
                  widget.post.likes.length > 1
                      ? Text(
                          "Liked by ${widget.post.likes[0].name} ${widget.post.likes.length > 1 ? "and ${widget.post.likes.length} others" : ""}")
                      : SizedBox(),
                ],
              ),
              SizedBox(
                height: widget.post.likes.length > 1 ? 8 : 0,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.post.poster.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const WidgetSpan(
                      child: SizedBox(
                        width: 8,
                      ),
                    ),
                    TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      text:
                          "${"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras pellentesque, est at molestie consectetur, lacus lectus congue augue, vel congue ipsum velit a odio. Pellentesque tempus augue nec ex tempus, et ultrices est semper. Phasellus euismod lorem ut mattis ornare. Sed vitae nibh at tortor rutrum pharetra at quis orci. Donec gravida at leo quis euismod. Sed ornare mollis ex sit amet fermentum. Praesent vitae justo id ex interdum bibendum vitae eleifend leo. ".substring(0, showFullText ? null : 120)}${showFullText ? "" : "..."}",
                    ),
                    const WidgetSpan(
                      child: SizedBox(
                        width: 8,
                      ),
                    ),
                    TextSpan(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        style: Theme.of(context).textTheme.button?.copyWith(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        text: showFullText ? "less" : "more",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              showFullText = !showFullText;
                            });
                          }),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text("View all ${userdata.length - 1} comments")),
              Row(
                children: [
                  ProfileImage(
                      user: widget.post.poster, showStoryStatus: false),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Add a comment"),
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Text("❤️"),
                  SizedBox(
                    width: 8,
                  ),
                  Text("🙌"),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(DateFormat("MMMM dd").format(DateTime.now())),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  final UserData user;
  final bool showStoryStatus;
  const ProfileImage(
      {super.key, required this.user, this.showStoryStatus = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(showStoryStatus ? 8 : 0),
      padding: EdgeInsets.all(showStoryStatus ? 2 : 0),
      decoration: BoxDecoration(
          color: user.hasActiveStory ? Colors.red : Colors.grey.shade300,
          shape: BoxShape.circle),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: BoxShape.circle),
        child: Container(
          margin: EdgeInsets.all(showStoryStatus ? 3 : 0),
          child: ClipOval(
            child: Image.network(
              user.image,
              height: 32,
              width: 32,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
