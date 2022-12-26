import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ik8_otus_food/src/domain/entities/recipe.dart';

import '../../widgets/widgets.dart';

String bullet = "\u2022 ";

class CurrentRecipePage extends StatelessWidget {
  final Recipe data;

  const CurrentRecipePage(this.data, {Key? key}) : super(key: key);

  static Route route(Recipe data) {
    return MaterialPageRoute(builder: (_) => CurrentRecipePage(data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Рецепт'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(data.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
          ),
          DurationView(data.seconds),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: AspectRatio(
                aspectRatio: 2,
                child: Image.asset(
                  data.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            'Ингредиенты',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: const Color(0xff797676), width: 3),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Table(
                  // border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(),
                    1: IntrinsicColumnWidth(),
                  },
                  children: [
                    for (var item in [
                      ['Соевый соус', '8 ст. ложек'],
                      ['Вода', '8 ст. ложек'],
                      ['Мёд', '3 ст. ложки'],
                      ['Филе лосося или сёмги', '680 г'],
                    ])
                      TableRow(children: [
                        Text(
                          "$bullet${item[0]}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              height: 1.8),
                        ),
                        Text(
                          item[1],
                          style: const TextStyle(
                              color: Color(0xff797676),
                              fontWeight: FontWeight.w400,
                              height: 1.8),
                        ),
                      ])
                  ],
                )),
          ),
          Text(
            'Шаги приготовления',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          for (int i = 0; i < 7; i++)
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffECECEC)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              margin: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  Flexible(
                      child: Center(
                    child: Text(i.toString()),
                  )),
                  const Flexible(
                    flex: 2,
                      child: Center(
                    // child: Text('В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.'),
                    child: Text('В маленькой '),
                  )),
                  Flexible(
                      child: Center(
                        child: Column(
                          children: const [
                            Icon(Icons.check_box_outline_blank),
                            Text('06:00')
                          ],
                        ),
                      )),
                ],
              ),
            )
        ],
      ),
    );
  }
}
