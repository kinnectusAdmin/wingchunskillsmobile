class WebRequest {
  String path = '';
  static const baseURL = 'https://wingchunskills.herokuapp.com/api';
  static const siteURL = 'https://wingchunskills.herokuapp.com/api';
  
  Uri url() {
    return Uri.parse(path);
  }
  WebRequest(this.path);
  
  WebRequest.uploadImage() {
    path = baseURL + '/image/post';
  }
  WebRequest.login() {
    path = siteURL + '/login';
  }
  WebRequest.updateUser(String id) {
    path = baseURL + '/users/$id';
  }
  WebRequest.fetchUser(String email) {
    path = baseURL + '/users?email=$email';
  }
  WebRequest.fetchLessons(int courseId) {
    path = baseURL + '/lessons/$courseId';
  }
  WebRequest.fetchCourses() {
    path = baseURL + '/courses';
  }
  WebRequest.fetchComments(int lessonId) {
    path = baseURL + '/comments/$lessonId';
  }
  WebRequest.addComment() {
    path = baseURL + '/comments';
  }
  WebRequest.deleteAccount(String id) {
    path = baseURL + '/users?=$id';
  }
}
