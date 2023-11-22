import 'package:ebook_reader/http/http_books.dart';
import 'package:ebook_reader/repositories/books_repository.dart';
import 'package:ebook_reader/stores/books_store.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget{
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage>{

  final BooksStore store = BooksStore(
    repository: BooksRepository(
      client: HttpClient(),
    ),
 );


  @override
  void initState() {
    super.initState();
    store.getBooksList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF85582C),
        title: const Text('Livros', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        body: AnimatedBuilder(
          animation: Listenable.merge([
            store.isLoading,
            store.error,
            store.state,
          ]), builder: (context, child) { 
            if(store.isLoading.value == true) {
              return const CircularProgressIndicator();
            }

            if(store.error.value.isNotEmpty) {
              return Center(
                child: Text(
                  store.error.value, style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              );
            }

            if(store.state.value.isEmpty) {
              return const Center (
                child: Text(
                  'Nenhum item na lista',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 32,
                ),
                padding: const EdgeInsets.all(16),
                itemCount: store.state.value.length,
                itemBuilder: (_, index) {
                  final item = store.state.value[index];
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          item.coverUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.author,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }
              );
            }
          },
        ),
    );
  }
}
