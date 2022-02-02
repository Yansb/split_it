import 'dart:convert';

class FriendModel {
  final String name;

  final String photoUrl;
  FriendModel({
    required this.name,
    required this.photoUrl,
  });

  FriendModel copyWith({
    String? name,
    String? photoUrl,
  }) {
    return FriendModel(
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  factory FriendModel.fromMap(Map<String, dynamic> map) {
    return FriendModel(
      name: map['name'],
      photoUrl: map['photoUrl'] ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0hKWzEg5DKQttwLus5tvIqozRQL-BKXF9EQ&usqp=CAU',
    );
  }

  String toJson() => json.encode(toMap());

  factory FriendModel.fromJson(String source) =>
      FriendModel.fromMap(json.decode(source));

  @override
  String toString() => 'FriendModel(name: $name, photoUrl: $photoUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FriendModel &&
        other.name == name &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => name.hashCode ^ photoUrl.hashCode;
}
