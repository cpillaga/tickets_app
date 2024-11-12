import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:tickets_app/home/details/mi_ticket_screen.dart';
import 'package:tickets_app/http/listTicket_api.dart';
// import 'package:tickets_app/models/tickets_provider.dart';
import 'package:tickets_app/models/token_provider.dart';
import 'package:tickets_app/utils/format_date.dart';
import 'dart:math';

class TicketsListScreen extends StatefulWidget {
  const TicketsListScreen({super.key});

  @override
  State<TicketsListScreen> createState() => _TicketsListScreenState();
}

class _TicketsListScreenState extends State<TicketsListScreen> {
  final ListTicketAPI api = ListTicketAPI();
  final FormatDate date = FormatDate();

  List<dynamic> listTickets = [{}];
  late List<Map<dynamic, dynamic>> tickets = [];

  String idUser = TokenProvider().getIdUser();

  String generateRandomOrderId() {
    var random = Random();
    return (random.nextInt(900000) + 100000).toString();
  }

  Future<void> getListTicket() async {
    try {
      var response = await api.handleTicketList(TokenProvider().getToken(), TokenProvider().getIdUser());
      listTickets = response;

      for (var values in listTickets) {
        tickets.add({
          'id': values['id'].substring(0, 12),
          'qrCode': values['qrCode'],
          'title': values['event']['title'],
          'description': values['event']['description'],
          'date': values['event']['date'],
          'location': values['event']['location'],
          'imagePath': values['event']['imagePath'],
          'ownerId': values['event']['ownerId'],
          'localities': (values['event']['localities'] != null && values['event']['localities'].isNotEmpty) ? values['event']['localities'].map((locality) => locality['name']).join(', ') : "General",
        });
      }
      setState(() {});
    } catch (e) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getListTicket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 15),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.transparent,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Mis Tickets',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: tickets.isEmpty
          ? Center(
              child: Card(
                color: Colors.grey[200],
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'No hay adquisiciones',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: CouponCard(
                    height: 130,
                    backgroundColor: Colors.white,
                    curveAxis: Axis.vertical,
                    firstChild: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFef7c21),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.rotate(
                              angle: -3.14 / -2,
                              child: Column(
                                children: [
                                  const Text(
                                    "LOCALIDAD",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: Colors.white),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height: (ticket['localities'] != null && (ticket['localities'] == "General" || ticket['localities'] == "GENERAL")) ? 40.0 : MediaQuery.of(context).size.height * 0.07,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      (ticket['localities'] ?? '').toUpperCase(),
                                      style: const TextStyle(
                                        color: Color(0xFFef7c21),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    secondChild: Container(
                      //color: Colors.red,
                      /*
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFef7c21), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      */
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                margin: const EdgeInsets.only(top: 8),
                                color: const Color(0xFFef7c21),
                                child: Text(
                                  ticket['title'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                //color: Colors.blue,
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: MediaQuery.of(context).size.height * 0.03,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  child: Image.asset(
                                    'assets/images/header.png', // Mostramos la imagen
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          Container(
                            child: Text(
                              date.formatDate(ticket['date']),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 131, 131, 131),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          //const Spacer(),
                          Container(
                            child: Text(
                              ticket['location'] ?? '',
                              style: const TextStyle(color: Color.fromARGB(255, 131, 131, 131), fontSize: 11),
                            ),
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                //color: Colors.green,
                                width: MediaQuery.of(context).size.width * 0.32,
                                height: MediaQuery.of(context).size.height * 0.04,
                                margin: const EdgeInsets.only(top: 5),
                                padding: const EdgeInsets.only(right: 20),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MiTicketScreen(ticketsInfo: tickets)));
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      ticket['id'] ?? '',
                                      style: const TextStyle(color: Color.fromARGB(255, 131, 131, 131), fontWeight: FontWeight.w800, fontSize: 12, fontFamily: 'Roboto-Bold'),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                //color: Colors.blue,
                                width: MediaQuery.of(context).size.width * 0.27,
                                height: MediaQuery.of(context).size.height * 0.04,
                                margin: const EdgeInsets.only(top: 5),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MiTicketScreen(ticketsInfo: tickets)));
                                  },
                                  child: const Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      'Ver detalles',
                                      style: TextStyle(color: Color.fromARGB(255, 131, 131, 131), fontWeight: FontWeight.w800, fontSize: 12, fontFamily: 'Roboto-Bold'),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
