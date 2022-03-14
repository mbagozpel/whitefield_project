import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  String id;
  String projectTopic;
  String noOfStudents;
  String supervisor;
  String projectType;
  String studentsRemaining;
  String supervisorEmail;
  String supervisorNumber;

  Project(
      {required this.projectType,
      required this.id,
      required this.projectTopic,
      required this.noOfStudents,
      required this.supervisorEmail,
      required this.supervisorNumber,
      required this.studentsRemaining,
      required this.supervisor});

  factory Project.fromSnapshot(DocumentSnapshot snapshot) {
    var doc = snapshot.data() as dynamic;
    return Project(
        id: doc['id'] ?? '',
        supervisorEmail: doc['supervisorEmail'] ?? '',
        supervisorNumber: doc['supervisorNumber'] ?? '',
        studentsRemaining: doc['studentsRemaining'] ?? '',
        projectTopic: doc['projectTopic'] ?? '',
        projectType: doc['projectType'] ?? '',
        noOfStudents: doc['noOfStudents'] ?? '',
        supervisor: doc['supervisor'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      "supervisorEmail": supervisorEmail,
      "supervisor": supervisor,
      "supervisorNumber": supervisorNumber,
      "studentsRemaining": studentsRemaining,
      "projectTopic": projectTopic,
      "noOfStudents": noOfStudents,
      "projectType": projectType,
      "id": id
    };
  }
}

List<Project> projects = [
  Project(
      id: '',
      supervisorEmail: 'asdfasdfadf',
      supervisorNumber: 'asdfasdfasdf',
      studentsRemaining: '1',
      projectType: '',
      projectTopic:
          "Design and Construction of an Automatic Intruder Alarm System",
      noOfStudents: "1",
      supervisor: "Engr. Dr. Bruce"),
  Project(
      id: '',
      supervisorEmail: 'asdfasdfadf',
      supervisorNumber: 'asdfasdfasdf',
      studentsRemaining: '1',
      projectType: '',
      projectTopic:
          "Design and Construction of a Charging System for Mobile Devices",
      noOfStudents: "1",
      supervisor: "Engr. Dr. Bruce"),
];
