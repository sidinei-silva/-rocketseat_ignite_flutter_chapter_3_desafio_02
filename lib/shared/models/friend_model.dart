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
          'https://cdn.icon-icons.com/icons2/1993/PNG/512/avatar_male_man_people_person_profile_user_icon_123199.png',
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
