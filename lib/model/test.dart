import 'dart:convert';

import 'package:flutter/foundation.dart';

class TestList {
  final List<Test> testlist;
  TestList({
    this.testlist,
  });

  TestList copyWith({
    List<Test> testlist,
  }) {
    return TestList(
      testlist: testlist ?? this.testlist,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'testlist': testlist?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory TestList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TestList(
      testlist: List<Test>.from(map['testlist']?.map((x) => Test.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TestList.fromJson(String source) =>
      TestList.fromMap(json.decode(source));

  @override
  String toString() => 'TestList(testlist: $testlist)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TestList && listEquals(o.testlist, testlist);
  }

  @override
  int get hashCode => testlist.hashCode;
}

class Test {
  final int id;
  final String name;
  final String email;
  Test({
    this.id,
    this.name,
    this.email,
  });

  Test copyWith({
    int id,
    String name,
    String email,
  }) {
    return Test(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Test(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Test.fromJson(String source) => Test.fromMap(json.decode(source));

  @override
  String toString() => 'Test(id: $id, name: $name, email: $email)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Test && o.id == id && o.name == name && o.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}
