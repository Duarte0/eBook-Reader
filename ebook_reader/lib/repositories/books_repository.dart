

import 'dart:convert';

import 'package:ebook_reader/http/exceptions.dart';
import 'package:ebook_reader/http/http_books.dart';
import 'package:ebook_reader/models/books_list.dart';

abstract class EBooksRepository{
  Future<List<BookListModel>>getBooksList();
}

class BooksRepository implements EBooksRepository{

final IHttpClient client;

BooksRepository({required this.client});

  @override
  Future<List<BookListModel>> getBooksList() async{

    final response = await client.get(url: 'https://escribo.com/books.json');

    if(response.statusCode == 200) {
      final List<BookListModel> books = [];

      final body = jsonDecode(response.body);

      body[body].map((item) {
        final BookListModel booklist = BookListModel.fromMap(item);
        books.add(booklist);
      }).toList();

      return books;
    } else if(response.statusCode == 404) {
        throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os livros ');
    }
  }

}