class User {
  final String name;
  final String occupation;
  final int totalPitches;

  User({ required this.name, required this.occupation, required this.totalPitches });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        occupation = json['occupation'],
        totalPitches = json['totalPitches'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'occupation': occupation,
    'totalPitches': totalPitches,
  };
}