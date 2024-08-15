import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(color: Colors.grey[700]),
        menuStyle: MenuStyle(
            backgroundColor:
                MaterialStatePropertyAll(Colors.white.withOpacity(0.8)))),
    listTileTheme: ListTileThemeData(
      tileColor: Colors.grey[200],
    ),
    colorSchemeSeed: const Color.fromARGB(255, 89, 213, 93),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        color: Colors.white,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25)));

ThemeData darkTheme = ThemeData.dark().copyWith(
    hintColor: Colors.grey,
    tabBarTheme:
        const TabBarTheme(unselectedLabelStyle: TextStyle(color: Colors.white)),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 89, 213, 93),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: const TextStyle(color: Colors.white),
        menuStyle: MenuStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100))),
    listTileTheme: ListTileThemeData(
      textColor: Colors.white,
      tileColor: Colors.grey[700],
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade800,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)));
