import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    this.documentReference = (doc.reference as dynamic);
    this.title = (doc.data() as dynamic)['title'];

    final Timestamp timestamp = (doc.data() as dynamic)['createdAt'];
    this.createdAt = timestamp.toDate();
  }
  late String title;
  late DateTime createdAt;
  late bool isDone = false;
  late DocumentReference documentReference;
}
