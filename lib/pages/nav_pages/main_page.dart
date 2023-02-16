import 'package:dalil_app/constant/constants.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      //
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            SizedBox(
              height: size * 0.4,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                ),
                itemCount: Constants().mainCategoriesMap.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Constants().mainCategoriesMap[index]['route'];
                        },
                      ),
                    ),
                    child: Container(
                      decoration: Styles().categoriesDecoration,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Constants().mainCategoriesMap[index]['icon'],
                          Text(
                            Constants().mainCategoriesMap[index]['title'],
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            //
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('اقترح متجر'),
            )
          ],
        ),
      ),
    );
  }
}
