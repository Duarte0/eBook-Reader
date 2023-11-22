import 'package:ebook_reader/http/exceptions.dart';
import 'package:ebook_reader/models/books_list.dart';
import 'package:ebook_reader/repositories/books_repository.dart';
import 'package:flutter/cupertino.dart';

class BooksStore{
  final EBooksRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<BookListModel>> state = ValueNotifier<List<BookListModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  BooksStore({required this.repository});

  Future getBooksList() async {
    isLoading.value = true;

    try {
      final result = await repository.getBooksList();
      state.value = result;
    } on NotFoundException catch (e) {
      error.value = e.message;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}