import 'package:flutter/material.dart';
import 'package:memomemo/database/memo.dart';
import 'package:memomemo/database/db.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

@immutable
class EditPage extends StatelessWidget {
  EditPage({Key? key}) : super(key: key);
  String title = '';
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            IconButton(onPressed: saveDB, icon: const Icon(Icons.save)),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  onChanged: (String title) {
                    this.title = title;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    hintText: '메모의 제목을 적어주세요.',
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                TextField(
                  onChanged: (String text) {
                    this.text = text;
                  },
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: '메모할 내용을 적어주세요.',
                  ),
                ),
              ],
            )));
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = memo(
      id: Str25sha512(DateTime.now().toString()),
      title: title,
      text: text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(fido);

    print(await sd.memos());
  }
}

String Str25sha512(String text) {
  var bytes = utf8.encode(text); // data being hashed
  var digest = sha512.convert(bytes);
  return digest.toString();
}
