import 'package:equatable/equatable.dart';

import 'category.dart';

class Subcategory extends Equatable {
  final int id;
  final Category category;
  final String name;

  const Subcategory({required this.id, required this.category, required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, category, name];
}