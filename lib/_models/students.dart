import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String name;
  final String matNumber;

  Student({required this.name, required this.matNumber});

  factory Student.fromSnapshot(DocumentSnapshot snapshot) {
    var doc = snapshot.data() as dynamic;
    return Student(name: doc['name'], matNumber: doc["matNumber"]);
  }
}
