class EndPoints {
  ///BASE URL
  static const String baseUrl = 'http://192.168.1.22:8080';

  ///Auth
  static const login = '/auth/login';
  static const register = '/auth/register';

  ///Post
  static const allPosts =
      '/post/get-posts/'; // pass User ID as parameter, not as query
  static const createPost = '/post/create-post';
  static const deletePost =
      '/post/delete/'; // pass User ID as parameter, not as query

  ///User
  static const myProfile = '/user/me';
  static const updateUserName = '/user/update-user-name';
  static const updateUserImage = '/user/update-image';

  ///Image
  static const image = '/image/'; // pass Object ID as parameter, not as query
}
