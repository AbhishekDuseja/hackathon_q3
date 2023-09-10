// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:http/http.dart' as http;
// // ignore: unused_import
// import 'dart:convert';

// class MyApp1 extends StatelessWidget {
//   const MyApp1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final String apiUrl = "https://www.carboninterface.com/api/v1/estimates";
//   final String apiKey = "OQZpcFeESXLGgyCSzVgp1A";
//   String responseData = " ";

//   Future<void> fetchData() async {
//     final response = await http.get(
//       Uri.parse(apiUrl),
//       headers: {
//         'Authorization': 'Bearer $apiKey',
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response.statusCode == 200) {
//       final responseBody = response.body;
//       setState(() {
//         responseData = responseBody;
//       });
//     } else {
//       // Handle error response
//       print('Failed to fetch data: ${response.statusCode}');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData(); // Fetch data when the widget is initialized
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Carbon Interface Data'),
//       ),
//       body: Container(
//         color: const Color.fromARGB(255, 3, 84, 83), // Red background color
//         child: Center(
//           child: Text(
//             responseData.isNotEmpty
//                 ? ('API Data: $responseData') // Display the fetched data
//                 : ('Loading...'), // Display a loading message while fetching data
//             style: const TextStyle(
//               color: Color.fromARGB(255, 226, 212, 212), // Text color
//               fontSize: 28.0,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String apiUrl = "https://www.carboninterface.com/api/v1/estimates";
  final String apiKey = "OQZpcFeESXLGgyCSzVgp1A";
  String responseData = " ";

  Future<void> fetchData() async {
    final Map<String, dynamic> requestData = {
      "type": "electricity",
      "electricity_unit": "mwh",
      "electricity_value": 42,
      "country": "us",
      "state": "fl"
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      final responseBody = response.body;
      final decodedData = jsonDecode(responseBody);
      setState(() {
        // Process the decoded data as needed
        responseData = decodedData['OQZpcFeESXLGgyCSzVgp1A'];
      });
    } else {
      // Handle error response
      print('Failed to fetch data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caron Footprint'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 3, 84, 83),
        child: Center(
          child: Text(
            responseData.isNotEmpty
                ? ('API Data: $responseData')
                : ('Loading...'),
            style: const TextStyle(
              color: Color.fromARGB(255, 226, 212, 212),
              fontSize: 28.0,
            ),
          ),
        ),
      ),
    );
  }
}
