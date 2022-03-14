import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whitefiled/_models/project.dart';

class FirebaseDB {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<DocumentReference> addProject({required Project project}) async {
    return await _db.collection('projects').add(project.toMap());
  }

  Future<QuerySnapshot> getProjects() async {
    return await _db.collection('projects').get();
  }

  Future getProject(String projectId) async {
    return await _db.collection('projects').doc(projectId).get();
  }

  Future<QuerySnapshot> getStudents() async {
    return await _db.collection('students').get();
  }

  Future updatedProject(String projectId, Project project) async {
    return await _db
        .collection('projects')
        .doc(projectId)
        .update(project.toMap());
  }
}
