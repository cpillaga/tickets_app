import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:tickets_app/models/tickets_provider.dart';

class TicketsListScreen extends StatefulWidget {
  const TicketsListScreen({super.key});

  @override
  State<TicketsListScreen> createState() => _TicketsListScreenState();
}

class _TicketsListScreenState extends State<TicketsListScreen> {
  List<Map<dynamic, dynamic>> tickets = TicketsProvider().getTickets();

  @override
  void initState() {
    super.initState();
    tickets = TicketsProvider().getTickets();
    //print('Tickets cargados: $tickets');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
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
                    color: Colors.white,
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
      body: ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          final ticket = tickets[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: CouponCard(
              height: 127,
              backgroundColor: const Color(0xFFef7c21),
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
                      child: Text(
                        '${ticket['orden']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              secondChild: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        ticket['descripcion'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      child: Text(
                        ticket['fecha'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //const Spacer(),
                    Container(
                      child: Text(
                        ticket['ubicacion'],
                        style: const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      height: MediaQuery.of(context).size.height * 0.04,
                      margin: const EdgeInsets.only(top: 7),
                      child: TextButton(
                      onPressed: () {
                        print('Ir a Recuperar contraseña');
                      },
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Ver detalles',
                          style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.w800, 
                            fontSize: 12, 
                            fontFamily: 'Roboto-Bold'
                          ),
                        ),
                      ),
                    ),
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
