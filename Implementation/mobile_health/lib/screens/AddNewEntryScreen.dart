import 'package:flutter/material.dart';
import 'package:mobile_health/components/AddNewCategoryOption.dart';
import 'package:mobile_health/components/CostumBottomFloatingButton.dart';
import 'package:mobile_health/components/CustomBottomNavigationBar.dart';
import 'package:mobile_health/components/StaticTopAppBar.dart';
import 'package:mobile_health/components/TitleCardAddNewEntry.dart';
import 'package:mobile_health/components/TitleCardAddNewEntryCategory.dart';
import 'package:mobile_health/components/TitleCardAddNewEntrySubCategory.dart';
import 'package:mobile_health/components/TitleCardHome.dart';
import 'package:mobile_health/components/TitleCardStatistics.dart';
import 'package:mobile_health/components/TopAppBar.dart';
import 'package:mobile_health/database/database_provider.dart';
import 'package:mobile_health/models/DiaryEntry.dart';
import 'package:mobile_health/models/EntryEvent.dart';
import 'package:mobile_health/models/EntryType.dart';
import 'package:intl/intl.dart';
import 'package:mobile_health/models/Unit.dart';
import 'package:mobile_health/screens/HomePageScreen.dart';


class AddNewEntryScreen extends StatefulWidget {
  final EntryType parentEntryType;
  final EntryType subEntryType;

  const AddNewEntryScreen(this.parentEntryType, this.subEntryType);

  @override
  _AddNewEntryScreenState createState() => _AddNewEntryScreenState(parentEntryType, subEntryType);
}

///*
class _AddNewEntryScreenState extends State<AddNewEntryScreen> {

  final EntryType parentEntryType;
  final EntryType subEntryType;

  Unit _dropDownValue;

  bool displayError = false;

  _AddNewEntryScreenState(this.parentEntryType, this.subEntryType);

  final commentController = TextEditingController();

  final amountOfUnitController = TextEditingController();



  Future<List<Unit>> getDataAsync() async {

    var storedUnits = await DatabaseProvider.db.getUnits();
    return storedUnits;
  }

  ///*
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataAsync(),
        builder: (context, snapshot) =>
        snapshot.hasData ? _buildWidget(snapshot.data) : Container(color: Colors.white, child: Container(height: 100, width: 100, child: Center(child: CircularProgressIndicator())),));
  }

  ///*
  Widget _buildWidget(List<Unit> units) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black45,
      extendBodyBehindAppBar: false,

      appBar: TopAppBar(),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              TitleCardAddNewEntry(),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    this.displayError ? Column(children: [Container(child: Text("There was an error on saving your input!", style: TextStyle(color: Colors.red),),), SizedBox(height: 50,)]) : Container(),
                    Container(
                      child: Text(
                        this.parentEntryType.name + " " + this.subEntryType.name,
                      ),
                    ),
                    SizedBox(height: 50),

                    // add Diary Comment
                    Container(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                              child: Text("Write a diary comment")
                          ),
                          TextField(
                            controller: commentController,
                        ),
                        ]
                      ),
                    ),
                    SizedBox(height: 50),



                    // add amount
                    Container(
                      child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Specify the amount you want to add")
                            ),
                            TextField(
                              controller: amountOfUnitController,
                              keyboardType: TextInputType.number,
                            ),
                          ]
                      ),
                    ),
                    SizedBox(height: 50),




                    // add unit
                    Container(
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Choose unit")
                          ),
                          DropdownButton<Unit>(
                          style: TextStyle(color: Colors.blue),
                          hint: _dropDownValue == null
                              ? Text('Choose from Dropdown')
                              : Text(
                            _dropDownValue.name,
                            style: TextStyle(color: Colors.blue),
                          ),


                          items: units.map((Unit value) {
                            return DropdownMenuItem<Unit>(
                              value: value,
                              child: Text(
                                  value.name,
                                  style: TextStyle(
                                      fontSize: 14,
                                    color: Colors.black
                                  ),
                            ),
                            );
                          }).toList(),
                          isExpanded: true,
                          onChanged: (val) {
                            setState(
                                  () {
                                _dropDownValue = val;
                              },
                            );
                          },
                        ),
                        ]
                      ),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color.fromARGB(255, 101, 220, 213))),
                      onPressed: () async {

                        if(this._dropDownValue==null || this.commentController.text == null || this.amountOfUnitController.text == null){
                          setState(() {
                            displayError = true;
                          });
                          return;
                        }
                        var dateToday = DateTime.now();
                        var formatter = new DateFormat('yyyy-MM-dd');
                        var dateTodayFormatted = formatter.format(dateToday);
                        print(dateTodayFormatted);
                        var newDiaryEntry = new DiaryEntry(
                          comment: commentController.text,
                          dateString: dateTodayFormatted,
                          diaryId: 1
                        );

                        var storedDiaryEntry = await DatabaseProvider.db.insertDiaryEntry(newDiaryEntry);

                        var storedUnits = this._dropDownValue;

                        var entryEvent = new EntryEvent(
                          diaryEntryId: storedDiaryEntry.id,
                            entryType: this.subEntryType,
                          quantity: double.parse(amountOfUnitController.text),
                          unit: storedUnits
                        );

                        var storedEntryEvent = await DatabaseProvider.db.insertEntryEvent(entryEvent);
                        print("1");
                        print(storedEntryEvent);

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageScreen()),
                              (Route<dynamic> route) => false,
                        );




                      },
                      color: Colors.white,
                      textColor: Colors.black,
                      child: Text(
                          "Save and finish",
                          style: TextStyle(fontSize: 14)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CustomBottomNavigationBar(),
      floatingActionButton: CostumBottomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}