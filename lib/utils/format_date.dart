class FormatDate {

  String formatDate(String dateString) {

    DateTime dateTime = DateTime.parse(dateString);
    List<String> meses = [
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
      'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
    ];

    String mes = meses[dateTime.month - 1]; 
    return '$mes ${dateTime.day}, ${dateTime.year}';

  }
  
}