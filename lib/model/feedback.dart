/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String nombre;
  String comida;
  String bus;
  String preboda;

  FeedbackForm(this.nombre, this.comida, this.bus, this.preboda);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['nombre']}", "${json['comida']}",
        "${json['bus']}", "${json['preboda']}");
  }

  // Method to make GET parameters.
  Map toJson() =>
      {'nombre': nombre, 'comida': comida, 'bus': bus, 'preboda': preboda};
}
