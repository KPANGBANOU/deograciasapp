// ignore_for_file: unused_local_variable, prefer_const_constructors, curly_braces_in_flow_control_structures, unnecessary_null_comparison, dead_code, prefer_typing_uninitialized_variables, unred_type_equality_checks, prefer_final_fields, unused_field, must_be_immutable, unused_import, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_print, non_constant_identifier_names, avoid_function_literals_in_foreach_calls, prefer_const_declarations, import_of_legacy_library_into_null_safe, deprecated_member_use, unused_catch_clause

import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cron/cron.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:whatsapp/whatsapp.dart';

import '../modele/bieere_petit_model.dart';
import '../modele/bierre_grand_model.dart';
import '../modele/centre_vente.dart';
import '../modele/credit.dart';
import '../modele/produit.dart';
import '../modele/rapport.dart';
import '../modele/serigraphie.dart';
import '../modele/vente_credit.dart';
import '../modele/vente_grand_modele.dart';
import '../modele/vente_petit_modele.dart';
import '../modele/vente_tee_shirts.dart';
import '../services/user.dart';
import 'Bar_restaurant/accueil_servant_bar.dart';
import 'accueil.dart';
import 'accuel_gerant.dart';
import 'centre_informatique/accueil_servant_centre.dart';
import 'home.dart';
import 'loader.dart';
import 'suppression_compte.dart';
import 'welcome_default.dart';

