class FestivalModelClass {
  String name;
  String description;
  String day;
  String date; // Change the type to String
  String month;
  String religion;

  FestivalModelClass({
    required this.name,
    required this.description,
    required this.day,
    required this.month,
    required this.date, // Updated here
    required this.religion,
  });

  factory FestivalModelClass.fun({required Map<String, dynamic> data}) {
    return FestivalModelClass(
      name: data['name'],
      description: data['description'],
      day: data['day'],
      month: data['month'],
      date: data['date'],
      religion: data['religion'],
    );
  }
}
