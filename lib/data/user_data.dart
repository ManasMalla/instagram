class UserData {
  final String name;
  final String image;
  final bool hasActiveStory;

  const UserData(
      {required this.name, required this.image, required this.hasActiveStory});
}

class Post {
  final UserData poster;
  final List<String> content;
  final List<UserData> likes;
  final List<UserData> comments;

  Post(
      {required this.poster,
      required this.content,
      this.likes = const [],
      this.comments = const []});
}

var posts = [
  Post(poster: userdata[2], content: [
    "https://media-exp1.licdn.com/dms/image/D5612AQExBMHSXooo8Q/article-cover_image-shrink_600_2000/0/1668689143108?e=2147483647&v=beta&t=6qC5VbdYvJLelM8sFnSJdPnXKAkCl4a3NcH82eekQUM",
    "https://pbs.twimg.com/media/FhN34J1akAAIyrY.jpg",
    "https://pbs.twimg.com/media/FhVAEogaUAAe_IG.jpg",
    "https://pbs.twimg.com/media/FhN6DCQaUAAs9XP.jpg",
  ], likes: [
    userdata[0],
    userdata[1],
    userdata[4]
  ], comments: [
    userdata[3],
    userdata[5],
    userdata[6]
  ]),
  Post(poster: userdata[1], content: [
    "https://pbs.twimg.com/media/FhN34J1akAAIyrY.jpg",
    "https://media-exp1.licdn.com/dms/image/D5612AQExBMHSXooo8Q/article-cover_image-shrink_600_2000/0/1668689143108?e=2147483647&v=beta&t=6qC5VbdYvJLelM8sFnSJdPnXKAkCl4a3NcH82eekQUM",
    "https://pbs.twimg.com/media/FhVAEogaUAAe_IG.jpg",
    "https://pbs.twimg.com/media/FhN6DCQaUAAs9XP.jpg",
  ]),
  Post(poster: userdata[5], content: [
    "https://pbs.twimg.com/media/FhVAEogaUAAe_IG.jpg",
    "https://media-exp1.licdn.com/dms/image/D5612AQExBMHSXooo8Q/article-cover_image-shrink_600_2000/0/1668689143108?e=2147483647&v=beta&t=6qC5VbdYvJLelM8sFnSJdPnXKAkCl4a3NcH82eekQUM",
    "https://pbs.twimg.com/media/FhN34J1akAAIyrY.jpg",
    "https://pbs.twimg.com/media/FhN6DCQaUAAs9XP.jpg",
  ]),
  Post(poster: userdata[7], content: [
    "https://pbs.twimg.com/media/FhN6DCQaUAAs9XP.jpg",
    "https://media-exp1.licdn.com/dms/image/D5612AQExBMHSXooo8Q/article-cover_image-shrink_600_2000/0/1668689143108?e=2147483647&v=beta&t=6qC5VbdYvJLelM8sFnSJdPnXKAkCl4a3NcH82eekQUM",
    "https://pbs.twimg.com/media/FhN34J1akAAIyrY.jpg",
    "https://pbs.twimg.com/media/FhVAEogaUAAe_IG.jpg",
  ]),
];

var userdata = const [
  UserData(
    name: "manas_malla",
    image: "https://avatars.githubusercontent.com/u/38750492?v=4",
    hasActiveStory: true,
  ),
  UserData(
    name: "bala_vemulakonda",
    image: "https://raw.githubusercontent.com/ManasMalla/WhatsApp/main/app/src/main/res/drawable/bala_tripura_sundari_vemulakonda.jpg",
    hasActiveStory: true,
  ),
  UserData(
    name: "sundar_pichai",
    image:
        "https://static.toiimg.com/thumb/resizemode-4,msid-72377199,width-1200,height-900/72377199.jpg",
    hasActiveStory: false,
  ),
  UserData(
    name: "srindhi_chitti",
    image:
        "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/nidhi.jpg",
    hasActiveStory: false,
  ),
  UserData(
    name: "lochan_m",
    image:
        "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/lochan.jpg",
    hasActiveStory: false,
  ),
  UserData(
    name: "gee.tika_",
    image:
        "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/geetika.jpg",
    hasActiveStory: false,
  ),
  UserData(
    name: "mohan_satya",
    image:
        "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/mohan.jpg",
    hasActiveStory: false,
  ),
  UserData(
    name: "satwik_varma",
    image:
        "https://raw.githubusercontent.com/sreetejadusi/ig-data-repo/main/satwik.jpeg",
    hasActiveStory: false,
  ),
];
