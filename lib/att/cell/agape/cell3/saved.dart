import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';
import 'package:share/share.dart';
import 'chapel.dart';

class AgapeC3Saved extends StatefulWidget {
  final SharedPreferencesManager sharedPreferencesManager;

  AgapeC3Saved(this.sharedPreferencesManager);

  @override
  _AgapeC3SavedState createState() => _AgapeC3SavedState();
}

class _AgapeC3SavedState extends State<AgapeC3Saved> {
  List<ScanResult> savedScans = [];
  List<bool> selectedDays = [];
  bool isAllSelected = false;

  @override
  void initState() {
    super.initState();
    loadSavedScans();
  }

  void loadSavedScans() async {
    List<ScanResult> loadedScans =
    await widget.sharedPreferencesManager.getScannedResults();

    setState(() {
      savedScans = loadedScans;
      selectedDays = List.generate(savedScans.length, (index) => false);
    });
  }

  void toggleSelectAll() {
    setState(() {
      isAllSelected = !isAllSelected;
      selectedDays = List.generate(savedScans.length, (index) => isAllSelected);
    });
  }

  void compileSelectedScans() {
    List<ScanResult> selectedResults = [];

    for (int i = 0; i < savedScans.length; i++) {
      if (selectedDays[i]) {
        selectedResults.add(savedScans[i]);
      }
    }

    if (selectedResults.isNotEmpty) {
      generateExcelAndShare(selectedResults);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No scans selected.')),
      );
    }
  }

  void deleteSelectedScans() {
    List<ScanResult> remainingScans = [];
    for (int i = 0; i < savedScans.length; i++) {
      if (!selectedDays[i]) {
        remainingScans.add(savedScans[i]);
      }
    }

    setState(() {
      savedScans = remainingScans;
      selectedDays = List.generate(savedScans.length, (index) => false);
    });

    widget.sharedPreferencesManager.saveScannedResults(savedScans);
  }

  Future<void> generateExcelAndShare(List<ScanResult> scanResults) async {
    // Get the current date
    String currentDate = DateTime.now().toString().split(' ')[0];

    // Create a text controller to capture the file name input
    TextEditingController fileNameController = TextEditingController();

    // Show a dialog for the user to input the file name
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Marticulation Number'),
          content: TextField(
            controller: fileNameController,
            decoration: InputDecoration(
              hintText: 'Enter Marticulation Number',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                String fileName = fileNameController.text.trim();
                if (fileName.isNotEmpty) {
                  // Generate the Excel file
                  final excel = Excel.createExcel();
                  Sheet sheetObject = excel['Sheet1'];

                  // Add headers for Date and Time
                  sheetObject.appendRow(['Date', 'Time', 'Matriculationno']);

                  // Add selected results
                  for (int i = 0; i < scanResults.length; i++) {
                    DateTime currentDateTime = scanResults[i].date;

                    // Format the time
                    String formattedTime =
                        '${currentDateTime.toLocal().hour.toString().padLeft(2, '0')}:${currentDateTime.toLocal().minute.toString().padLeft(2, '0')}';

                    // Add the data
                    sheetObject.appendRow([
                      currentDateTime.toLocal().toIso8601String().split('T')[0],
                      formattedTime,
                      scanResults[i].barcode,
                    ]);
                  }

                  // Encode Excel file
                  List<int>? excelBytes = excel.encode();

                  if (excelBytes != null) {
                    try {
                      final Directory tempDir = await getTemporaryDirectory();
                      final String fileNameWithDate = 'AgapeC3-$fileName-$currentDate.starx';
                      final String filePath = '${tempDir.path}/$fileNameWithDate';

                      final file = File(filePath);

                      await file.writeAsBytes(excelBytes);

                      // Share the Excel file using the share package
                      Share.shareFiles([filePath], text: 'Share ID log file via...');

                    } catch (error) {
                      print('Error saving or sharing the file: $error');
                    }
                  }
                  Navigator.pop(context); // Close the dialog
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a matriculation number.')),
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgapeC3 log'),
        backgroundColor: Color(0xFF455180),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: compileSelectedScans,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: deleteSelectedScans,
          ),
        ],
      ),
      body: savedScans.isEmpty
          ? Center(child: Text('No saved scans.'))
          : Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: toggleSelectAll,
                child: Text(isAllSelected ? 'Deselect All' : 'Select All'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: savedScans.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Date: ${savedScans[index].date.toString()}'),
                  subtitle: Text('Matriculationno: ${savedScans[index].barcode}'),
                  leading: Checkbox(
                    value: selectedDays[index],
                    onChanged: (value) {
                      setState(() {
                        selectedDays[index] = value!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
