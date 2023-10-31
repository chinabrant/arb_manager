import 'package:arb_manager/arb/manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalProvider extends StatelessWidget {
  final Widget child;
  const GlobalProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArbManager()),
      ],
      child: child,
    );
  }
}
