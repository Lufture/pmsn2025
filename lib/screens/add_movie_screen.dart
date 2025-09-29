import 'package:flutter/material.dart';
import 'package:pmsn2025/database/movies.database.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  MoviesDatabase? moviesDB;
  DateTime selectedDate = DateTime.now();
  TextEditingController conTitle = TextEditingController();
  TextEditingController conTime = TextEditingController();
  TextEditingController conDate = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {

    conDate.text = "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
    final txtTitle = TextField(
      controller: conTitle,
      decoration: InputDecoration(hintText: "Title Movie"),
    );
    final txtTime = TextField(
      controller: conTime,
      decoration: InputDecoration(hintText: "Time Movie"),
    );
    final txtDate = TextField(
      onTap:() => _selectDate(context),
      controller: conDate,
      decoration: InputDecoration(hintText: "Date Release"),
    );
    final btnGuardar =ElevatedButton(
              onPressed: () async {
                await moviesDB!.INSERT("tblMovies", {
                  "nameMovie": conTitle.text,
                  "time": conTime.text,
                  "dateRelease": conDate.text
                });
                Navigator.pop(context);
              },
              child: Text("Save Movie"),
            );


    return Scaffold(
      appBar: AppBar(
        title: Text("Add Movie"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            txtTitle,
            txtTime,
            txtDate,
            btnGuardar
          ],
        ),
      ),
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        conDate.text = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }
}