// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, deprecated_member_use, no_leading_underscores_for_local_identifiers, avoid_print, unnecessary_string_interpolations, unused_field, use_build_context_synchronously, unused_local_variable, depend_on_referenced_packages, non_constant_identifier_names, must_be_immutable, empty_catches, unred_type_equality_checks, unnecessary_null_comparison, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';

import '../provider/provider_creer_compte.dart';
import '../provider/serac.dart';
import '../random_digit.dart';
import 'connexion.dart';
import 'verify_user_email.dart';

class RegisterPage extends StatelessWidget {
  //To Toggle Password Text Visibility.

  String sexe = "Masculin";
  String nom = "";
  String prenom = "";
  String date_naissance = "";
  String email = "";
  String telephone = "";
  String password = "";
  String confirm_password = "";
  bool is_password = true;
  bool is_confirm = true;
  bool existe_user = true;

  bool affiche = false;
  int _code = 0;

  String dateSelectionned = "";

  //For the loading state.

  TextEditingController _date = TextEditingController();
  TextEditingController nom_user = TextEditingController();
  TextEditingController prenom_user = TextEditingController();
  final DateTime timestamp = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _providder = Provider.of<providerCreerCompte>(context);
    final _affiche = Provider.of<Search>(context);

    affiche = _affiche.val;
    nom = _providder.nom;
    prenom = _providder.prenom;
    sexe = _providder.sexe;
    telephone = _providder.telephone;
    email = _providder.email;
    date_naissance = _providder.date_naissance;
    password = _providder.password;
    confirm_password = _providder.password_confirm;
    is_password = _providder.is_password;
    is_confirm = _providder.is_confirm;
    TextEditingController _email = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.green.shade800,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: (() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => LoginPage())));
              }),
              child: Text(
                "Login",
                style: GoogleFonts.alike(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(170.0),
          child: Image.asset(
            "images/icon.jpeg",
            height: 1,
            width: 1,
            scale: 0.001,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Créer le compte",
          style: GoogleFonts.alike(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        // centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("images/informatique.jpg"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Créer votre compte",
                textAlign: TextAlign.center,
                style: GoogleFonts.alike(color: Colors.white, fontSize: 19),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 2,
                  width: 40,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Saisissez votre nom",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: nom_user,
                onChanged: (value) {
                  _providder.change_nom(value, nom_user);
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                nom.isEmpty ? Colors.redAccent : Colors.blue)),
                    fillColor: Colors.white,
                    filled: true,
                    labelStyle: GoogleFonts.lato(color: Colors.white),
                    hintStyle: GoogleFonts.lato(color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Saisissez votre prénom",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: prenom_user,
                onChanged: (value) {
                  _providder.change_prenom(value, prenom_user);
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: prenom.isEmpty
                                ? Colors.redAccent
                                : Colors.blue)),
                    fillColor: Colors.white,
                    filled: true,
                    labelStyle: GoogleFonts.lato(color: Colors.white),
                    hintStyle: GoogleFonts.lato(color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Votre adresse E-Mail",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                onChanged: (value) {
                  _providder.change_email(value);
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: email.isEmpty || !email.contains("@")
                          ? Colors.redAccent
                          : Colors.blue,
                    )),
                    fillColor: Colors.white,
                    filled: true,
                    labelStyle: GoogleFonts.lato(color: Colors.white),
                    hintStyle: GoogleFonts.lato(color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Choisissez votre sexe",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(color: Colors.green.shade900),
                  child: DropdownButton<String>(
                      value: sexe,
                      iconSize: 0.0,
                      elevation: 16,
                      isDense: true,
                      items: <String>['Masculin', 'Féminin']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (newValue) {
                        _providder.change_sexe(newValue!);
                      }),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Saisissez votre numéro",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                onChanged: (value) {
                  _providder.change_telephone(value);
                },
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: telephone.isEmpty || telephone.length < 8
                                ? Colors.redAccent
                                : Colors.blue)),
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: GoogleFonts.lato(color: Colors.black),
                    labelStyle: GoogleFonts.lato(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Votre date de naissance",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _date,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: GoogleFonts.lato(color: Colors.black),
                    labelStyle: GoogleFonts.lato(color: Colors.white)),
                readOnly: true,
                onTap: () async {
                  var dateSelectionned = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));

                  if (dateSelectionned != null) {
                    String formatDate =
                        DateFormat('dd-MM-yyyy').format(dateSelectionned);
                    _date.text = formatDate;

                    _providder.change_date_naissance(formatDate);
                    // ignore: curly_braces_in_flow_control_structures
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Saisissez votre mot de passe",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                obscuringCharacter: "*",
                onTap: () {
                  _speak(
                      "Saisissez un mot de passe d'au moins 8 caractères sécurisé");
                },
                onChanged: (value) {
                  _providder.change_password(value);
                },
                obscureText: is_password,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _providder.change_is_assword();
                    },
                    child: Icon(
                      is_password ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: GoogleFonts.lato(color: Colors.black),
                  labelStyle: GoogleFonts.lato(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: password.isEmpty || password.length < 8
                              ? Colors.redAccent
                              : Colors.blue)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Confirmez votre mot de passe",
                textAlign: TextAlign.justify,
                style: GoogleFonts.alike(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                obscuringCharacter: "*",
                onChanged: (value) {
                  _providder.change_password_confirmation(value);
                },
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: GoogleFonts.lato(color: Colors.black),
                  labelStyle: GoogleFonts.lato(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: confirm_password.length < 8 ||
                                  password != confirm_password
                              ? Colors.redAccent
                              : Colors.blue)),
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        textStyle: TextStyle()),
                    // ignore: sort_child_properties_last
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: affiche
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                color: Colors.cyanAccent,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Créer votre compte".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.alike(color: Colors.white),
                              ),
                            ),
                    ),
                    onPressed: () async {
                      _affiche.puttrue();
                      try {
                        if (nom.isEmpty ||
                            prenom.isEmpty ||
                            email.isEmpty ||
                            !email.contains("@") ||
                            nom.length < 2 ||
                            prenom.length < 2 ||
                            telephone.isEmpty ||
                            telephone.length != 8 ||
                            sexe.isEmpty ||
                            date_naissance.isEmpty ||
                            password.isEmpty ||
                            password.length < 8 ||
                            confirm_password.isEmpty ||
                            confirm_password.length < 8 ||
                            password != confirm_password) {
                          _speak(
                              "vérifiez si vous avez bien saisi tous les champs.");

                          _affiche.putfalse();

                          final snakbar = SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Tous les champs n'ont pas été renseigné ou l'une des informations a été mal renseigné. Veuillez réessayez svp!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            backgroundColor: Colors.redAccent.withOpacity(.8),
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snakbar);
                        } else {
                          _code = RandomDigits.getInteger(5);

                          String username = 'marcellindeveloppeur@gmail.com';
                          String _password = 'wturjftonwajralt';

                          final smtpServer = gmail(username, _password);
                          // Use the SmtpServer class to configure an SMTP server:
                          // final smtpServer = SmtpServer('smtp.domain.com');
                          // See the named arguments of SmtpServer for further configuration
                          // options.

                          // Create our message.
                          final message = Message()
                            ..from = Address(username, 'Déo Gracias Entreprise')
                            ..recipients.add(email.trim())
                            ..ccRecipients
                            //.addAll(['destCc1@example.com', 'destCc2@example.com'])
                            //..bccRecipients.add(Address('bccAddress@example.com'))
                            ..subject = "Validation de l'adresse e-mail"
                            // ignore: prefer_interpolation_to_compose_strings
                            ..text = " " +
                                _code.toString().toUpperCase() +
                                " \n Veuillez saisir ce code dans un bref dèlai";
                          //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

                          final sendReport = await send(message, smtpServer);

                          _speak(
                              "Un code à 5 chiffres a été envoyé sur l'adresse mail saisi. Consulter votre boite mail et renseignez le . Merci");
                          _affiche.putfalse();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => ValidateUserEmail(
                                      email: email,
                                      user_nom: nom,
                                      user_prenom: prenom,
                                      code: _code,
                                      user_telephone: telephone,
                                      user_date_naissance: date_naissance,
                                      sexe: sexe,
                                      user_password: password))));
                        }
                      } catch (e) {
                        _speak("Une erreur s'est produite ");
                        _affiche.putfalse();

                        final snakbar = SnackBar(
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Une erreur inattendue s'est produite pendant cette opération. Vérifiez votre connection internet et réessayez !",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          backgroundColor: Colors.redAccent.withOpacity(.8),
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snakbar);
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text(
                  "Avrez vous déjà un compte ?",
                  style: GoogleFonts.alike(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: Colors.white,
                        style: BorderStyle.solid)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SizedBox(
                    height: 59,
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginPage())));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            "Connectez vous maintenant",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.alike(
                                color: Colors.white, fontSize: 22),
                          ),
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 72,
            ),
          ],
        ),
      ),
    );
  }
}

Future _speak(String text) async {
  final FlutterTts _flutter_tts = FlutterTts();
  _flutter_tts.setLanguage("Fr");
  _flutter_tts.setSpeechRate(0.5);
  _flutter_tts.setVolume(0.5);
  _flutter_tts.setPitch(1.0);
  _flutter_tts.speak(text);
}
