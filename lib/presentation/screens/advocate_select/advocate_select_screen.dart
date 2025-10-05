import 'package:flutter/material.dart';

class AdvocateSelectScreen extends StatelessWidget {
  const AdvocateSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выберите адвоката')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Добро пожаловать в Юридический помощник!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Позже: переход к чату с Анной
              },
              child: const Text('Анна — добрая юристка'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Позже: переход к чату с Александром
              },
              child: const Text('Александр — строгий защитник'),
            ),
          ],
        ),
      ),
    );
  }
}