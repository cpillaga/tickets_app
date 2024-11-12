import 'package:flutter/material.dart';
import 'package:tickets_app/http/login_api.dart';
import 'package:tickets_app/login/register_screen.dart';
import 'package:tickets_app/models/token_provider.dart';
import 'package:tickets_app/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final LoginAPI api = LoginAPI();

  TextEditingController handleLoginEmail = TextEditingController();
  TextEditingController handleLoginPassword = TextEditingController();

  bool loading = false;
  bool isObscure = true;
  bool checkRemember = true;

  late bool correctLogin = false;

  late bool emailError = false;
  late bool passwordError = false;

  late String message = '';

  Future<void> buttonLogin(String email, String password) async {
    try {
      Map<String, dynamic> response = await api.handleSesion(email, password);

      if (response.containsKey('token') && response['token'].isNotEmpty) {

        await TokenProvider().setToken(response['token']);
        await TokenProvider().setIdUser(response['userId']);
        setState(() {
          correctLogin = true;
        });

      } 
      else {
        setState(() {
          correctLogin = false;
        });
      }
    } 
    catch (e) {
      setState(() {
        correctLogin = false;
      });
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
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(children: [
                    SizedBox(
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
                  padding: const EdgeInsets.only(top: 15, bottom: 20),
                  child: Column(children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Text('Bienvenido',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        'Por favor, introduce tus datos',
                        style: GoogleFonts.poppins(color: const Color.fromARGB(255, 136, 136, 136), fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                  ])),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextField(
                  controller: handleLoginEmail,
                  decoration: InputDecoration(
                    //labelText: emailError == true ? 'Ups! No se ha encontrado el correo' : 'Correo Electronico',
                    labelText: 'Correo Electronico',
                    labelStyle: GoogleFonts.poppins(color: const Color.fromARGB(255, 136, 136, 136), fontSize: 15, fontWeight: FontWeight.w400),
                    border: const UnderlineInputBorder(),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
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
                    labelStyle: GoogleFonts.poppins(color: const Color.fromARGB(255, 136, 136, 136), fontSize: 15, fontWeight: FontWeight.w400),
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
                      },
                      child: Text(
                        '¿Olvidaste la contraseña?',
                        style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),
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
                  child: loading
                      ? const Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                        )
                      : Text(
                          'Iniciar Sesion',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                  onPressed: () async {
                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(handleLoginEmail.text);

                    if (handleLoginEmail.text.isEmpty || handleLoginPassword.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Debe completar todos los campos')),
                      );
                      return;
                    }

                    if (emailValid == false) {
                      setState(() {
                        emailError = true;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('El formato del correo es incorrecto')),
                      );
                      return;
                    }

                    setState(() {
                      loading = true;
                    });

                    await buttonLogin(handleLoginEmail.text, handleLoginPassword.text);
                    String checkToken = TokenProvider().getToken();

                    if (correctLogin == true) {
                      if (checkToken.length > 0) {
                        setState(() {
                          loading = false;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Ingreso correcto')),
                        );

                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                        return;
                      }
                    } else {
                      setState(() {
                        emailError = true;
                        passwordError = true;
                        loading = false;
                      });
                      
                      showDialog(
                        context: context,
                        builder: (builder_context) => Dialog(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.mood_bad, 
                                  color: Colors.red,
                                  size: 100,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "ERROR!",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20, 
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center, 
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Ups! El correo electrónico o la contraseña son incorrectos",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14, 
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center, // Centra el texto
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Por favor, inténtalo de nuevo",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14, 
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  //width: MediaQuery.of(context).size.width * 0.3,
                                  width: 91,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(builder_context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                                    ),
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                    }
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
                  child: Text(
                    'Iniciar Sesion como Invitado',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No tienes una cuenta?',
                    style: GoogleFonts.poppins(color: Color.fromARGB(255, 136, 136, 136), fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                    },
                    child: Text(
                      'Registrate ahora',
                      style: GoogleFonts.poppins(color: Color.fromARGB(255, 136, 136, 136), fontWeight: FontWeight.w600),
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
