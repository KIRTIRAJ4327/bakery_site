import 'package:flutter/material.dart';

class WordArtText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: double.infinity,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Color.fromARGB(255, 188, 67, 249),
        //       Color.fromARGB(255, 47, 110, 255)
        //     ],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              // buildWordArtText("Atul", Colors.yellow),
              buildWordArtText(
                "Atul Bakery - Jayveer Sales",
              ),
              // buildWordArtText("Jayveer Sales", Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWordArtText(String text) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Color.fromARGB(255, 188, 67, 249),
            Color.fromARGB(255, 47, 110, 255),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: RichText(
        text: TextSpan(
          children: [
            for (int i = 0; i < text.length; i++)
              WidgetSpan(
                child: Transform.translate(
                  offset: Offset(5.0 * i, 0),
                  child: Text(
                    text[i],
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          255, 255, 255, 255), // Use white color for the text
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Word Art Text'),
//       ),
//       body: WordArtText(),
//     ),
//   ));
// }
