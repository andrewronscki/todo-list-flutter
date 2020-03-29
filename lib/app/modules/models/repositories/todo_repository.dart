import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/app/modules/models/repositories/todo_repository_interface.dart';
import 'package:todo_list/app/modules/models/todo_model.dart';

class TodoRepository implements ITodoRepository {
  
  final Firestore firestore;
  
  TodoRepository(this.firestore);

  @override
  Stream<List<TodoModel>> getTodo() {
    return firestore.collection('todo').orderBy('position').snapshots().map((query) {
      return query.documents.map((doc) {
        return TodoModel.fromDocument(doc);
      }).toList();
    });
  }
  
  
}