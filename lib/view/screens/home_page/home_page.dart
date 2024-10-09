import 'package:contacts_diary/controllers/counter_controller.dart';
import 'package:contacts_diary/controllers/theme_contorller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // int stepperIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeProviderTrue = Provider.of<ThemeController>(context, listen: true);
    var themeProviderFalse =
        Provider.of<ThemeController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact App"),
        actions: [
          IconButton(
            onPressed: () {
              themeProviderFalse.changeThemeValue();
            },
            icon: (themeProviderTrue.themeModel.isTheme)
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${Provider.of<CounterController>(context, listen: true).counterModel.counter}",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 35.sp,
                  ),
            ),
            // FloatingActionButton(
            //
            //   onPressed: () {
            //     Provider.of<CounterController>(context, listen: false)
            //         .increment();
            //   },
            //   child: const Icon(Icons.add),
            // )
          ],
        ),
      ),
      floatingActionButton: Consumer<CounterController>(
        builder: (context, provider, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "hero1",
                onPressed: () {
                  provider.increment();
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              FloatingActionButton(
                heroTag: "hero2",
                onPressed: () {
                  provider.decrement();
                },
                child: const Icon(
                  Icons.remove,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
