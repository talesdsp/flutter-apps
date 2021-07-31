class Post {
  const Post({
    this.name,
    this.avatar,
    this.imageUrl,
    this.text,
    this.comments,
  });

  final String name;
  final String avatar;
  final String imageUrl;
  final String text;
  final List<Comment> comments;
}

List<Post> posts = [
  Post(
    name: "Emanuel Campbell",
    imageUrl: 'assets/images/venice.jpg',
    text: "The best day of my life",
    comments: comments,
  ),
  Post(
    name: "Maria Esteves",
    imageUrl: "assets/images/gondola.jpg",
    text: "#tbt",
    comments: comments,
  ),
  Post(
    name: "Kristi Johansen",
    imageUrl: 'assets/images/santorini.jpg',
    text: "Shot on my phone",
    comments: comments,
  ),
];

class Comment {
  final String name;
  final String text;
  final String imageUrl;

  const Comment({this.name, this.text, this.imageUrl});
}

const List<Comment> comments = [
  Comment(
    name: 'Karen',
    text: "Greeeeeat",
    imageUrl: "assets/images/venice.jpg",
  ),
  Comment(
    name: 'Carla',
    text: "s2",
    imageUrl: "assets/images/venice.jpg",
  ),
  Comment(
    name: 'Matthew',
    text: "Awesome photo!",
    imageUrl: "assets/images/venice.jpg",
  ),
  Comment(
    name: 'Gonalons',
    text: "Wow!",
    imageUrl: "assets/images/venice.jpg",
  ),
  Comment(
    name: 'spammer',
    text:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consequat interdum varius sit amet. Tincidunt augue interdum velit euismod in pellentesque. Ipsum dolor sit amet consectetur adipiscing elit. In iaculis nunc sed augue lacus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna. Urna neque viverra justo nec. Mollis aliquam ut porttitor leo a diam. Iaculis eu non diam phasellus vestibulum lorem. Purus faucibus ornare suspendisse sed nisi. Est ante in nibh mauris cursus mattis. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Ac auctor augue mauris augue neque gravida. Tellus in metus vulputate eu. Ut lectus arcu bibendum at varius. Ac ut consequat semper viverra nam libero justo. Nibh mauris cursus mattis molestie a. Massa vitae tortor condimentum lacinia quis vel eros donec ac. Semper auctor neque vitae tempus quam pellentesque nec nam. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Mauris augue neque gravida in fermentum. Tellus elementum sagittis vitae et leo duis ut. At lectus urna duis convallis convallis tellus id. Mollis aliquam ut porttitor leo a diam sollicitudin tempor.",
    imageUrl: "assets/images/venice.jpg",
  ),
  Comment(
    name: 'spammer',
    text:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consequat interdum varius sit amet. Tincidunt augue interdum velit euismod in pellentesque. Ipsum dolor sit amet consectetur adipiscing elit. In iaculis nunc sed augue lacus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna. Urna neque viverra justo nec. Mollis aliquam ut porttitor leo a diam. Iaculis eu non diam phasellus vestibulum lorem. Purus faucibus ornare suspendisse sed nisi. Est ante in nibh mauris cursus mattis. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Ac auctor augue mauris augue neque gravida. Tellus in metus vulputate eu. Ut lectus arcu bibendum at varius. Ac ut consequat semper viverra nam libero justo. Nibh mauris cursus mattis molestie a. Massa vitae tortor condimentum lacinia quis vel eros donec ac. Semper auctor neque vitae tempus quam pellentesque nec nam. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Mauris augue neque gravida in fermentum. Tellus elementum sagittis vitae et leo duis ut. At lectus urna duis convallis convallis tellus id. Mollis aliquam ut porttitor leo a diam sollicitudin tempor.",
    imageUrl: "assets/images/venice.jpg",
  ),
  Comment(
    name: 'spammer',
    text:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consequat interdum varius sit amet. Tincidunt augue interdum velit euismod in pellentesque. Ipsum dolor sit amet consectetur adipiscing elit. In iaculis nunc sed augue lacus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna. Urna neque viverra justo nec. Mollis aliquam ut porttitor leo a diam. Iaculis eu non diam phasellus vestibulum lorem. Purus faucibus ornare suspendisse sed nisi. Est ante in nibh mauris cursus mattis. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Ac auctor augue mauris augue neque gravida. Tellus in metus vulputate eu. Ut lectus arcu bibendum at varius. Ac ut consequat semper viverra nam libero justo. Nibh mauris cursus mattis molestie a. Massa vitae tortor condimentum lacinia quis vel eros donec ac. Semper auctor neque vitae tempus quam pellentesque nec nam. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Mauris augue neque gravida in fermentum. Tellus elementum sagittis vitae et leo duis ut. At lectus urna duis convallis convallis tellus id. Mollis aliquam ut porttitor leo a diam sollicitudin tempor.",
    imageUrl: "assets/images/venice.jpg",
  ),
  Comment(
    name: 'spammer',
    text:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consequat interdum varius sit amet. Tincidunt augue interdum velit euismod in pellentesque. Ipsum dolor sit amet consectetur adipiscing elit. In iaculis nunc sed augue lacus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna. Urna neque viverra justo nec. Mollis aliquam ut porttitor leo a diam. Iaculis eu non diam phasellus vestibulum lorem. Purus faucibus ornare suspendisse sed nisi. Est ante in nibh mauris cursus mattis. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Ac auctor augue mauris augue neque gravida. Tellus in metus vulputate eu. Ut lectus arcu bibendum at varius. Ac ut consequat semper viverra nam libero justo. Nibh mauris cursus mattis molestie a. Massa vitae tortor condimentum lacinia quis vel eros donec ac. Semper auctor neque vitae tempus quam pellentesque nec nam. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Mauris augue neque gravida in fermentum. Tellus elementum sagittis vitae et leo duis ut. At lectus urna duis convallis convallis tellus id. Mollis aliquam ut porttitor leo a diam sollicitudin tempor.",
    imageUrl: "assets/images/venice.jpg",
  ),
  Comment(
    name: 'spammer',
    text:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consequat interdum varius sit amet. Tincidunt augue interdum velit euismod in pellentesque. Ipsum dolor sit amet consectetur adipiscing elit. In iaculis nunc sed augue lacus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna. Urna neque viverra justo nec. Mollis aliquam ut porttitor leo a diam. Iaculis eu non diam phasellus vestibulum lorem. Purus faucibus ornare suspendisse sed nisi. Est ante in nibh mauris cursus mattis. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Ac auctor augue mauris augue neque gravida. Tellus in metus vulputate eu. Ut lectus arcu bibendum at varius. Ac ut consequat semper viverra nam libero justo. Nibh mauris cursus mattis molestie a. Massa vitae tortor condimentum lacinia quis vel eros donec ac. Semper auctor neque vitae tempus quam pellentesque nec nam. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Mauris augue neque gravida in fermentum. Tellus elementum sagittis vitae et leo duis ut. At lectus urna duis convallis convallis tellus id. Mollis aliquam ut porttitor leo a diam sollicitudin tempor.",
    imageUrl: "assets/images/venice.jpg",
  ),
  Comment(
    name: 'spammer',
    text:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consequat interdum varius sit amet. Tincidunt augue interdum velit euismod in pellentesque. Ipsum dolor sit amet consectetur adipiscing elit. In iaculis nunc sed augue lacus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna. Urna neque viverra justo nec. Mollis aliquam ut porttitor leo a diam. Iaculis eu non diam phasellus vestibulum lorem. Purus faucibus ornare suspendisse sed nisi. Est ante in nibh mauris cursus mattis. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Ac auctor augue mauris augue neque gravida. Tellus in metus vulputate eu. Ut lectus arcu bibendum at varius. Ac ut consequat semper viverra nam libero justo. Nibh mauris cursus mattis molestie a. Massa vitae tortor condimentum lacinia quis vel eros donec ac. Semper auctor neque vitae tempus quam pellentesque nec nam. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Mauris augue neque gravida in fermentum. Tellus elementum sagittis vitae et leo duis ut. At lectus urna duis convallis convallis tellus id. Mollis aliquam ut porttitor leo a diam sollicitudin tempor.",
    imageUrl: "assets/images/venice.jpg",
  ),
  Comment(
    name: 'spammer',
    text:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consequat interdum varius sit amet. Tincidunt augue interdum velit euismod in pellentesque. Ipsum dolor sit amet consectetur adipiscing elit. In iaculis nunc sed augue lacus. Accumsan sit amet nulla facilisi morbi tempus iaculis urna. Urna neque viverra justo nec. Mollis aliquam ut porttitor leo a diam. Iaculis eu non diam phasellus vestibulum lorem. Purus faucibus ornare suspendisse sed nisi. Est ante in nibh mauris cursus mattis. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Ac auctor augue mauris augue neque gravida. Tellus in metus vulputate eu. Ut lectus arcu bibendum at varius. Ac ut consequat semper viverra nam libero justo. Nibh mauris cursus mattis molestie a. Massa vitae tortor condimentum lacinia quis vel eros donec ac. Semper auctor neque vitae tempus quam pellentesque nec nam. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Aliquet sagittis id consectetur purus ut faucibus pulvinar elementum. Mauris augue neque gravida in fermentum. Tellus elementum sagittis vitae et leo duis ut. At lectus urna duis convallis convallis tellus id. Mollis aliquam ut porttitor leo a diam sollicitudin tempor.",
    imageUrl: "assets/images/venice.jpg",
  ),
];
