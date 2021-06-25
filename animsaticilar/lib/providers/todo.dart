import 'package:flutter/foundation.dart';
import 'package:animsaticilar/db_helper.dart';
import 'package:animsaticilar/todo_model.dart';

class Todos with ChangeNotifier {
  List<TodoModel> _items = [];

  List<TodoModel> get items {
    return [..._items];
  }

  TodoModel findById(String id) {
    return _items.firstWhere((todo) => todo.id == id);
  }

  void update(String todoId, editedData) {
    TodoModel todoData = findById(todoId);

    if (todoData.id.isEmpty) {
    } else {
      notifyListeners();
      DBHelper.update('Kullanıcı Anımsatıcısı', editedData);
    }
  }

  void addTodo(String content) async {
    final newTodo = TodoModel(
      id: DateTime.now().toString(),
      content: content,
      timeStamp: DateTime.now().toIso8601String(),
    );

    _items.add(newTodo);

    notifyListeners();
    print(_items.length);
    DBHelper.insert('Kullanıcı Anımsatıcısı', {
      'ID': newTodo.id,
      'Icerık': newTodo.content,
      'Zaman': newTodo.timeStamp
    });
  }

  Future<void> fetchAndSetTodos() async {
    final dataList = await DBHelper.getData('Kullanıcı Anımsatıcısı');
    _items = dataList
        .map(
          (item) => TodoModel(
        id: item['ID'],
        content: item['Icerık'],
        timeStamp: item['Zaman'],
      ),
    )
        .toList();
    notifyListeners();
  }

  Future<void> removeTodo(String id) async {
    _items.removeWhere((todo) => todo.id == id);
    notifyListeners();
    DBHelper.delete('Kullanıcı Anımsatıcısı', id);
  }
}