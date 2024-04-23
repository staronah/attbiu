import 'saved.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(AgapeC5());

class ScanResult {
  final String barcode;
  final DateTime date;

  ScanResult(this.barcode, this.date);
}

class SharedPreferencesManager {
  final String pageKey;

  SharedPreferencesManager(this.pageKey);

  Future<List<ScanResult>> getScannedResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? results = prefs.getStringList('$pageKey-results');

    if (results == null) {
      return [];
    }


    return results.map((result) {
      List<String> parts = result.split('|');
      return ScanResult(parts[0], DateTime.parse(parts[1]));
    }).toList();
  }



  Future<void> saveScannedResults(List<ScanResult> results) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> resultStrings =
    results.map((result) => '${result.barcode}|${result.date}').toList();

    prefs.setStringList('$pageKey-results', resultStrings);
  }

  Future<void> clearScannedResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('$pageKey-results');
  }
}

class AgapeC5 extends StatelessWidget {
  final SharedPreferencesManager sharedPreferencesManager =
  SharedPreferencesManager('AgapeC5');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BarcodeScannerScreen(sharedPreferencesManager),
    );
  }
}

class BarcodeScannerScreen extends StatefulWidget {
  final SharedPreferencesManager sharedPreferencesManager;

  BarcodeScannerScreen(this.sharedPreferencesManager);

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  List<ScanResult> scannedResults = [];
  int scanCount = 0;

  @override
  void initState() {
    super.initState();
    loadScannedResults();
  }

  void loadScannedResults() async {
    List<ScanResult> results =
    await widget.sharedPreferencesManager.getScannedResults();
    setState(() {
      scannedResults = results;
      scanCount = results.length;
    });
  }

  void openLogForm(List<ScanResult> scanResults) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Scanned ID Cards Log'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: scanResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                  Text('Date: ${scanResults[index].date.toString()}'),
                  subtitle:
                  Text('Matriculationno: ${scanResults[index].barcode}'),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int currentDayScanCount = 0;

    // Calculate the number of scans for the current day
    DateTime now = DateTime.now();
    for (var result in scannedResults) {
      if (result.date.year == now.year &&
          result.date.month == now.month &&
          result.date.day == now.day) {
        currentDayScanCount++;
      }
    }

    // TextEditingController for the manual entry text field
    TextEditingController manualEntryController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/biulogo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 90),
              ElevatedButton(
                onPressed: () {
                  scanBarcode();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF455180),
                  ),
                ),
                child: Text('Scan ID Card'),
              ),
              SizedBox(height: 20),
              // Text field for manual entry
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: manualEntryController,
                  decoration: InputDecoration(
                    labelText: 'Enter Matriculation no',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              // Button to save the manually entered matriculation number
              ElevatedButton(
                onPressed: () {
                  String manualEntry = manualEntryController.text.trim();
                  if (manualEntry.isNotEmpty) {
                    saveManualEntry(manualEntry);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF455180),
                  ),
                ),
                child: Text('Save Manual Entry'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AgapeC5Saved(widget.sharedPreferencesManager),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFF455180),
                  ),
                ),
                child: Text('View Saved Scans'),
              ),
              SizedBox(height: 20),
              Text('Number of Scans: $scanCount',
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 10),
              Text('Number of Scans Today: $currentDayScanCount',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDeleteConfirmationDialog();
        },
        child: Icon(Icons.delete),
        backgroundColor: Color(0xFF455180),
      ),
      appBar: AppBar(
        title: Text('AgapeC5'),
        backgroundColor: Color(0xFF455180),
        actions: <Widget>[

          // top

        ],
      ),
    );
  }

// Function to save the manually entered matriculation number
  void saveManualEntry(String manualEntry) {
    DateTime now = DateTime.now();
    setState(() {
      scannedResults.add(ScanResult(manualEntry, now));
      scanCount++;
      showScanSuccessDialog(manualEntry);
      widget.sharedPreferencesManager.saveScannedResults(scannedResults);
    });
  }


  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE);

    print('Scanned barcode: $barcodeScanRes');

    if (barcodeScanRes != '-1') {
      DateTime now = DateTime.now();

      setState(() {
        scannedResults.add(ScanResult(barcodeScanRes, now));
        scanCount++;
        showScanSuccessDialog(barcodeScanRes);
        widget.sharedPreferencesManager.saveScannedResults(scannedResults);
      });
    }
  }

  Future<void> generateExcelAndShare(List<ScanResult> scanResults,
      {bool viewOnly = false}) async {
    final excel = Excel.createExcel();
    Sheet sheetObject = excel['AgapeC5'];

    // Add headers for Date and Time
    sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0))
      ..value = 'Date';
    sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0))
      ..value = 'Time';
    sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0))
      ..value = 'Matriculation no';

    int rowIndex = 1; // Start from the second row (rowIndex=1)
    DateTime previousDate = scanResults.isNotEmpty ? scanResults[0].date : DateTime.now();

    // Add scanned results
    for (int i = 0; i < scanResults.length; i++) {
      DateTime currentDate = scanResults[i].date;
      if (i == 0 || currentDate != previousDate) {
        // Start a new line when the date changes
        rowIndex++;
        sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: rowIndex))
          ..value = currentDate.toLocal().toIso8601String().split('T')[0];
      }

      // Format the time
      String formattedTime =
          '${currentDate.toLocal().hour.toString().padLeft(2, '0')}:${currentDate.toLocal().minute.toString().padLeft(2, '0')}';

      // Add the rest of the data
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: rowIndex))
        ..value = currentDate.toLocal().toIso8601String().split('T')[0];
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: rowIndex))
        ..value = formattedTime;
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: rowIndex))
        ..value = scanResults[i].barcode;

      // Update previousDate for the next iteration
      previousDate = currentDate;
    }

    List<int>? encoded = excel.encode();

    if (encoded!.isNotEmpty) {
      try {
        final Directory tempDir = await getTemporaryDirectory();
        final String fileName = 'AgapeC5.starx';
        final String filePath = '${tempDir.path}/$fileName';

        final file = File(filePath);

        await file.writeAsBytes(encoded);

        Navigator.pop(context);

        if (!viewOnly) {
          Share.shareFiles([filePath], text: 'Share ID logs via WhatsApp');
        } else {
          openExcelDocument(filePath);
        }
      } catch (error) {
        Navigator.pop(context);
        print('Error saving or sharing the file: $error');
      }
    }
  }

  void openExcelDocument(String filePath) {
    OpenFile.open(filePath, type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  }

  void showScanSuccessDialog(String barcode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Scan Successful'),
          content: Text('Scanned ID Card: $barcode'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Clear Data'),
          content: Text('Are you sure you want to clear all scanned ID?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Clear'),
              onPressed: () {
                Navigator.of(context).pop();
                clearData();
              },
            ),
          ],
        );
      },
    );
  }

  void clearData() {
    setState(() {
      scannedResults.clear();
      scanCount = 0;
    });
    widget.sharedPreferencesManager.clearScannedResults();
  }

  void showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Compiling Matriculation numbers...'),
            ],
          ),
        );
      },
    );
  }
}