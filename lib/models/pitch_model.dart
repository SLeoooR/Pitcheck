class Pitch {
  final String title;
  final String company;
  final String story;
  final String problem;
  final String targetAudience;
  final String solution;
  final String whyWorthIt;
  final String unfairAdvantage;
  final String finalWords;
  final String icon;

  Pitch({
    required this.title,
    required this.company,
    required this.story,
    required this.problem,
    required this.targetAudience,
    required this.solution,
    required this.whyWorthIt,
    required this.unfairAdvantage,
    required this.finalWords,
    required this.icon
  });

  Pitch.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        company = json['company'],
        story = json['story'],
        problem = json['problem'],
        targetAudience = json['targetAudience'],
        solution = json['solution'],
        whyWorthIt = json['whyWorthIt'],
        unfairAdvantage = json['unfairAdvantage'],
        finalWords = json['finalWords'],
        icon = json['icon'];

  Map<String, dynamic> toJson() => {
    'title': title,
    'company': company,
    'story': story,
    'problem': problem,
    'targetAudience': targetAudience,
    'solution': solution,
    'whyWorthIt': whyWorthIt,
    'unfairAdvantage': unfairAdvantage,
    'finalWords': finalWords,
    'icon': icon
  };
}