import 'package:ebook_reader/pages/books_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bem Vindo(a)!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFF85582C),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 30)),
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/logotipo.png'),
            ),
            const SizedBox(height: 20),
            Container(
              width: 350,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF85582C),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Bem-vindo(a) ao eBook Reader, o aplicativo para a leitura on-line de seus livros preferidos.',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 100)), 
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => const BooksPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF85582C),
                padding: const EdgeInsets.all(16),
                minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
              ),
              child: const Text('Começe a Ler', style: TextStyle(color: Colors.white, fontSize:18, fontWeight: FontWeight.bold )),
            ),
          ],
        ),
      ),
    );
  }
}
