import 'package:arb_manager/pages/index/page.dart';
import 'package:arb_manager/pages/main/widgets/title_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.deepPurple,
            ))),
            child: const TitleBar(),
          ),
          Expanded(
              child: Row(
            children: [
              // Container(
              //   width: 60,
              //   decoration: const BoxDecoration(
              //       border: Border(
              //           right: BorderSide(
              //     color: Colors.deepPurple,
              //   ))),
              // ),
              const Expanded(child: IndexPage())
            ],
          ))
        ],
      ),
    );
  }
}
