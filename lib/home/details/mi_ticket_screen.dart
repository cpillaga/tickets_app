import 'package:flutter/material.dart';
import 'package:flutter_ticket/flutter_ticket.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tickets_app/home/home_screen.dart';
import 'package:tickets_app/http/user_api.dart';
import 'package:tickets_app/models/token_provider.dart';
import 'package:tickets_app/utils/format_date.dart';

class MiTicketScreen extends StatefulWidget {
  final List<Map<dynamic, dynamic>> ticketsInfo;
  const MiTicketScreen({super.key, required this.ticketsInfo});

  @override
  State<MiTicketScreen> createState() => _MiTicketScreenState();
}

class _MiTicketScreenState extends State<MiTicketScreen> {
  final UserAPI api = UserAPI();
  final FormatDate date = FormatDate();
  final String urlImages = 'http://157.230.60.3:3002';
  Map<dynamic, dynamic>? detalleUser = {};
  late String ownerId = '';
  String token = TokenProvider().getToken();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      detalleUser = await api.handleUser(widget.ticketsInfo[0]['ownerId'], token);
      setState(() {});
    } catch (e) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> info = widget.ticketsInfo;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
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
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Ticket',
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
                    margin: const EdgeInsets.only(top: 80),
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
                                      "Ticket ID: " + info[0]['id'],
                                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      urlImages + info[0]['imagePath'],
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  info[0]['title'],
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
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.5,
                                          child: Text(
                                            info[0]['title'],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const Text("Total Entradas", style: TextStyle(color: Colors.grey)),
                                        SizedBox(
                                            //color: Colors.blue,
                                            width: MediaQuery.of(context).size.width * 0.23,
                                            child: const Text('1')),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("Fecha", style: TextStyle(color: Colors.grey)),
                                        Text(
                                          date.formatDate(info[0]['date']),
                                        ),
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
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.25,
                                                child: Text(
                                                  detalleUser!['name'] ?? '',
                                                  style: const TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
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
                                        data: info[0]['qrCode'].toString(),
                                        version: QrVersions.auto,
                                        size: 200.0,
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                              'Descargar Ticket',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
