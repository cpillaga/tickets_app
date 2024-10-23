import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:tickets_app/home/details/detalle_ticket_screen.dart';

class AddCardScreen extends StatefulWidget {

  final double total;
  final Map<dynamic, dynamic> concierto;
  final int cantidad;

  const AddCardScreen({super.key, required this.total, required this.concierto, required this.cantidad});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  
  TextEditingController handleCardEmail = TextEditingController();
  TextEditingController handleCardInformation = TextEditingController();
  TextEditingController handleCardDate = TextEditingController();
  TextEditingController handleCardPass = TextEditingController();
  TextEditingController handleCardName = TextEditingController();
  TextEditingController handleCardPost = TextEditingController();

  bool isObscureInfo = true;
  bool isObscureDate = true;
  bool isObscureNum = true;

  String selectCountry = 'Seleccionar un país';
  String postalCode = ' .... ';
  String apiKey = 'd7e835d5d9634fbcabf239fb85f2fff7';

  /*
  Future<void> getPostalCode(String countryName) async {
    var url = Uri.parse('https://api.opencagedata.com/geocode/v1/json?q=$selectCountry&key=$apiKey');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var postalCodeData = jsonResponse['results'][0]['components']['postcode'];

      setState(() {
        postalCode = postalCodeData ?? 'Codigo postal no disponible';
      });
    } else {
      setState(() {
        postalCode = 'Error al consultar el Codigo Postal';
      });
    }
  }*/

  void openCountryPicker() {

    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          selectCountry = country.name;
          postalCode = 'Solicitando codigo postal...';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    Map<dynamic, dynamic> conciertos = widget.concierto;
    double totalPrice = widget.total;
    int cantidadEntradas = widget.cantidad;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pago con Stripe',
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
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              // color: Colors.cyan,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 150, 15, 0),
                  child: Column(children: [
                    Column(
                      children: [
                        Container(width: MediaQuery.of(context).size.width * 0.85, height: MediaQuery.of(context).size.height * 0.025, padding: const EdgeInsets.symmetric(vertical: 1), child: const Align(alignment: Alignment.centerLeft, child: Text("Email", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w600)))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 148, 148, 148),
                            ),
                            cursorHeight: 14.0,
                            controller: handleCardEmail,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Color.fromARGB(255, 148, 148, 148), fontFamily: 'Roboto-Medium', fontSize: 14, fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(margin: const EdgeInsets.only(top: 5), width: MediaQuery.of(context).size.width * 0.85, height: MediaQuery.of(context).size.height * 0.025, padding: const EdgeInsets.symmetric(vertical: 1), child: const Align(alignment: Alignment.centerLeft, child: Text("Información", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w600)))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 148, 148, 148),
                            ),
                            cursorHeight: 14.0,
                            obscureText: isObscureInfo,
                            controller: handleCardInformation,
                            decoration: InputDecoration(
                              //labelText: 'Información',
                              hintText: '4242-4242-4242-4242',
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 148, 148, 148),
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              labelStyle: const TextStyle(color: Color.fromARGB(255, 148, 148, 148), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
                              border: const OutlineInputBorder(),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(isObscureInfo ? Icons.visibility : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    isObscureInfo = !isObscureInfo;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              width: MediaQuery.of(context).size.width * 0.424,
                              height: MediaQuery.of(context).size.width * 0.12,
                              child: TextField(
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                                cursorHeight: 14.0,
                                obscureText: isObscureDate,
                                controller: handleCardDate,
                                decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  hintText: '12/24',
                                  hintStyle: const TextStyle(
                                      color: Color.fromARGB(255, 148, 148, 148),
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  labelStyle: const TextStyle(color: Color.fromARGB(255, 148, 148, 148), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
                                  border: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 148, 148, 148),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 148, 148, 148),
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(isObscureDate ? Icons.visibility : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        isObscureDate = !isObscureDate;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              //margin: EdgeInsets.only(top: 1),
                              width: MediaQuery.of(context).size.width * 0.424,
                              height: MediaQuery.of(context).size.width * 0.12,
                              // color: Colors.purple,
                              //padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: TextField(
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                                cursorHeight: 14.0,
                                obscureText: isObscureNum,
                                controller: handleCardPass,
                                decoration: InputDecoration(
                                  // labelText: 'Información',
                                  hintText: '123',
                                  hintStyle: const TextStyle(
                                      color: Color.fromARGB(255, 148, 148, 148),
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  labelStyle: const TextStyle(color: Color.fromARGB(255, 148, 148, 148), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  border: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 148, 148, 148),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 148, 148, 148),
                                    ),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(isObscureNum ? Icons.visibility : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        isObscureNum = !isObscureNum;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(margin: const EdgeInsets.only(top: 5), width: MediaQuery.of(context).size.width * 0.85, height: MediaQuery.of(context).size.height * 0.025, padding: const EdgeInsets.symmetric(vertical: 1), child: const Align(alignment: Alignment.centerLeft, child: Text("Nombre en la tarjeta", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w600)))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 148, 148, 148),
                            ),
                            cursorHeight: 14.0,
                            controller: handleCardName,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Color.fromARGB(255, 148, 148, 148), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(margin: const EdgeInsets.only(top: 5), width: MediaQuery.of(context).size.width * 0.85, height: MediaQuery.of(context).size.height * 0.025, padding: const EdgeInsets.symmetric(vertical: 1), child: const Align(alignment: Alignment.centerLeft, child: Text("País o Región", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w600)))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 148, 148, 148),
                            ),
                            cursorHeight: 14.0,
                            controller: TextEditingController(text: selectCountry),
                            decoration: const InputDecoration(
                              //labelText: 'Selecciona un país',
                              labelStyle: TextStyle(color: Color.fromARGB(255, 148, 148, 148), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                              ),
                            ),
                            onTap: openCountryPicker,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 148, 148, 148),
                            ),
                            controller: handleCardPost,
                            decoration: const InputDecoration(
                              //labelText: 'Codigo postal',
                              labelStyle: TextStyle(color: Color.fromARGB(255, 148, 148, 148), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 148, 148, 148),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.08,
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 12, 37, 65),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              'Pagar $totalPrice US \$',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetalleTicketScreen(total: totalPrice, conciertoData: conciertos, cantidadEntradas: cantidadEntradas),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ])),
            ),
          )
        ],
      ),
    );
  }
}
