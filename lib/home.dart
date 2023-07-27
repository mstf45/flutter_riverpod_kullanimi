import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterProvider);
    var names = ref.watch(appbarName);

    return Scaffold(
      appBar: AppBar(
        title: Text(names),
      ),
      body: Center(
        child: Text(
          '$value',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.extended(
              label: const Text('Azalt'),
              icon: const Icon(Icons.remove),
              onPressed: () {
                var a = ref.read(counterProvider.state);
                if (a.state > 0) {
                  a.state--;
                }
              },
            ),
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.state).state++;
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  final appbarName = StateProvider<String>(
    (ref) {
      const String name = 'Riverpod Kullanımı';
      return name;
    },
  );

  final counterProvider = StateProvider<int>(
    (ref) {
      const int deger = 0;
      return deger;
    },
  );
}
