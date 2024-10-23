class TicketsProvider {
  static final TicketsProvider tp = TicketsProvider.tickets_provider();

  factory TicketsProvider() {
    return tp;
  }

  TicketsProvider.tickets_provider();

  List<Map<dynamic, dynamic>> ticketsList = [];

  void addTicket(Map<dynamic, dynamic> ticket) {
    ticketsList.add(ticket);
  }

  List<Map<dynamic, dynamic>> getTickets() {
    return ticketsList;
  }

}
