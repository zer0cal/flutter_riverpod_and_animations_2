class AnimatedItemModel {
  AnimatedItemModel(this.name);

  String name;
  

  @override
  String toString() {
    return name;
  }

  @override
  int get hashCode => name.hashCode;
  
  @override
  bool operator ==(Object other) {
    return hashCode == other.hashCode;
  }
}