import 'package:flutter/material.dart';

const String title = 'Términos y Condiciones de la plataforma 1800 eventos';

const String subt1 = '1. Aceptación de los Términos';
const String parrafo1 = 'Al acceder y utilizar la plataforma 1800 eventos, usted acepta cumplir con estos Términos y Condiciones. Si no está de acuerdo con alguno de estos términos, no debe utilizar la plataforma.';

const String subt2 = '2. Descripción del servicio';
const String parrafo2 = '1800 eventos es una plataforma que permite a los organizadores de eventos publicar sus eventos y a los usuarios comprar entradas digitales para dichos eventos. La plataforma genera un código QR único para cada entrada, que se utiliza para el control de acceso al evento.';

const String subt3 = '3. Registro de usuarios';
const String parrafo3 = 'Para utilizar la plataforma, los usuarios deben registrarse proporcionando información precisa y completa. Los usuarios son responsables de mantener la confidencialidad de su cuenta y contraseña.';

const String subt4 = '4. Publicación de eventos';
const String parrafo4 = 'Los organizadores de eventos son responsables de la información que publican en la plataforma, incluyendo la descripción del evento, la fecha, la hora, el lugar y el precio de las entradas.';

const String subt5 = '5. Compra de entradas';
const String parrafo5 = 'Los usuarios pueden comprar entradas a través de la plataforma utilizando los métodos de pago disponibles. Las entradas no son reembolsables, a menos que el evento sea cancelado.';

const String subt6 = '6. Uso de códigos QR';
const String parrafo6 = 'Cada entrada tiene un código QR único que se utilizará para el control de acceso al evento. Los códigos QR pueden ser transferibles, sin embargo, es responsabilidad del usuario que adquirió la entrada el uso del código QR de la entrada adquirida, por lo que en el caso de que otra persona haga uso del código QR antes que el usuario que adquirió la entrada, este último no podrá hacer uso del mismo y no podrá ingresar al evento, sin responsabilidad de la plataforma 1800 eventos.';

const String subt7 = '7. Comportamiento del usuario';
const String parrafo7 = 'Los usuarios se comprometen a utilizar la plataforma de forma responsable y a no realizar acciones que puedan afectar a otros usuarios o a la plataforma.';

const String subt8 = '8. Propiedad intelectual';
const String parrafo8 = 'La plataforma y su contenido son propiedad de 1800 eventos y están protegidos por las leyes de propiedad intelectual.';

const String subt9 = '9. Limitación de responsabilidad';
const String parrafo9 = '1800 eventos no se hace responsable de los daños o pérdidas que puedan surgir del uso de la plataforma.';

const String subt10 = '10. Modificaciones de los términos';
const String parrafo10 = '1800 eventos se reserva el derecho de modificar estos Términos y Condiciones en cualquier momento.';

const String subt11 = '11. Política de Privacidad';
const String parrafo11 = '1800 eventos se compromete a proteger la privacidad de los usuarios y a utilizar su información personal de acuerdo con las leyes de protección de datos aplicables. La información personal de los usuarios se utilizará únicamente para los fines para los que fue recopilada, como la gestión de la cuenta, la compra de entradas y el envío de comunicaciones relacionadas con los eventos.';

const String parrafo12 = '1800 eventos no compartirá la información personal de los usuarios con terceros, excepto cuando sea necesario para cumplir con las leyes aplicables o para prestar los servicios solicitados por los usuarios.';

const String parrafo13 = 'Los usuarios tienen derecho a acceder, editar su información personal e inhabilitar su cuenta con sus datos en cualquier momento.';

void termsDialog(BuildContext context, Function buttonAcceptModal, Function buttonRejectModal, bool enPerfil) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (builder_context) => Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt3,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo3,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt4,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo4,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt5,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo5,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt6,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo6,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt7,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo7,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt8,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo8,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt9,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo9,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt10,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo10,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        subt11,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo11,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo12,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Text(
                      parrafo13,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                if(enPerfil == true)...[

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () {
                        buttonAcceptModal();
                        Navigator.of(builder_context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                  )

                ]
                else...[

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () {
                        buttonRejectModal();
                        Navigator.of(builder_context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      ),
                      child: const Text(
                        "Rechazar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ElevatedButton(
                      onPressed: () {
                        buttonAcceptModal();
                        Navigator.of(builder_context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      ),
                      child: const Text(
                        "Aceptar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )

                ],

              ],
            ),
          ],
        ),
      ),
    ),
  );
}
