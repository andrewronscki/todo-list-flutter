import 'package:mobx/mobx.dart';
import 'package:todo_list/app/modules/models/repositories/todo_repository_interface.dart';
import 'package:todo_list/app/modules/models/todo_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodoRepository repository;

  @observable
  ObservableStream<List<TodoModel>> todoList;

  _HomeControllerBase(ITodoRepository this.repository) {
    getList();
  }

  @action
  getList() {
    todoList = repository.getTodo().asObservable();
  }
}
