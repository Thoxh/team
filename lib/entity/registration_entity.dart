class RegistrationEntity {
  final String firstName;
  final String lastName;
  final bool hasAccepted;

  RegistrationEntity(
      {required this.firstName,
      required this.lastName,
      required this.hasAccepted});

  void showEntity() {
    print("Vorname: $firstName\nNachname: $lastName\nStatus: $hasAccepted");
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'hasAccepted': hasAccepted,
    };
  }

  // Factory-Konstruktor zum Erstellen einer Instanz aus einem JSON-Objekt
  factory RegistrationEntity.fromJson(Map<String, dynamic> json) {
    return RegistrationEntity(
        firstName: json['firstName'],
        lastName: json['lastName'],
        hasAccepted: json['hasAccepted']);
  }
}
