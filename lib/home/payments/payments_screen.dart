import 'package:flutter/material.dart';
import 'package:tickets_app/home/payments/add_card_screen.dart';

class PaymentsScreen extends StatefulWidget {

  final Map<dynamic, dynamic>? concierto;
  final double total;
  final int entradas;

  const PaymentsScreen({super.key, required this.concierto, required this.total, required this.entradas});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();

}

class _PaymentsScreenState extends State<PaymentsScreen> {

  bool paymentStripe = false;
  bool paymentTransfer = false;

  @override
  Widget build(BuildContext context) {

    final concierto = widget.concierto;
    final double valorTotal = widget.total;
    final int cantidadEntradas = widget.entradas;

    double descuento = 0.0;
    double cargoServicio = 1.50;
    double impuesto = 1.13;

    double total = valorTotal + descuento + cargoServicio + impuesto;

    final String urlImages = 'http://157.230.60.3:3002';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Aumento el alto del AppBar
        child: AppBar(
          //backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Elegir método de pago',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
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
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 0, right: 0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    //borderRadius: BorderRadius.circular(15),
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
                        child: Container(),
                      ),
                      const SizedBox(height: 2),
                      GestureDetector(
                        onTap: () {
                          print('Tocaste la información del evento');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.13,
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  //color: Colors.green,
                                  //width: MediaQuery.of(context).size.width * 0.9,
                                  //padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(7, 5, 5, 5),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                          child: Image.network(
                                            urlImages+concierto!['imagePath'], // Mostramos la imagen
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context).size.width * 0.25,
                                            height: MediaQuery.of(context).size.height * 0.116,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        //color: Colors.deepPurple,
                                        width: MediaQuery.of(context).size.width * 0.58,
                                        //height: MediaQuery.of(context).size.height * 0.13,
                                        child: Column(
                                          children: [
                                            Container(
                                                //color: Colors.green,
                                                padding: const EdgeInsets.only(left: 10),
                                                height: MediaQuery.of(context).size.height * 0.035,
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    concierto['title']!.toString(),
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(color: Colors.black, fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.w800),
                                                  ),
                                                )),
                                            Container(
                                                //color: Colors.red,
                                                padding: const EdgeInsets.only(left: 10),
                                                height: MediaQuery.of(context).size.height * 0.03,
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    concierto['location']!.toString(),
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(color: Colors.grey, fontFamily: 'Roboto', fontSize: 13, fontWeight: FontWeight.w400),
                                                  ),
                                                )),
                                            Container(
                                                //color: Colors.blue,
                                                padding: const EdgeInsets.only(left: 10),
                                                height: MediaQuery.of(context).size.height * 0.03,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          '\$ $valorTotal',
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(color: Color(0xFFef7c21), fontFamily: 'Roboto', fontSize: 15, fontWeight: FontWeight.w800),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(left: 5),
                                                        child: const Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            ' /Subtotal',
                                                            textAlign: TextAlign.left,
                                                            style: const TextStyle(color: Colors.grey, fontFamily: 'Roboto', fontSize: 13, fontWeight: FontWeight.w400),
                                                          ),
                                                        ))
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * 0.93,
                        height: MediaQuery.of(context).size.height * 0.27,
                        decoration: const BoxDecoration(
                          //color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.95,
                                  margin: const EdgeInsets.only(left: 5),
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(3)),
                                  ),
                                  child: const Text(
                                    "Método de pago",
                                    style: TextStyle(color: Colors.black, fontFamily: 'Roboto', fontSize: 15, fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        height: MediaQuery.of(context).size.width * 0.15,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(7)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              //color: Colors.green,
                                              width: MediaQuery.of(context).size.width * 0.15,
                                              padding: EdgeInsets.only(left: 20),
                                              height: MediaQuery.of(context).size.height * 0.1,
                                              child: const Icon(
                                                Icons.credit_card,
                                                color: Color.fromARGB(255, 143, 143, 143),
                                              ),
                                            ),
                                            Container(
                                                //color: Colors.red,
                                                width: MediaQuery.of(context).size.width * 0.45,
                                                height: MediaQuery.of(context).size.height * 0.1,
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "Pago con Stripe",
                                                      style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 143, 143, 143), fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                                    ))),
                                            Container(
                                              //color: Colors.blue,
                                              margin: EdgeInsets.only(left: 50),
                                              width: MediaQuery.of(context).size.width * 0.15,
                                              height: MediaQuery.of(context).size.height * 0.1,
                                              child: Transform.scale(
                                                scale: 1.1, // Escalar para que se vea más grande
                                                child: Checkbox(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30), // Hacer el checkbox redondo
                                                  ),
                                                  value: paymentStripe,
                                                  activeColor: Colors.black,
                                                  onChanged: (bool? value) {
                                                    print("Stripe");
                                                    setState(() {
                                                      paymentStripe = value ?? false;
                                                      if (paymentStripe) {
                                                        paymentTransfer = false;
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.9,
                                        height: MediaQuery.of(context).size.width * 0.15,
                                        margin: const EdgeInsets.only(top: 10),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(7)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              //color: Colors.red,
                                              width: MediaQuery.of(context).size.width * 0.15,
                                              height: MediaQuery.of(context).size.height * 0.1,
                                              padding: EdgeInsets.only(left: 17),
                                              child: const Icon(
                                                Icons.credit_card,
                                                color: Color.fromARGB(255, 143, 143, 143), // Icono para la fecha
                                              ),
                                            ),
                                            Container(
                                                //color: Colors.grey,
                                                width: MediaQuery.of(context).size.width * 0.45,
                                                height: MediaQuery.of(context).size.height * 0.1,
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "Transferencia",
                                                      style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 143, 143, 143), fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                                    ))),
                                            Container(
                                                //color: Colors.blue,
                                                margin: EdgeInsets.only(left: 47),
                                                width: MediaQuery.of(context).size.width * 0.15,
                                                height: MediaQuery.of(context).size.height * 0.1,
                                                child: Transform.scale(
                                                  scale: 1.1, // Escalar para que se vea más grande
                                                  child: Checkbox(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30), // Hacer el checkbox redondo
                                                    ),
                                                    value: paymentTransfer,
                                                    activeColor: Colors.black,
                                                    onChanged: (bool? value) {
                                                      print("transferencia");
                                                      setState(() {
                                                        paymentTransfer = value ?? false;
                                                        if (paymentTransfer) {
                                                          paymentStripe = false;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          //color: Colors.white,
                          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          width: MediaQuery.of(context).size.width * 0.93,
                          //height: MediaQuery.of(context).size.width * 0.56,
                          decoration: const BoxDecoration(
                            //color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                //color: Colors.red,
                                margin: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                                //padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                width: MediaQuery.of(context).size.width * 0.92,
                                //height: MediaQuery.of(context).size.height * 0.5,
                                child: const Text(
                                  "Detalles de compra",
                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                  //color: Colors.white,
                                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  padding: const EdgeInsets.fromLTRB(5, 7, 5, 7),
                                  width: MediaQuery.of(context).size.width * 0.92,
                                  height: MediaQuery.of(context).size.height * 0.21,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.43,
                                            //color: Colors.cyan,
                                            child: Column(
                                              children: [
                                                Container(
                                                  //color: Colors.blue,
                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                  margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                  child: const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "Subtotal",
                                                      style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  //color: Colors.red,
                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                  margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                  child: const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "Descuento",
                                                      style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  //color: Colors.green,
                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                  margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                  child: const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "Cargo por Servicio",
                                                      style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  //color: Colors.pink,
                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                  margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                                  child: const Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "Impuestos",
                                                      style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.43,
                                            //color: Colors.cyan,
                                            child: Column(
                                              children: [
                                                Container(
                                                  //color: Colors.blue,
                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                  margin: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      '\$ $valorTotal',
                                                      style: const TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  //color: Colors.red,
                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                  margin: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      '\$ $descuento',
                                                      style: const TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  //color: Colors.green,
                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                  margin: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      '\$ $cargoServicio',
                                                      style: const TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  //color: Colors.pink,
                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                  margin: const EdgeInsets.fromLTRB(0, 5, 15, 0),
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      '\$ $impuesto',
                                                      style: const TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  //color: Colors.cyan,
                                  margin: const EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width * 0.93,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        //color: Colors.red,
                                        width: MediaQuery.of(context).size.width * 0.435,
                                        child: const Text(
                                          "Precio total",
                                          style: TextStyle(color: Colors.grey, fontFamily: 'Roboto', fontSize: 15, fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        //color: Colors.blue,
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        margin: const EdgeInsets.only(right: 5),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '\$ $total',
                                            style: const TextStyle(color: Colors.black, fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.87,
                                height: MediaQuery.of(context).size.height * 0.065,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFef7c21),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Pagar Ahora',
                                    style: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontSize: 15, fontWeight: FontWeight.w600),
                                  ),
                                  onPressed: () {
                                    if (paymentStripe) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddCardScreen(total: total, concierto: concierto, cantidad: cantidadEntradas),
                                        ),
                                      );
                                    } else {
                                      print("Transferencia");
                                    }
                                  },
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
