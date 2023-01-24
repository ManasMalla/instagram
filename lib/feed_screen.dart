import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram/data/user_data.dart';
import 'package:instagram/feed_article.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StoryCarousel(),
            FeedCarousel(),
          ],
        ),
      ),
    );
  }
}

class FeedCarousel extends StatelessWidget {
  const FeedCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, feedIndex) {
          return FeedArticle(
            post: posts[feedIndex],
          );
        },
        primary: false,
        shrinkWrap: true,
        itemCount: posts.length);
  }
}

class StoryCarousel extends StatelessWidget {
  const StoryCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return StoryProfile(
              user: userdata[index],
            );
          },
          separatorBuilder: (context, _) {
            return SizedBox(
              width: 8,
            );
          },
          itemCount: userdata.length),
    );
  }
}

class StoryProfile extends StatelessWidget {
  final UserData user;
  const StoryProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: user.hasActiveStory ? Colors.red : Colors.grey.shade300,
              shape: BoxShape.circle),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle),
            child: Container(
              margin: EdgeInsets.all(3),
              child: ClipOval(
                child: Image.network(
                  user.image,
                  height: 54,
                  width: 54,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Text(
          user.name,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.color
                  ?.withOpacity(user.hasActiveStory ? 1 : 0.3)),
        )
      ],
    );
  }
}
