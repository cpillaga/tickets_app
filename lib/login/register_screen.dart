import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tickets_app/http/register_api.dart';
import 'package:tickets_app/login/login_screen.dart';

import 'components/conditions_component.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterAPI api = RegisterAPI();

  TextEditingController handleRegisterNombre = TextEditingController();
  TextEditingController handleRegisterTelefono = TextEditingController();
  TextEditingController handleRegisterEmail = TextEditingController();
  TextEditingController handleRegisterPassword = TextEditingController();
  TextEditingController handleConfirmPassword = TextEditingController();

  bool isObscurePassword = false;
  bool isObscureConfirm = false;
  bool checkTerms = false;
  bool flagValue = false;

  bool botonState = false;

  Future<void> buttonRegister(String name, String phone, String email, String password) async {
    try {
      // ignore: unused_local_variable
      Map<dynamic, dynamic> response = await api.handleCreate(name, phone, email, password);
      setState(() {
        flagValue = true;
      });
    } catch (e) {}
  }

  void buttonAcceptModal() {
    setState(() {
      botonState = true;
      checkTerms = true;
    });
  }

  void buttonRejectModal() {
    setState(() {
      botonState = false;
      checkTerms = false;
    });
  }

  @override
  void initState() {
    super.initState();
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
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      child: const Text('Regístrate ahora',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            fontFamily: 'Roboto-Black',
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      //padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Bienvenido, ingresa tu información',
                        style: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontWeight: FontWeight.w400, fontSize: 14, fontFamily: 'Roboto-Black'),
                      ),
                    ),
                  ])),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: handleRegisterEmail,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
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
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: handleRegisterNombre,
                  decoration: const InputDecoration(
                    labelText: 'Nombre y Apellido',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
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
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: handleRegisterTelefono,
                  decoration: const InputDecoration(
                    labelText: 'Telefono/Celular',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
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
                  obscureText: isObscurePassword,
                  controller: handleRegisterPassword,
                  decoration: InputDecoration(
                    labelText: 'Crear contraseña',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
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
              Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextField(
                  obscureText: isObscureConfirm,
                  controller: handleConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirmar contraseña',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 136, 136, 136), fontFamily: 'Roboto-Medium', fontSize: 16, fontWeight: FontWeight.w300),
                    border: const UnderlineInputBorder(),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(isObscureConfirm ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isObscureConfirm = !isObscureConfirm;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: checkTerms,
                          activeColor: Colors.black,
                          onChanged: (bool? value) {
                            setState(() {
                              checkTerms = value!;
                              botonState = true;
                            });

                            
                            if (checkTerms == false) {
                              setState(() {
                                botonState = false;
                              });
                            } 
                            
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            termsDialog(context, buttonAcceptModal, buttonRejectModal, false);
                          },
                          child: Text(
                            'Acepto términos y condiciones',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                        )
                        /*
                        const Text(
                          'Acepto términos y condiciones',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15, fontFamily: 'Roboto-Bold'),
                        ),
                        */
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFef7c21),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: botonState == true
                        ? () async {
                            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(handleRegisterEmail.text);

                            if (handleRegisterEmail.text.isEmpty || handleRegisterNombre.text.isEmpty || handleRegisterTelefono.text.isEmpty || handleRegisterPassword.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Debe completar todos los campos')),
                              );
                              return;
                            }

                            if (!checkTerms) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Debe aceptar los términos y condiciones')),
                              );
                              return;
                            }

                            if (handleRegisterPassword.text != handleConfirmPassword.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Las contraseñas no coinciden')),
                              );
                              return;
                            }

                            if (emailValid == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('El formato del correo es incorrecto')),
                              );
                              return;
                            }

                            await buttonRegister(handleRegisterNombre.text, handleRegisterTelefono.text, handleRegisterEmail.text, handleRegisterPassword.text);

                            if (flagValue == true) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                            } else {
                            }
                          }
                        : null,
                    child: const Text(
                      'Registrar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
