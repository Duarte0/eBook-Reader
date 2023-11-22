

class BookListModel {
  final int id;
  final String title;
  final String author;
  final String coverUrl;

  BookListModel({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
  });

  factory BookListModel.fromMap(Map<String, dynamic> map) {
    
    return BookListModel(
      id: map['id'],
      title: map['title'], 
      author: map['author'], 
      coverUrl: map['coverUrl'],
      );
  }
}



