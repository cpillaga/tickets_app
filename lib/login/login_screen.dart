import 'package:flutter/material.dart';
import 'package:tickets_app/http/login_api.dart';
import 'package:tickets_app/login/register_screen.dart';
import 'package:tickets_app/models/token_provider.dart';
import 'package:tickets_app/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final LoginAPI api = LoginAPI();

  TextEditingController handleLoginEmail = TextEditingController();
  TextEditingController handleLoginPassword = TextEditingController();

  bool isObscure = true;
  bool checkRemember = true;

  Future<void> buttonLogin(String email, String password) async {

    try {
      Map<String, dynamic> response = await api.handleSesion(email, password);
      TokenProvider().setToken(response['token']);
    } 
    catch (e) {
      print('Error: $e');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10), 
              ),
              Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(children: [
                    Container(
                      width: 200,
                      height: 100,
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
                    )
                  ])),
              Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text('Bienvenido',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            fontFamily: 'Roboto-Black',
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(1),
                      child: const Text(
                        'Por favor, introduce tus datos',
                        style: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontWeight: FontWeight.w400, fontSize: 15, fontFamily: 'Roboto-Black'),
                      ),
                    ),
                  ])),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: handleLoginEmail,
                  decoration: const InputDecoration(
                    labelText: 'Correo Electronico',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: isObscure,
                  controller: handleLoginPassword,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
                    border: const UnderlineInputBorder(),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Ir a Recuperar contraseña');
                      },
                      child: const Text(
                        '¿Olvidaste la contraseña?',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15, fontFamily: 'Roboto-Bold'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFef7c21),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Iniciar Sesion',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    
                    await buttonLogin(handleLoginEmail.text, handleLoginPassword.text);
                    String checkToken = TokenProvider().getToken();

                    if (checkToken.length > 0) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    }

                    //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

                    //buttonLogin();

                    /*
                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(handleLoginEmail.text);

                    if (emailValid == true) {
                      if (testMail != handleLoginEmail.text) {
                        showDialog(
                          context: context,
                          builder: (builder_context) => AlertDialog(
                            title: const Text("Login Incorrecto"),
                            content: const Text("El usuario no se encuentra registrado, revisa tu correo o tu contraseña"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(builder_context).pop();
                                },
                                child: Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(14),
                                  child: const Text("ACEPTAR"),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (builder_context) => AlertDialog(
                          title: const Text("Email Incorrecto"),
                          content: const Text("Revisa el formato de tu correo por favor"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(builder_context).pop();
                              },
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(14),
                                child: const Text("ACEPTAR"),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    */
                  },
                ),
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 151, 148, 146),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Iniciar Sesion como Invitado',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    /*
                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(handleLoginEmail.text);

                    if (emailValid == true) {
                      if (testMail != handleLoginEmail.text) {
                        showDialog(
                          context: context,
                          builder: (builder_context) => AlertDialog(
                            title: const Text("Login Incorrecto"),
                            content: const Text("El usuario no se encuentra registrado, revisa tu correo o tu contraseña"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(builder_context).pop();
                                },
                                child: Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(14),
                                  child: const Text("ACEPTAR"),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (builder_context) => AlertDialog(
                          title: const Text("Email Incorrecto"),
                          content: const Text("Revisa el formato de tu correo por favor"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(builder_context).pop();
                              },
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(14),
                                child: const Text("ACEPTAR"),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    */
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿No tienes una cuenta?',
                    style: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontFamily: 'Roboto', fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      final route = MaterialPageRoute(builder: (context) => const RegisterScreen());
                      Navigator.push(context, route);
                    },
                    child: const Text(
                      'Registrate ahora',
                      style: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontFamily: 'Roboto', fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
