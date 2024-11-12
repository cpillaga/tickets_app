import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tickets_app/http/user_api.dart';
import 'package:tickets_app/models/token_provider.dart';
//import 'package:tickets_app/models/user_provider.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  UserAPI api = UserAPI();

  TextEditingController handleRegisterPassword = TextEditingController();

  bool isObscurePassword = false;

  String token = TokenProvider().getToken();
  String idUser = TokenProvider().getIdUser();
  Map<dynamic, dynamic>? userData = {};

  Future<void> getUserData() async {
    try {
      userData = await api.handleUser(idUser, token);
      setState(() {});
    } catch (e) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
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
                    //height: MediaQuery.of(context).size.height * 0.4,
                    //color: Colors.red,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Mi Perfil',
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
      body: 
          Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
              height: MediaQuery.of(context).size.height * 0.92,
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 25, top: 25),
              child: Column(children: [
                SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const CircleAvatar(
                    radius: 70,
                    //backgroundImage: AssetImage('assets/images/organizador.jpg'), // Reemplazar con la ruta de imagen
                    child: Icon(
                      Icons.person,
                      size: 90,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenido: ',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 136, 136, 136), 
                          fontWeight: FontWeight.w600, 
                          fontSize: 14, 
                        ),
                      ),
                      SizedBox(width: 2),
                      Text(
                        userData!['name'] ?? '',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 136, 136, 136), 
                          fontWeight: FontWeight.w300, 
                          fontSize: 14, 
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  //color: Colors.cyan,
                  margin: const EdgeInsets.only(left: 10, right:  10),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 3),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nombre",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ),
                Container(
                  //color: Colors.amber,
                  margin: const EdgeInsets.only(left: 10, right:  10),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5), 
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userData!['name'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  )
                ),
                SizedBox(height: 10),
                Container(
                  //color: Colors.cyan,
                  margin: const EdgeInsets.only(left: 10, right:  10),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 3),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ),
                Container(
                  //color: Colors.amber,
                  margin: const EdgeInsets.only(left: 10, right:  10),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userData!['email'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  )
                ),

                SizedBox(height: 10),
                Container(
                  //color: Colors.cyan,
                  margin: const EdgeInsets.only(left: 10, right:  10),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 3),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Telefono",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ),
                Container(
                  //color: Colors.amber,
                  margin: const EdgeInsets.only(left: 10, right:  10),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userData!['phone'] ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  )
                ),

                SizedBox(height: 10),
                Container(
                  //color: Colors.cyan,
                  margin: const EdgeInsets.only(left: 10, right:  10),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Cambiar Contraseña",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ),
                Container(
                  //color: Colors.amber,
                  margin: const EdgeInsets.only(left: 10, right:  10),
                  padding: const EdgeInsets.only(left: 10, right: 10), 
                  child: TextField(
                    obscureText: isObscurePassword,
                    controller: handleRegisterPassword,
                    decoration: InputDecoration(
                      labelText: 'Nueva Contraseña',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontFamily: 'Roboto-Medium', fontSize: 14, fontWeight: FontWeight.w300),
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(isObscurePassword ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isObscurePassword = !isObscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
               
              ])),
        
      
    );
  }
}
