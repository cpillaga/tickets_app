import 'package:flutter/material.dart';
import 'package:tickets_app/home/profile/tickets_list_screen.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    
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
                      color: Colors.white,
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Configuracion',
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
                    // color: Colors.cyan,
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: Column(
                      children: [

                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          padding: const EdgeInsets.only(left: 5, bottom: 15),
                          child: const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Mi cuenta",
                              style: TextStyle(
                                color: Color.fromARGB(255, 131, 131, 131), 
                                fontSize: 14, 
                                fontFamily: 'Roboto', 
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Mis tickets y pedidos',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  //scolor: Colors.red,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.chevron_right, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TicketsListScreen(),
                                ),
                              );

                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(0)),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Organizador',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.chevron_right, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Editar Perfil',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.chevron_right, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      
                        Container(
                          //color: Colors.blue,
                          margin: EdgeInsets.only(top: 15),
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          padding: const EdgeInsets.only(left: 5, bottom: 15),
                          child: const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "General",
                              style: TextStyle(
                                color: Color.fromARGB(255, 131, 131, 131), 
                                fontSize: 14, 
                                fontFamily: 'Roboto', 
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Notificaciones',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  //scolor: Colors.red,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.chevron_right, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(0)),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Ayuda',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.chevron_right, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Términos y condiciones',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.chevron_right, color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10)
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'App Versión',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'v1.0.0',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 131, 131, 131), 
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      
                        Container(
                          margin: const EdgeInsets.only(top: 150),
                          // color: Colors.white, 
                          width: MediaQuery.of(context).size.width * 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Colors.red),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              // Acción al presionar el botón
                            },
                            child: const Text(
                              'Cerrar Sesión',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red, // Letras rojas
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                  ,
                  
                ],
              ),
            ))
          ],
        )
    );
  }
}
