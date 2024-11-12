import 'package:flutter/material.dart';
import 'package:tickets_app/home/profile/my_profile_screen.dart';
import 'package:tickets_app/http/login_api.dart';
import 'package:tickets_app/login/components/conditions_component.dart';
import 'package:tickets_app/login/login_screen.dart';
import 'package:tickets_app/models/token_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final LoginAPI api = LoginAPI();

  String token = TokenProvider().getToken();
  Map<dynamic, dynamic> resp = {};
  String message = '';

  bool enPerfil = true;

  Future<void> buttonLogout(String token) async {
    try {
      Map<String, dynamic> response = await api.handleSesionOut(token);
      resp = response;
      message = resp['message'];
    } catch (e) {
      setState(() {});
    }
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
                    color: const Color.fromARGB(255, 251, 251, 251),
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
                              "Cuenta",
                              style: TextStyle(color: Color.fromARGB(255, 131, 131, 131), fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
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
                                      'Mi perfil',
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyProfileScreen(),
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
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Terminos y condiciones',
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
                            onPressed: () {
                              setState(() {
                                enPerfil = true;
                              });
                              termsDialog(context, () {}, () {}, enPerfil);
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.06,
                          padding: const EdgeInsets.only(left: 5, bottom: 15),
                          child: const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "General",
                              style: TextStyle(color: Color.fromARGB(255, 131, 131, 131), fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w600),
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
                                      'Info de la app',
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
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'App Version',
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
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
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
                            onPressed: () async {
                              await buttonLogout(token);

                              if (message.isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Se ha cerrado la sesion')),
                                );

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                                  (route) => false,
                                );
                              }
                            },
                            child: const Text(
                              'Cerrar Sesión',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
