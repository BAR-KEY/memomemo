import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: '메모의 제목을 적어주세요.',
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                TextField(
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: '메모할 내용을 적어주세요.',
                  ),
                ),
              ],
            )));
  }
}
