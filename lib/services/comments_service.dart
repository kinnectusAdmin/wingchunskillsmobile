import '../models/comment.dart';

Future<List<Comment>> fetchComments(String lessonId) async {
  String img = 'https://gravatar.com/avatar/6696fec740bd671f86cf3af7130c41c2?s=400&d=robohash&r=x';
  String img2 = 'https://images.pexels.com/photos/1832323/pexels-photo-1832323.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500';
  return [
    Comment('Some comment ...', 'Blake', img2),
    Comment('Some comment ...', 'Blake', img2),
    Comment('Some comment ...', 'Blake', img2),
    Comment('Some comment ...', 'Blake', img2)
  ];
}

Future<List<Comment>> observeComments(String lessonID) async {
    
    return [];
}
void addComment(String comment) {

}