import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final IconData icon;
  final Color color;

  const Category({required this.icon, required this.id, required this.name, required this.color});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}