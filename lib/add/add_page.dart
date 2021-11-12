import 'package:flutter/material.dart';
import 'package:flutter_memo/add/add_model.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddModel>(
      create: (_) => AddModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('新規追加'),
        ),
        body: Consumer<AddModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              // ignore: deprecated_member_use
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: '追加するTODO',
                    hintText: 'ゴミを出す',
                  ),
                  onChanged: (text) {
                    model.todoText = text;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  child: const Text('追加する'),
                  onPressed: () async {
                    await model.add();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