class Wrapper extends StatefulWidget {
  Wrapper({key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String _credit_nom = "";

  double _benefice_total_credit = 0;

  int montant_vendu_credit = 0;
  int mois = 0;

  Timestamp dt = Timestamp.now();

  String _current_vente_day = "";

  String _current_vente_month = "";

  int _total_vente_credit = 0;

  int montant_total_vente_credit = 0;

  int total_quantite_tee_shirt = 0;

  int montant_vente_tee_shirt = 0;

  int total_benefice_tee_shirt = 0;

  int montant_total_vente_tee_shirt = 0;

  int total_quantite_produits = 0;

  int montant_vente_produits = 0;

  int total_benefice_produits = 0;

  int montant_total_vente_produits = 0;

  int total_quantite_grand_modele = 0;

  int montant_vente_grand_modele = 0;

  int total_benefice_grand_modele = 0;

  int montant_total_vente_grand_modele = 0;

  int total_quantite_petit_modele = 0;

  int montant_vente_petit_modele = 0;
  int nombre_second = 0;

  int total_benefice_tee_petit_modele = 0;

  int montant_total_vente_petit_modele = 0;

  double totaux_benefice = 0;

  int totaux_vente = 0;
  int nombre_vente_credit = 0;
  int nombre_vente_produit = 0;
  int nombre_vente_tee_shirt = 0;
  int nombre_vente_grand_modele = 0;
  int nombre_vente_petit_modele = 0;
  int nbr_credit = 0;
  int nbre_grand_modele = 0;
  int nbre_petit_modele = 0;
  int nbre_tee_shirt = 0;
  int nbre_produit = 0;

  @override
  Widget build(BuildContext context) {
    String day = DateFormat("dd").format(dt.toDate());
    int today = int.parse(day);
    String month = DateFormat("MM-yyyy").format(dt.toDate());
    String mois_recent = DateFormat("MM").format(dt.toDate());

    String _current_day = DateFormat('yyyy-MM-dd').format(dt.toDate());
    String current_day = DateFormat('dd-MM-yyyy').format(dt.toDate());

    String _current_month = DateFormat('yyyy-MM').format(dt.toDate());
    String annee = DateFormat('yyyy').format(dt.toDate());
    final _list_vente_credits = Provider.of<List<venteCredit>>(context);
    final _list_vente_tee_shirts = Provider.of<List<venteteeshirts>>(context);
    final _list_vente_produits = Provider.of<List<centreVente>>(context);
    final _rapport = Provider.of<rapport>(context);
    final _list_vente_petit_modele =
        Provider.of<List<ventePetitModele>>(context);
    final _list_vente_grand_modele =
        Provider.of<List<venteGrandModele>>(context);
    final _pdf = pw.Document();
    final _cron = Cron();
    final firebase = Provider.of<Utilisateur?>(context);
    final _donnnes = Provider.of<donnesUtilisateur>(context);
    final _list_credits = Provider.of<List<credit>>(context);
    final _list_tee_shirt = Provider.of<List<serigraphie>>(context);
    final _list_bierres_petit_modele =
        Provider.of<List<donneesBieerePetitModele>>(context);
    final _list_produits_centre = Provider.of<List<products>>(context);
    final _list_bierres_grand_modele =
        Provider.of<List<donnesBierresGrandModel>>(context);
    mois = mois_recent.isNotEmpty ? int.parse(mois_recent) : 0;

    Timer.periodic(Duration(seconds: 1), (timer) {
// tee shirts
      _list_tee_shirt.forEach((element) async {
        if (element.quantite_physique < element.seuil_approvisionnement &&
            element.approvisionne == false) {
          try {
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
              ..recipients.add(_rapport.email_rapport)
              ..ccRecipients
              //.addAll(['destCc1@example.com', 'destCc2@example.com'])
              //..bccRecipients.add(Address('bccAddress@example.com'))
              ..subject =
                  'Démande de réchargement de stock de ' + element.tee_shirt_nom
              ..text = "Le stock du tee shirt " +
                  element.tee_shirt_nom +
                  " est en dessous du seuil d'approvisionnement. Il ne reste que " +
                  element.quantite_physique.toString() +
                  " en stock. Le réchargement de ce tee shirt est donc nécessaire";
            //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

            final sendReport = await send(message, smtpServer);
            print('Message sent: ' + sendReport.toString());
            await FirebaseFirestore.instance
                .collection("tee_shirts")
                .doc(element.uid)
                .update({"approvisionne": true});
          } on MailerException catch (e) {
            print('Message not sent.');
          }
        }
      });

      // produits

      _list_produits_centre.forEach((element) async {
        if (element.quantite_physique < element.seuil_approvisionnement &&
            element.approvisionne == false) {
          try {
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
              ..recipients.add(_rapport.email_rapport.trim())
              ..ccRecipients
              //.addAll(['destCc1@example.com', 'destCc2@example.com'])
              //..bccRecipients.add(Address('bccAddress@example.com'))
              ..subject = 'Démande de réchargement de stock de ' + element.nom
              ..text = "Le stock du produit " +
                  element.nom +
                  " est en dessous du seuil d'approvisionnement. Il ne reste que " +
                  element.quantite_physique.toString() +
                  " en stock. Le réchargement de ce produit est donc nécessaire";
            //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

            final sendReport = await send(message, smtpServer);
            print('Message sent: ' + sendReport.toString());
            await FirebaseFirestore.instance
                .collection("produits_centre")
                .doc(element.uid)
                .update({"approvisionne": true});
          } on MailerException catch (e) {
            print('Message not sent.');
          }
        }
      });

      // credits

      _list_credits.forEach((element) async {
        if (element.montant_disponible < element.seuil_approvisionnement &&
            element.approvisionne == false) {
          try {
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
              ..recipients.add(_rapport.email_rapport.trim())
              ..ccRecipients
              //.addAll(['destCc1@example.com', 'destCc2@example.com'])
              //..bccRecipients.add(Address('bccAddress@example.com'))
              ..subject = 'Démande de réchargement de stock de ' + element.nom
              ..text = "Le stock du crédit " +
                  element.nom +
                  " est en dessous du seuil d'approvisionnement. Il ne reste que " +
                  element.montant_disponible.toString() +
                  " F en stock. Le réchargement de ce crédit est donc nécessaire";
            //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

            final sendReport = await send(message, smtpServer);
            print('Message sent: ' + sendReport.toString());
            await FirebaseFirestore.instance
                .collection("reseaux_communication")
                .doc(element.uid)
                .update({"approvisionne": true});
          } on MailerException catch (e) {
            print('Message not sent.');
          }
        }
      });

      // grand_modele

      _list_bierres_grand_modele.forEach((element) async {
        if (element.quantite_physique < element.seuil_approvisionnement &&
            element.approvisionne == false) {
          try {
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
              ..recipients.add(_rapport.email_rapport.trim())
              ..ccRecipients
              //.addAll(['destCc1@example.com', 'destCc2@example.com'])
              //..bccRecipients.add(Address('bccAddress@example.com'))
              ..subject =
                  'Démande de réchargement de stock du bièrre ' + element.nom
              ..text = "Le stock du bièrre grand modèle " +
                  element.nom +
                  " est en dessous du seuil d'approvisionnement. Il ne reste que " +
                  element.quantite_physique.toString() +
                  " en stock. Le réchargement de cette bièrre est donc nécessaire";
            //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

            final sendReport = await send(message, smtpServer);
            print('Message sent: ' + sendReport.toString());
            await FirebaseFirestore.instance
                .collection("bierres_grand_modele")
                .doc(element.uid)
                .update({"approvisionne": true});
          } on MailerException catch (e) {
            print('Message not sent.');
          }
        }
      });
      // petit modele

      _list_bierres_petit_modele.forEach((element) async {
        if (element.quantite_physique < element.seuil_approvisionnement &&
            element.approvisionne == false &&
            element.uid.isNotEmpty) {
          try {
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
              ..recipients.add(_rapport.email_rapport.trim())
              ..ccRecipients
              //.addAll(['destCc1@example.com', 'destCc2@example.com'])
              //..bccRecipients.add(Address('bccAddress@example.com'))
              ..subject =
                  'Démande de réchargement de stock du bièrre ' + element.nom
              ..text = "Le stock du bièrre pétit modèle modèle " +
                  element.nom +
                  " est en dessous du seuil d'approvisionnement. Il ne reste que " +
                  element.quantite_physique.toString() +
                  " en stock. Le réchargement de cette bièrre est donc nécessaire";
            //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

            final sendReport = await send(message, smtpServer);
            print('Message sent: ' + sendReport.toString());
            await FirebaseFirestore.instance
                .collection("bierres_petit_modele")
                .doc(element.uid)
                .update({"approvisionne": true});
          } on MailerException catch (e) {
            print('Message not sent.');
          }
        }
      });
    });

    _cron.schedule(Schedule.parse('1 20 * * *'), () async {
      try {
        nombre_vente_credit = 0;
        nombre_vente_grand_modele = 0;
        nombre_vente_petit_modele = 0;
        nombre_vente_produit = 0;
        nombre_vente_tee_shirt = 0;
        _benefice_total_credit = 0;
        montant_total_vente_credit = 0;
        montant_vendu_credit = 0;
        total_benefice_tee_shirt = 0;
        total_quantite_tee_shirt = 0;
        montant_vente_tee_shirt = 0;

        total_benefice_produits = 0;
        total_quantite_produits = 0;
        montant_vente_produits = 0;

        total_benefice_grand_modele = 0;
        total_quantite_grand_modele = 0;
        montant_vente_grand_modele = 0;

        total_benefice_tee_petit_modele = 0;
        total_quantite_petit_modele = 0;
        montant_vente_petit_modele = 0;
        totaux_vente = 0;
        totaux_benefice = 0;

        _list_vente_credits.forEach((element) {
          if (element.date_vente == _current_day) {
            montant_total_vente_credit += element.montant;
            nombre_vente_credit++;
            _benefice_total_credit += element.benefice;
          }
        });

        _list_vente_grand_modele.forEach((element) {
          if (element.date_vente == _current_day) {
            montant_total_vente_grand_modele += element.montant;
            nombre_vente_grand_modele++;
            total_benefice_grand_modele += element.benefice;
          }
        });

        _list_vente_petit_modele.forEach((element) {
          if (element.date_vente == _current_day) {
            montant_total_vente_petit_modele += element.montant;
            nombre_vente_petit_modele++;
            total_benefice_tee_petit_modele += element.benefice;
          }
        });

        _list_vente_produits.forEach((element) {
          if (element.date_vente == _current_day) {
            nombre_vente_produit++;
            montant_total_vente_produits += element.montant;
            total_benefice_produits += element.benefice;
          }
        });

        _list_vente_tee_shirts.forEach((element) {
          if (element.date_vente == _current_day) {
            montant_total_vente_tee_shirt += element.montant;
            nombre_vente_tee_shirt++;
            total_benefice_tee_shirt += element.benefice;
          }
        });

        totaux_vente = montant_total_vente_credit +
            montant_total_vente_grand_modele +
            montant_total_vente_petit_modele +
            montant_total_vente_tee_shirt +
            montant_total_vente_produits;
        totaux_benefice = _benefice_total_credit +
            total_benefice_grand_modele +
            total_benefice_tee_petit_modele +
            total_benefice_produits +
            total_benefice_tee_shirt;

        final pdf = pw.Document();
        pdf.addPage(pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            build: ((pw.Context context) {
              return [
                pw.SizedBox(
                  height: 10,
                ),
                pw.Text(
                    "Rapprt de vente de ".toUpperCase() +
                        current_day.toUpperCase(),
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20,
                        color: PdfColors.black)),
                pw.SizedBox(height: 10),
                _list_credits.isNotEmpty && nombre_vente_credit > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text("Vente de crédits".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                          headers: [
                            "Crédit".toUpperCase(),
                            "Montant intial".toUpperCase(),
                            "Montant vendu".toUpperCase(),
                            "Montant restant".toUpperCase(),
                          ],
                          border: pw.TableBorder.all(
                              style: pw.BorderStyle.solid,
                              color: PdfColors.black,
                              width: 2),
                          data: _list_credits.map((_credit) {
                            nbr_credit = 0;
                            montant_vendu_credit = 0;

                            _list_vente_credits.forEach((element) {
                              if (_credit.nom == element.nom &&
                                  element.date_vente == _current_day) {
                                nbr_credit++;
                                montant_vendu_credit += element.montant;
                              }
                            });

                            return nbr_credit > 0
                                ? [
                                    _credit.nom,
                                    _credit.montant_initial.toString() + " F",
                                    montant_vendu_credit.toString() + " F",
                                    _credit.montant_disponible.toString() +
                                        " F",
                                  ]
                                : [];
                          }).toList(),
                        ),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text("Total vente crédit ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_credit.toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_tee_shirt.isNotEmpty && nombre_vente_tee_shirt > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text("Vente de tee shirts".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Tee shirt".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_tee_shirt.map((_tee_shirt) {
                              total_quantite_tee_shirt = 0;
                              nbre_tee_shirt = 0;
                              montant_vente_tee_shirt = 0;

                              _list_vente_tee_shirts.forEach((element) {
                                if (element.nom_tee_shirts ==
                                        _tee_shirt.tee_shirt_nom &&
                                    element.date_vente == _current_day) {
                                  montant_vente_tee_shirt += element.montant;
                                  nbre_tee_shirt++;

                                  total_quantite_tee_shirt += element.quantite;
                                }
                              });

                              return nbre_tee_shirt > 0
                                  ? [
                                      _tee_shirt.tee_shirt_nom,
                                      _tee_shirt.quantite_initial.toString(),
                                      total_quantite_tee_shirt.toString(),
                                      _tee_shirt.quantite_physique.toString(),
                                      _tee_shirt.prix_unitaire_vente
                                              .toString() +
                                          " F",
                                      montant_vente_tee_shirt.toString() + " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text(
                                      "Total vente tee shirt ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_tee_shirt.toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_produits_centre.isNotEmpty && nombre_vente_produit > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text("Vente de produits".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Produit".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_produits_centre.map((_produit) {
                              total_quantite_produits = 0;
                              nbre_produit = 0;
                              montant_vente_produits = 0;

                              _list_vente_produits.forEach((element) {
                                if (element.nom_produit == _produit.nom &&
                                    element.date_vente == _current_day) {
                                  montant_vente_produits += element.montant;
                                  nbre_produit++;

                                  total_quantite_produits += element.quantite;
                                }
                              });

                              return nbre_produit > 0
                                  ? [
                                      _produit.nom,
                                      _produit.quantite_initial.toString(),
                                      total_quantite_produits.toString(),
                                      _produit.quantite_physique.toString(),
                                      _produit.prix_unitaire.toString() + " F",
                                      montant_vente_produits.toString() + " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text("Total vente produits ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_produits.toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_bierres_petit_modele.isNotEmpty &&
                        nombre_vente_petit_modele > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text(
                                "Vente de pétits modèles".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Bièrre".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_bierres_petit_modele.map((_bierre) {
                              total_quantite_petit_modele = 0;
                              nbre_petit_modele = 0;
                              montant_vente_petit_modele = 0;

                              _list_vente_petit_modele.forEach((element) {
                                if (element.nom_bierre == _bierre.nom &&
                                    element.date_vente == _current_day) {
                                  montant_vente_petit_modele += element.montant;
                                  nbre_petit_modele++;

                                  total_quantite_petit_modele +=
                                      element.quantite;
                                }
                              });

                              return nbre_petit_modele > 0
                                  ? [
                                      _bierre.nom,
                                      _bierre.quantite_initial.toString(),
                                      total_quantite_petit_modele.toString(),
                                      _bierre.quantite_physique.toString(),
                                      _bierre.prix_unitaire.toString() + " F",
                                      montant_vente_petit_modele.toString() +
                                          " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text(
                                      "Total vente pétit modèle ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_petit_modele
                                              .toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_bierres_grand_modele.isNotEmpty &&
                        nombre_vente_grand_modele > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text(
                                "Vente de grands modèles".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Bièrre".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_bierres_grand_modele.map((_bierre) {
                              total_quantite_grand_modele = 0;
                              nbre_grand_modele = 0;
                              montant_vente_grand_modele = 0;

                              _list_vente_grand_modele.forEach((element) {
                                if (element.nom_bierre == _bierre.nom &&
                                    element.date_vente == _current_day) {
                                  montant_vente_grand_modele += element.montant;
                                  nbre_grand_modele++;

                                  total_quantite_grand_modele +=
                                      element.quantite;
                                }
                              });

                              return nbre_grand_modele > 0
                                  ? [
                                      _bierre.nom,
                                      _bierre.quantite_initial.toString(),
                                      total_quantite_grand_modele.toString(),
                                      _bierre.quantite_physique.toString(),
                                      _bierre.prix_unitaire.toString() + " F",
                                      montant_vente_grand_modele.toString() +
                                          " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text(
                                      "Total vente grand modèle ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_grand_modele
                                              .toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                pw.Container(
                    width: double.infinity,
                    height: 40,
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisSize: pw.MainAxisSize.max,
                        children: [
                          pw.Text("total de vente de la journéé".toUpperCase(),
                              style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text(totaux_vente.toString() + " F",
                              style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold))
                        ])),
                pw.Container(
                    color: PdfColors.indigo,
                    width: double.infinity,
                    height: 60,
                    child: pw.Padding(
                        padding: pw.EdgeInsets.all(10),
                        child: pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisSize: pw.MainAxisSize.max,
                            children: [
                              pw.Text(
                                  "bénéfice journalière brute".toUpperCase(),
                                  style: pw.TextStyle(
                                      color: PdfColors.white,
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold)),
                              pw.Text(totaux_benefice.floor().toString() + " F",
                                  style: pw.TextStyle(
                                      color: PdfColors.black,
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold))
                            ])))
              ];
            })));

        final path = (await getExternalStorageDirectory())!.path;

        final _file1 = File('$path/rapport_journalier.pdf');
        await _file1.writeAsBytes(
          await pdf.save(),
        );

        String username = 'marcellindeveloppeur@gmail.com';
        String _password = 'wturjftonwajralt';

        final smtpServer = gmail(username, _password);

        final equivalentMessage = Message()
          ..from = Address(username, 'Entreprise Déo Gracias')
          ..recipients.add(Address(_rapport.email_rapport.trim()))
          ..ccRecipients
          ..subject = 'Rapport de vente du ' + current_day
          ..text =
              'Bonsoir Monsieur le PDG de  Déo Gracias. Voici le rapport journalier de vente au niveau du centre informatique et du bar restaurant de ce  jour ' +
                  current_day
          ..attachments = [
            FileAttachment(_file1)
              ..location = Location.inline
              ..cid = 'rapport_journalier.pdf'
          ];

        final sendReport2 = await send(equivalentMessage, smtpServer);



        
        print('Message sent: ' + sendReport2.toString());

        print("pdf");
      } catch (e) {
        print(e);
      }
    });

    // Rapport mensuel

    _cron.schedule(Schedule.parse('0 20 28 * *'), () async {
      try {
        nombre_vente_credit = 0;
        nombre_vente_grand_modele = 0;
        nombre_vente_petit_modele = 0;
        nombre_vente_produit = 0;
        nombre_vente_tee_shirt = 0;
        _benefice_total_credit = 0;
        montant_total_vente_credit = 0;
        montant_vendu_credit = 0;
        total_benefice_tee_shirt = 0;
        total_quantite_tee_shirt = 0;
        montant_vente_tee_shirt = 0;

        total_benefice_produits = 0;
        total_quantite_produits = 0;
        montant_vente_produits = 0;

        total_benefice_grand_modele = 0;
        total_quantite_grand_modele = 0;
        montant_vente_grand_modele = 0;

        total_benefice_tee_petit_modele = 0;
        total_quantite_petit_modele = 0;
        montant_vente_petit_modele = 0;
        totaux_vente = 0;
        totaux_benefice = 0;

        _list_vente_credits.forEach((element) {
          if (element.date_vente_month == _current_month) {
            montant_total_vente_credit += element.montant;
            nombre_vente_credit++;
            _benefice_total_credit += element.benefice;
          }
        });

        _list_vente_grand_modele.forEach((element) {
          if (element.date_vente_month == _current_month) {
            montant_total_vente_grand_modele += element.montant;
            nombre_vente_grand_modele++;
            total_benefice_grand_modele += element.benefice;
          }
        });

        _list_vente_petit_modele.forEach((element) {
          if (element.date_vente_month == _current_month) {
            montant_total_vente_petit_modele += element.montant;
            nombre_vente_petit_modele++;
            total_benefice_tee_petit_modele += element.benefice;
          }
        });

        _list_vente_produits.forEach((element) {
          if (element.vente_month == _current_month) {
            nombre_vente_produit++;
            montant_total_vente_produits += element.montant;
            total_benefice_produits += element.benefice;
          }
        });

        _list_vente_tee_shirts.forEach((element) {
          if (element.date_vente_month == _current_month) {
            montant_total_vente_tee_shirt += element.montant;
            nombre_vente_tee_shirt++;
            total_benefice_tee_shirt += element.benefice;
          }
        });

        totaux_vente = montant_total_vente_credit +
            montant_total_vente_grand_modele +
            montant_total_vente_petit_modele +
            montant_total_vente_tee_shirt +
            montant_total_vente_produits;
        totaux_benefice = _benefice_total_credit +
            total_benefice_grand_modele +
            total_benefice_tee_petit_modele +
            total_benefice_produits +
            total_benefice_tee_shirt;

        final pdf = pw.Document();
        pdf.addPage(pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            build: ((pw.Context context) {
              return [
                pw.SizedBox(
                  height: 10,
                ),
                pw.Text(
                    "Rapprt de vente du mois  ".toUpperCase() +
                        month.toUpperCase(),
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20,
                        color: PdfColors.black)),
                pw.SizedBox(height: 10),
                _list_credits.isNotEmpty && nombre_vente_credit > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text("Vente de crédits".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                          headers: [
                            "Crédit".toUpperCase(),
                            "Montant intial".toUpperCase(),
                            "Montant vendu".toUpperCase(),
                            "Montant restant".toUpperCase(),
                          ],
                          border: pw.TableBorder.all(
                              style: pw.BorderStyle.solid,
                              color: PdfColors.black,
                              width: 2),
                          data: _list_credits.map((_credit) {
                            nbr_credit = 0;
                            montant_vendu_credit = 0;

                            _list_vente_credits.forEach((element) {
                              if (_credit.nom == element.nom &&
                                  element.date_vente_month == _current_month) {
                                nbr_credit++;
                                montant_vendu_credit += element.montant;
                              }
                            });

                            return nbr_credit > 0
                                ? [
                                    _credit.nom,
                                    _credit.montant_initial.toString() + " F",
                                    montant_vendu_credit.toString() + " F",
                                    _credit.montant_disponible.toString() +
                                        " F",
                                  ]
                                : [];
                          }).toList(),
                        ),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text("Total vente crédit ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_credit.toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_tee_shirt.isNotEmpty && nombre_vente_tee_shirt > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text("Vente de tee shirts".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Tee shirt".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_tee_shirt.map((_tee_shirt) {
                              total_quantite_tee_shirt = 0;
                              nbre_tee_shirt = 0;
                              montant_vente_tee_shirt = 0;

                              _list_vente_tee_shirts.forEach((element) {
                                if (element.nom_tee_shirts ==
                                        _tee_shirt.tee_shirt_nom &&
                                    element.date_vente_month ==
                                        _current_month) {
                                  montant_vente_tee_shirt += element.montant;
                                  nbre_tee_shirt++;

                                  total_quantite_tee_shirt += element.quantite;
                                }
                              });

                              return nbre_tee_shirt > 0
                                  ? [
                                      _tee_shirt.tee_shirt_nom,
                                      _tee_shirt.quantite_initial.toString(),
                                      total_quantite_tee_shirt.toString(),
                                      _tee_shirt.quantite_physique.toString(),
                                      _tee_shirt.prix_unitaire_vente
                                              .toString() +
                                          " F",
                                      montant_vente_tee_shirt.toString() + " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text(
                                      "Total vente tee shirt ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_tee_shirt.toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_produits_centre.isNotEmpty && nombre_vente_produit > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text("Vente de produits".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Produit".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_produits_centre.map((_produit) {
                              total_quantite_produits = 0;
                              nbre_produit = 0;
                              montant_vente_produits = 0;

                              _list_vente_produits.forEach((element) {
                                if (element.nom_produit == _produit.nom &&
                                    element.vente_month == _current_month) {
                                  montant_vente_produits += element.montant;
                                  nbre_produit++;

                                  total_quantite_produits += element.quantite;
                                }
                              });

                              return nbre_produit > 0
                                  ? [
                                      _produit.nom,
                                      _produit.quantite_initial.toString(),
                                      total_quantite_produits.toString(),
                                      _produit.quantite_physique.toString(),
                                      _produit.prix_unitaire.toString() + " F",
                                      montant_vente_produits.toString() + " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text("Total vente produits ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_produits.toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_bierres_petit_modele.isNotEmpty &&
                        nombre_vente_petit_modele > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text(
                                "Vente de pétits modèles".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Bièrre".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_bierres_petit_modele.map((_bierre) {
                              total_quantite_petit_modele = 0;
                              nbre_petit_modele = 0;
                              montant_vente_petit_modele = 0;

                              _list_vente_petit_modele.forEach((element) {
                                if (element.nom_bierre == _bierre.nom &&
                                    element.date_vente_month ==
                                        _current_month) {
                                  montant_vente_petit_modele += element.montant;
                                  nbre_petit_modele++;

                                  total_quantite_petit_modele +=
                                      element.quantite;
                                }
                              });

                              return nbre_petit_modele > 0
                                  ? [
                                      _bierre.nom,
                                      _bierre.quantite_initial.toString(),
                                      total_quantite_petit_modele.toString(),
                                      _bierre.quantite_physique.toString(),
                                      _bierre.prix_unitaire.toString() + " F",
                                      montant_vente_petit_modele.toString() +
                                          " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text(
                                      "Total vente pétit modèle ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_petit_modele
                                              .toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_bierres_grand_modele.isNotEmpty &&
                        nombre_vente_grand_modele > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text(
                                "Vente de grands modèles".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Bièrre".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_bierres_grand_modele.map((_bierre) {
                              total_quantite_grand_modele = 0;
                              nbre_grand_modele = 0;
                              montant_vente_grand_modele = 0;

                              _list_vente_grand_modele.forEach((element) {
                                if (element.nom_bierre == _bierre.nom &&
                                    element.date_vente_month ==
                                        _current_month) {
                                  montant_vente_grand_modele += element.montant;
                                  nbre_grand_modele++;

                                  total_quantite_grand_modele +=
                                      element.quantite;
                                }
                              });

                              return nbre_grand_modele > 0
                                  ? [
                                      _bierre.nom,
                                      _bierre.quantite_initial.toString(),
                                      total_quantite_grand_modele.toString(),
                                      _bierre.quantite_physique.toString(),
                                      _bierre.prix_unitaire.toString() + " F",
                                      montant_vente_grand_modele.toString() +
                                          " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text(
                                      "Total vente grand modèle ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_grand_modele
                                              .toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                pw.Container(
                    width: double.infinity,
                    height: 40,
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisSize: pw.MainAxisSize.max,
                        children: [
                          pw.Text("total de vente du mois".toUpperCase(),
                              style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text(totaux_vente.toString() + " F",
                              style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold))
                        ])),
                pw.Container(
                    color: PdfColors.indigo,
                    width: double.infinity,
                    height: 60,
                    child: pw.Padding(
                        padding: pw.EdgeInsets.all(10),
                        child: pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisSize: pw.MainAxisSize.max,
                            children: [
                              pw.Text("bénéfice mensuel brute".toUpperCase(),
                                  style: pw.TextStyle(
                                      color: PdfColors.white,
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold)),
                              pw.Text(totaux_benefice.floor().toString() + " F",
                                  style: pw.TextStyle(
                                      color: PdfColors.black,
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold))
                            ])))
              ];
            })));

        final path = (await getExternalStorageDirectory())!.path;

        final _file1 = File('$path/rapport_mensuel.pdf');
        await _file1.writeAsBytes(
          await pdf.save(),
        );

        String username = 'marcellindeveloppeur@gmail.com';
        String _password = 'wturjftonwajralt';

        final smtpServer = gmail(username, _password);

        final equivalentMessage = Message()
          ..from = Address(username, 'Entreprise Déo Gracias')
          ..recipients.add(Address(_rapport.email_rapport.trim()))
          ..ccRecipients
          ..subject = 'Rapport  de vente du mois ' + month
          ..text =
              'Bonsoir Monsieur le PDG de  Déo Gracias. Voici le rapport mensuel de vente au niveau du centre informatique et du bar restaurant de cette entreprise ' +
                  current_day
          ..attachments = [
            FileAttachment(_file1)
              ..location = Location.inline
              ..cid = 'rapport_mensuel.pdf'
          ];

        final sendReport2 = await send(equivalentMessage, smtpServer);
        print('Message sent: ' + sendReport2.toString());
      } catch (e) {
        print(e);
      }
    });

    // Rapport Annuel

    _cron.schedule(Schedule.parse('0 20 31 12 *'), () async {
      try {
        nombre_vente_credit = 0;
        nombre_vente_grand_modele = 0;
        nombre_vente_petit_modele = 0;
        nombre_vente_produit = 0;
        nombre_vente_tee_shirt = 0;
        _benefice_total_credit = 0;
        montant_total_vente_credit = 0;
        montant_vendu_credit = 0;
        total_benefice_tee_shirt = 0;
        total_quantite_tee_shirt = 0;
        montant_vente_tee_shirt = 0;

        total_benefice_produits = 0;
        total_quantite_produits = 0;
        montant_vente_produits = 0;

        total_benefice_grand_modele = 0;
        total_quantite_grand_modele = 0;
        montant_vente_grand_modele = 0;

        total_benefice_tee_petit_modele = 0;
        total_quantite_petit_modele = 0;
        montant_vente_petit_modele = 0;
        totaux_vente = 0;
        totaux_benefice = 0;

        _list_vente_credits.forEach((element) {
          if (element.date_vente_annee == annee) {
            montant_total_vente_credit += element.montant;
            nombre_vente_credit++;
            _benefice_total_credit += element.benefice;
          }
        });

        _list_vente_grand_modele.forEach((element) {
          if (element.date_vente_annee == annee) {
            montant_total_vente_grand_modele += element.montant;
            nombre_vente_grand_modele++;
            total_benefice_grand_modele += element.benefice;
          }
        });

        _list_vente_petit_modele.forEach((element) {
          if (element.date_vente_annee == annee) {
            montant_total_vente_petit_modele += element.montant;
            nombre_vente_petit_modele++;
            total_benefice_tee_petit_modele += element.benefice;
          }
        });

        _list_vente_produits.forEach((element) {
          if (element.date_vente_annee == annee) {
            nombre_vente_produit++;
            montant_total_vente_produits += element.montant;
            total_benefice_produits += element.benefice;
          }
        });

        _list_vente_tee_shirts.forEach((element) {
          if (element.date_vente_annee == annee) {
            montant_total_vente_tee_shirt += element.montant;
            nombre_vente_tee_shirt++;
            total_benefice_tee_shirt += element.benefice;
          }
        });

        totaux_vente = montant_total_vente_credit +
            montant_total_vente_grand_modele +
            montant_total_vente_petit_modele +
            montant_total_vente_tee_shirt +
            montant_total_vente_produits;
        totaux_benefice = _benefice_total_credit +
            total_benefice_grand_modele +
            total_benefice_tee_petit_modele +
            total_benefice_produits +
            total_benefice_tee_shirt;

        final pdf = pw.Document();
        pdf.addPage(pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            build: ((pw.Context context) {
              return [
                pw.SizedBox(
                  height: 10,
                ),
                pw.Text(
                    "Rapprt de vente de l'année  ".toUpperCase() +
                        annee.toUpperCase(),
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 20,
                        color: PdfColors.black)),
                pw.SizedBox(height: 10),
                _list_credits.isNotEmpty && nombre_vente_credit > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text("Vente de crédits".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                          headers: [
                            "Crédit".toUpperCase(),
                            "Montant intial".toUpperCase(),
                            "Montant vendu".toUpperCase(),
                            "Montant restant".toUpperCase(),
                          ],
                          border: pw.TableBorder.all(
                              style: pw.BorderStyle.solid,
                              color: PdfColors.black,
                              width: 2),
                          data: _list_credits.map((_credit) {
                            nbr_credit = 0;
                            montant_vendu_credit = 0;

                            _list_vente_credits.forEach((element) {
                              if (_credit.nom == element.nom &&
                                  element.date_vente_annee == annee) {
                                nbr_credit++;
                                montant_vendu_credit += element.montant;
                              }
                            });

                            return nbr_credit > 0
                                ? [
                                    _credit.nom,
                                    _credit.montant_initial.toString() + " F",
                                    montant_vendu_credit.toString() + " F",
                                    _credit.montant_disponible.toString() +
                                        " F",
                                  ]
                                : [];
                          }).toList(),
                        ),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text("Total vente crédit ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_credit.toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_tee_shirt.isNotEmpty && nombre_vente_tee_shirt > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text("Vente de tee shirts".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Tee shirt".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_tee_shirt.map((_tee_shirt) {
                              total_quantite_tee_shirt = 0;
                              nbre_tee_shirt = 0;
                              montant_vente_tee_shirt = 0;

                              _list_vente_tee_shirts.forEach((element) {
                                if (element.nom_tee_shirts ==
                                        _tee_shirt.tee_shirt_nom &&
                                    element.date_vente_annee == annee) {
                                  montant_vente_tee_shirt += element.montant;
                                  nbre_tee_shirt++;

                                  total_quantite_tee_shirt += element.quantite;
                                }
                              });

                              return nbre_tee_shirt > 0
                                  ? [
                                      _tee_shirt.tee_shirt_nom,
                                      _tee_shirt.quantite_initial.toString(),
                                      total_quantite_tee_shirt.toString(),
                                      _tee_shirt.quantite_physique.toString(),
                                      _tee_shirt.prix_unitaire_vente
                                              .toString() +
                                          " F",
                                      montant_vente_tee_shirt.toString() + " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text(
                                      "Total vente tee shirt ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_tee_shirt.toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_produits_centre.isNotEmpty && nombre_vente_produit > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text("Vente de produits".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Produit".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_produits_centre.map((_produit) {
                              total_quantite_produits = 0;
                              nbre_produit = 0;
                              montant_vente_produits = 0;

                              _list_vente_produits.forEach((element) {
                                if (element.nom_produit == _produit.nom &&
                                    element.date_vente_annee == annee) {
                                  montant_vente_produits += element.montant;
                                  nbre_produit++;

                                  total_quantite_produits += element.quantite;
                                }
                              });

                              return nbre_produit > 0
                                  ? [
                                      _produit.nom,
                                      _produit.quantite_initial.toString(),
                                      total_quantite_produits.toString(),
                                      _produit.quantite_physique.toString(),
                                      _produit.prix_unitaire.toString() + " F",
                                      montant_vente_produits.toString() + " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text("Total vente produits ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_produits.toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_bierres_petit_modele.isNotEmpty &&
                        nombre_vente_petit_modele > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text(
                                "Vente de pétits modèles".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Bièrre".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_bierres_petit_modele.map((_bierre) {
                              total_quantite_petit_modele = 0;
                              nbre_petit_modele = 0;
                              montant_vente_petit_modele = 0;

                              _list_vente_petit_modele.forEach((element) {
                                if (element.nom_bierre == _bierre.nom &&
                                    element.date_vente_annee == annee) {
                                  montant_vente_petit_modele += element.montant;
                                  nbre_petit_modele++;

                                  total_quantite_petit_modele +=
                                      element.quantite;
                                }
                              });

                              return nbre_petit_modele > 0
                                  ? [
                                      _bierre.nom,
                                      _bierre.quantite_initial.toString(),
                                      total_quantite_petit_modele.toString(),
                                      _bierre.quantite_physique.toString(),
                                      _bierre.prix_unitaire.toString() + " F",
                                      montant_vente_petit_modele.toString() +
                                          " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text(
                                      "Total vente pétit modèle ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_petit_modele
                                              .toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                _list_bierres_grand_modele.isNotEmpty &&
                        nombre_vente_grand_modele > 0
                    ? pw.Column(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            color: PdfColors.redAccent,
                            width: double.infinity,
                            height: 40,
                            child: pw.Text(
                                "Vente de grands modèles".toUpperCase(),
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 22,
                                    fontWeight: pw.FontWeight.bold))),
                        pw.Table.fromTextArray(
                            border: pw.TableBorder.all(
                                style: pw.BorderStyle.solid,
                                color: PdfColors.black,
                                width: 2),
                            headers: [
                              "Bièrre".toUpperCase(),
                              "Quantité initiale".toUpperCase(),
                              "Quantité vendue".toUpperCase(),
                              "Quantité restante".toUpperCase(),
                              "Prix unitaire".toUpperCase(),
                              "Montant de vente".toUpperCase()
                            ],
                            data: _list_bierres_grand_modele.map((_bierre) {
                              total_quantite_grand_modele = 0;
                              nbre_grand_modele = 0;
                              montant_vente_grand_modele = 0;

                              _list_vente_grand_modele.forEach((element) {
                                if (element.nom_bierre == _bierre.nom &&
                                    element.date_vente_annee == annee) {
                                  montant_vente_grand_modele += element.montant;
                                  nbre_grand_modele++;

                                  total_quantite_grand_modele +=
                                      element.quantite;
                                }
                              });

                              return nbre_grand_modele > 0
                                  ? [
                                      _bierre.nom,
                                      _bierre.quantite_initial.toString(),
                                      total_quantite_grand_modele.toString(),
                                      _bierre.quantite_physique.toString(),
                                      _bierre.prix_unitaire.toString() + " F",
                                      montant_vente_grand_modele.toString() +
                                          " F"
                                    ]
                                  : [];
                            }).toList()),
                        pw.SizedBox(height: 20),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                mainAxisSize: pw.MainAxisSize.max,
                                children: [
                                  pw.Text(
                                      "Total vente grand modèle ".toUpperCase(),
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Text(
                                      montant_total_vente_grand_modele
                                              .toString() +
                                          " F",
                                      style: pw.TextStyle(
                                          color: PdfColors.black,
                                          fontSize: 20,
                                          fontWeight: pw.FontWeight.bold))
                                ])),
                      ])
                    : pw.Container(),
                pw.SizedBox(height: 10),
                pw.Container(
                    width: double.infinity,
                    height: 40,
                    child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisSize: pw.MainAxisSize.max,
                        children: [
                          pw.Text("total de vente de l'année".toUpperCase(),
                              style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text(totaux_vente.toString() + " F",
                              style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold))
                        ])),
                pw.Container(
                    color: PdfColors.indigo,
                    width: double.infinity,
                    height: 60,
                    child: pw.Padding(
                        padding: pw.EdgeInsets.all(10),
                        child: pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisSize: pw.MainAxisSize.max,
                            children: [
                              pw.Text("bénéfice annuelle brute".toUpperCase(),
                                  style: pw.TextStyle(
                                      color: PdfColors.white,
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold)),
                              pw.Text(totaux_benefice.floor().toString() + " F",
                                  style: pw.TextStyle(
                                      color: PdfColors.black,
                                      fontSize: 20,
                                      fontWeight: pw.FontWeight.bold))
                            ])))
              ];
            })));

        final path = (await getExternalStorageDirectory())!.path;

        final _file1 = File('$path/rapport_annuel.pdf');
        await _file1.writeAsBytes(
          await pdf.save(),
        );

        String username = 'marcellindeveloppeur@gmail.com';
        String _password = 'wturjftonwajralt';

        final smtpServer = gmail(username, _password);

        final equivalentMessage = Message()
          ..from = Address(username, 'Entreprise Déo Gracias')
          ..recipients.add(Address(_rapport.email_rapport.trim()))
          ..ccRecipients
          ..subject = "Rapport  de vente de l'année " + annee
          ..text =
              'Bonsoir Monsieur le PDG de  Déo Gracias. Voici le rapport annuel de vente au niveau du centre informatique et du bar restaurant de cette entreprise ' +
                  current_day
          ..attachments = [
            FileAttachment(_file1)
              ..location = Location.inline
              ..cid = 'rapport_annuel.pdf'
          ];

        final sendReport2 = await send(equivalentMessage, smtpServer);
        print('Message sent: ' + sendReport2.toString());
      } catch (e) {
        print(e);
      }
    });

    if (firebase == null) {
      return Accueil();
    }
    if (_donnnes.deleted) return SuppressionCompte();
    if (_donnnes.is_active != true) return Welcome();
    if (_donnnes.admin == true) return HomePage();
    if (_donnnes.role == "Servant") {
      if (_donnnes.domaine == "Bar restaurant") {
        return AccueilServantBar();
      } else if (_donnnes.domaine == "Centre informatique") {
        return AccueilServantCentre();
      } else
        return Welcome();
    } else if (_donnnes.role == "Gerant") {
      return AccueilGerant();
    } else {
      return Welcome();
    }

    return Loader();
  }
}
