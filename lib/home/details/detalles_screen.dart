import 'package:flutter/material.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:rich_readmore/rich_readmore.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tickets_app/home/payments/payments_screen.dart';
import 'package:tickets_app/http/user_api.dart';
import 'package:tickets_app/models/token_provider.dart';

class DetallesScreen extends StatefulWidget {
  final Map<dynamic, dynamic> concierto;
  const DetallesScreen({super.key, required this.concierto});

  @override
  State<DetallesScreen> createState() => _DetallesScreenState();
}

class _DetallesScreenState extends State<DetallesScreen> {
  final UserAPI api = UserAPI();
  final String urlImages = 'http://157.230.60.3:3002';

  String token = TokenProvider().getToken();

  Map<dynamic, dynamic>? conciertosPrecios = {};
  List<Map<dynamic, dynamic>?> conciertosData = [];
  Map<dynamic, dynamic>? userData = {};

  int menuIndex = 0;
  int cantidad = 0;
  bool isExpanded = false;
  bool showButton = false;
  double total = 0.0;
  num totalTickets = 0;

  Future<void> getUserData() async { 
    try {
      userData = await api.handleUser(conciertosPrecios!['id'] ,token);
      print("Token: $userData");
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  } 

  void onItemTapped(int index) {
    setState(() {
      menuIndex = index;
    });

    if (index == 1) {
      print("Pantalla Bolsa");
    } else if (index == 2) {
      print("Pantalla Persona");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    getUserData();
  }

  void getData() {
    for (var values in widget.concierto['stages']) {
      conciertosData.add({'precio': values['price'], 'cantidad': 0, 'tipo': values['name']});
    }
  }

  void calcularTotal() {
    total = 0.0;
    for (var precioData in conciertosData) {
      total += precioData!['cantidad'] * double.parse(precioData['precio']);
    }
  }

  void calcularTotalTickets() {
    totalTickets = 0;
    for (var precioData in conciertosData) {
      totalTickets += precioData!['cantidad'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic>? concierto = widget.concierto;
    conciertosPrecios = concierto;

    setState(() {
      print("Conciertos: $userData");
    });



    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55), // Aumento el alto del AppBar
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
                    //height: MediaQuery.of(context).size.height * 0.4,
                    //color: Colors.red,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Detalles del evento',
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 0, right: 0),
              child: Column(
                children: [
                  Container(
                    //color: Colors.white,
                    padding: const EdgeInsets.all(15),
                    //margin: const EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Tocaste la imagen');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              child: Image.network(
                                urlImages + concierto!['imagePath'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 350,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        GestureDetector(
                          onTap: () {
                            print('Tocaste la información del evento');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    concierto['title'],
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      children: [
                                        Icon(Icons.location_on),
                                        SizedBox(height: 5),
                                        Icon(Icons.calendar_today_outlined),
                                        SizedBox(height: 5),
                                        Icon(Icons.info_outline),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            concierto['location'],
                                            style: const TextStyle(
                                              color: Color.fromARGB(255, 133, 133, 133),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            concierto['date'],
                                            style: const TextStyle(
                                              color: Color.fromARGB(255, 133, 133, 133),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            concierto['description'],
                                            style: const TextStyle(
                                              color: Color.fromARGB(255, 133, 133, 133),
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              // Generar Cards dinámicamente basados en el array de precios
                              Column(
                                children: conciertosData.map((precioData) {
                                  return Container(
                                    margin: const EdgeInsets.all(7.0),
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 229, 231, 235),
                                      // border: Border.all(
                                      //   color: Colors.black,
                                      //   width: 2.0,
                                      // ),
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Primera columna: Precio
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.2,
                                              height: MediaQuery.of(context).size.height * 0.065,
                                              margin: const EdgeInsets.only(left: 5),
                                              //color: Colors.red,
                                              child: Center(
                                                child: Text(
                                                  '\$ ${precioData!['precio']}.00',
                                                  textAlign: TextAlign.center, // Precio dinámico
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(255, 0, 0, 0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),

                                        // Segunda columna: Información general
                                        Column(
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.30,
                                              height: MediaQuery.of(context).size.height * 0.03,
                                              margin: EdgeInsets.only(top: 5),
                                              //color: Colors.blue,
                                              //margin: EdgeInsets.only(top: 3),
                                              child: Padding(
                                                padding: EdgeInsets.only(top: 3),
                                                child: Text(
                                                  precioData['tipo'],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.30,
                                              height: MediaQuery.of(context).size.height * 0.02,
                                              //color: Colors.blue,
                                              child: const Padding(
                                                padding: EdgeInsets.only(top: 0),
                                                child: Text(
                                                  'Información',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(255, 133, 133, 133),
                                                    fontSize: 12,
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Tercera columna: CartStepperInt
                                        CartStepperInt(
                                          alwaysExpanded: true,
                                          value: precioData['cantidad'],
                                          size: 30,
                                          didChangeCount: (count) {
                                            setState(() {
                                              precioData['cantidad'] = count;
                                              totalTickets = count;
                                              calcularTotal();
                                              calcularTotalTickets();
                                            });
                                          },
                                          style: const CartStepperStyle(
                                              //buttonAspectRatio: 1,
                                              foregroundColor: Colors.black,
                                              activeForegroundColor: Colors.white,
                                              activeBackgroundColor: Color(0xFFef7c21),
                                              //border: Border.all(color: Colors.blue),
                                              radius: Radius.elliptical(10, 10),
                                              textStyle: TextStyle(fontFamily: 'Roboto', fontSize: 35, fontWeight: FontWeight.w500)),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            //color: Colors.white,
                            margin: const EdgeInsets.only(top: 2),
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  //color: Colors.red,
                                  margin: const EdgeInsets.fromLTRB(0, 10, 5, 5),
                                  padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: const Text(
                                    "Descripción",
                                    style: TextStyle(fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichReadMoreText.fromString(
                                        text: 'Este 1 de noviembre, llega La Bendita, el evento más esperado de las fiestas de Cuenca. Te invitamos a disfrutar de una noche llena de música, energía y entretenimiento, con los mejores DJs, Este 1 de noviembre, llega La Bendita, el evento más esperado de las fiestas de Cuenca. Te invitamos a disfrutar de una noche llena de música, energía y entretenimiento, con los mejores DJs',
                                        textStyle: const TextStyle(color: Colors.grey, fontFamily: 'Roboto', fontSize: 14),
                                        settings: LengthModeSettings(
                                          textAlign: TextAlign.justify,
                                          trimLength: 175,
                                          trimCollapsedText: 'Leer más',
                                          trimExpandedText: 'Leer menos',
                                          onPressReadMore: () {},
                                          onPressReadLess: () {},
                                          lessStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                                          moreStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 2),
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 10, 5, 5),
                                  padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: const Text(
                                    "Ubicación",
                                    style: TextStyle(fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 2),
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  child: FlutterMap(
                                    options: const MapOptions(
                                      initialCenter: LatLng(-2.9070196, -79.067775),
                                      initialZoom: 13.0,
                                      interactionOptions: InteractionOptions(flags: InteractiveFlag.all),
                                    ),
                                    mapController: MapController(),
                                    children: [
                                      const MarkerLayer(
                                        markers: [
                                          Marker(
                                              width: 80.0,
                                              height: 80.0,
                                              alignment: Alignment(50, 50),
                                              point: LatLng(-2.9070196, -79.067775),
                                              child: Icon(
                                                Icons.location_on,
                                                color: Colors.red,
                                                size: 40,
                                              ))
                                        ],
                                      ),
                                      TileLayer(
                                        subdomains: const ['a', 'b', 'c'],
                                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                                      ),
                                      CircleLayer(circles: [CircleMarker(point: LatLng(37.7749, -122.4194), radius: 30, color: Colors.blue.withOpacity(0.3))])
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(0, 5, 5, 15),
                                    padding: EdgeInsets.fromLTRB(0, 10, 5, 0),
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: const Row(
                                      children: [
                                        Icon(Icons.location_on, color: Colors.black),
                                        SizedBox(width: 5),
                                        Text(
                                          'Cuenca, Caballo Campana',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(255, 133, 133, 133),
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 2, bottom: conciertosData.any((concierto) => concierto!['cantidad'] > 0) ? 65.0 : 0),
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: const CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage('assets/images/organizador.jpg'), // Reemplazar con la ruta de imagen
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        //concierto['organizador'] ?? "",
                                        '',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
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
                                    icon: const Icon(Icons.message, color: Color.fromARGB(255, 33, 218, 231)),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.phone, color: Colors.blue),
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
                ],
              ),
            ),
          ),
          if (conciertosData.any((concierto) => concierto!['cantidad'] > 0)) ...[
            Positioned(
              left: 15,
              bottom: 0,
              child: Column(
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // color: Colors.green,
                        width: MediaQuery.of(context).size.width * 0.925,
                        padding: const EdgeInsets.all(10),
                        //margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
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
                            'Comprar Ahora',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentsScreen(concierto: concierto, total: total, entradas: int.parse(totalTickets.toString())),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const Icon(Icons.home),
                if (menuIndex == 0)
                  Container(
                    //margin: const EdgeInsets.only(top: 2),
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Column(
              children: [
                const Icon(Icons.shopping_bag),
                if (menuIndex == 1)
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                const Icon(Icons.person),
                if (menuIndex == 2)
                  Container(
                    //color: Colors.blue,
                    margin: const EdgeInsets.only(top: 2),
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            label: '',
          ),
        ],
        currentIndex: menuIndex,
        selectedItemColor: Colors.orange,
        onTap: onItemTapped,
      ),
    );
  }
}
