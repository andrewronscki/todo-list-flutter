import 'package:todo_list/app/modules/models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> getTodo();
}