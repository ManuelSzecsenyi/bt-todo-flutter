import 'package:uuid/uuid.dart';

class Todo {
  final Uuid id;
  final String text;
  final bool done;

  Todo(this.id, this.text, this.done);
}