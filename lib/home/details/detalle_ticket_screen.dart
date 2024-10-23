import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_ticket/flutter_ticket.dart';
import 'package:tickets_app/models/tickets_provider.dart';
import 'dart:math';

class DetalleTicketScreen extends StatefulWidget {
  final double total;
  final Map<dynamic, dynamic> conciertoData;
  final int cantidadEntradas;

  const DetalleTicketScreen({super.key, required this.total, required this.conciertoData, required this.cantidadEntradas});

  @override
  State<DetalleTicketScreen> createState() => _DetalleTicketScreenState();
}

class _DetalleTicketScreenState extends State<DetalleTicketScreen> {

  late String orderId;
  final String urlImages = 'http://157.230.60.3:3002';

  @override
  void initState() {
    super.initState();
    orderId = generateRandomOrderId();
  }

  String generateRandomOrderId() {
    var random = Random();
    return (random.nextInt(900000) + 100000).toString();
  }

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> detalleConcierto = widget.conciertoData;
    int totalEntradas = widget.cantidadEntradas;

    setState(() {
      print("Detalle Concierto: $detalleConcierto");
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55), // Aumento el alto del AppBar
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 15),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //height: MediaQuery.of(context).size.height * 0.4,
                    //color: Colors.black,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Detalle del ticket',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.black,
                height: MediaQuery.of(context).size.width * 0.6,
              ),
              Positioned(
                child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width * 1,
                    margin: EdgeInsets.only(top: 80),
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Ticket(
                          outerRadius: BorderRadius.circular(16),
                          innerRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                            )
                          ],
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Container(
                                      width: 61,
                                      height: 32,
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFef7c21),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Evento",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Orden ID: $orderId",
                                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      urlImages+detalleConcierto['imagePath'],
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  detalleConcierto['title'],
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "Mostrar el código QR en la entrada del evento",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("Evento", style: TextStyle(color: Colors.grey)),
                                        Text(detalleConcierto['title']),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const Text("Total Entradas", style: TextStyle(color: Colors.grey)),
                                        SizedBox(
                                            //color: Colors.blue,
                                            width: MediaQuery.of(context).size.width * 0.23,
                                            child: Text(totalEntradas.toString())),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Fecha", style: TextStyle(color: Colors.grey)),
                                        Text("Noviembre 1, 2024"),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("Hora", style: TextStyle(color: Colors.grey)),
                                        Text("17:00"),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const SizedBox(height: 10),
                                Container(
                                  margin: const EdgeInsets.only(top: 2, bottom: 0),
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  decoration: const BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            //color: Colors.blue,
                                            margin: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                                            child: const CircleAvatar(
                                              radius: 30,
                                              backgroundImage: AssetImage('assets/images/organizador.jpg'), // Reemplaza con la ruta de tu imagen
                                              child: Icon(Icons.person),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                detalleConcierto['organizador'] ?? "",
                                                style: const TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              const Text(
                                                "Organizador",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.message,
                                              color: Color(0xFFef7c21),
                                            ),
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.phone,
                                              color: Color(0xFFef7c21),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Ticket(
                            outerRadius: BorderRadius.circular(16),
                            innerRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                              )
                            ],
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Center(
                                    child: Column(
                                      children: [
                                        QrImageView(
                                          data: "https://miapp.com/ticket/982765",
                                          version: QrVersions.auto,
                                          size: 200.0,
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 0),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFef7c21),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'Descargar Tickets',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Map<dynamic, dynamic> ticket = {'descripcion': detalleConcierto['title'], 'ubicacion': detalleConcierto['location'], 'fecha': detalleConcierto['date'], 'orden': orderId, 'cantidad': totalEntradas};

                              TicketsProvider().addTicket(ticket);
                              Navigator.popUntil(context, (route) => route.isFirst);
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          )
        ],
      )),
    );
  }
}
