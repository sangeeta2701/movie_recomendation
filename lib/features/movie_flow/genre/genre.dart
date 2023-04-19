import 'package:flutter/material.dart';

@immutable
class Genere {
  final String name;
  final bool isSelected;
  final int id;

  const Genere({required this.name, this.id = 0, this.isSelected = false});

  Genere toggleSelected() {
    return Genere(name: name, id: id, isSelected: !isSelected);
  }

  @override
  String toString() => 'Genere(name: $name, isSelected: $isSelected, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Genere &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode ^ id.hashCode;
}
