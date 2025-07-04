class DataItemClass {
  String userImage;
  String userPost;
  String userName;
  int postTime;
  String postDescription;

  DataItemClass(
   {
    required this.userImage,
    required this.userPost,this.userName='', this.postTime=0,  this.postDescription = '',
  });

  static List<DataItemClass> dataItemList = [
    DataItemClass(
        userImage: 'friend_three.jpg', userPost: 'friend_three_story.jpg',userName: 'Lionel Messi', postTime: 0, postDescription: 'this is description of this post'),
    DataItemClass(
        userImage: 'friend_four.jpg', userPost: 'friend_four_post.jpg',userName: 'Route', postTime: 8, postDescription: 'this is description of this post'),
    DataItemClass(
        userImage: 'friend_one.jpg', userPost: 'friend_one_story.jpg',userName: 'Mohamed Elsayed', postTime: 10, postDescription: 'this is description of this post'),
    DataItemClass(
        userImage: 'friend_two.jpg', userPost: 'friend_two_story.png',userName: 'goat', postTime: 7, postDescription: 'this is description of this post'),
    DataItemClass(
        userImage: 'friend_three.jpg', userPost: 'friend_three_story.jpg',userName: 'Lionel Messi', postTime: 5, postDescription: 'this is description of this post'),

  ];
}
