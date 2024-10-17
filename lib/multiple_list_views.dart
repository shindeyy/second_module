import 'package:flutter/material.dart';

class MultipleListViews extends StatelessWidget {
  const MultipleListViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(10, (index) {
                  return Container(
                    width: 90.0, // Fixed width for each item
                    height: 90.0, // Height of each item can vary
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.blueAccent,
                    child: Center(child: Text('Item $index')),
                  );
                }),
              ),
            );
          },
        ),
        // Vertical ListView
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 20, // Number of items in the vertical ListView
            itemBuilder: (context, index) {
              return Container(
                height:
                    100.0, // Fixed height for each item in the vertical ListView
                margin: const EdgeInsets.all(8.0),
                color: Colors.greenAccent,
                child: Center(child: Text('Item $index')),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SynchronizedListView extends StatelessWidget {
  const SynchronizedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // Sliver for the horizontal ListView
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 50,
              itemBuilder: (context, index) {
                return Container(
                  width: 150.0,
                  margin: const EdgeInsets.only(left: 16),
                  child: Card(
                    elevation: 1,
                    color: Colors.primaries[index % Colors.primaries.length],
                  ),
                );
              },
            ),
          ),
        ),
        // Sliver for the vertical ListView
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height:
                    300.0, // Fixed height for each item in the vertical ListView
                margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Card(
                  elevation: 1,
                  color: Colors.primaries[index % Colors.primaries.length],
                  child:  AspectRatio(
                    aspectRatio: 200 / 300,
                    child: Image.network(
                      'https://picsum.photos/200/300',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              );
            },
            childCount: 100,
          ),
        ),
      ],
    );
  }
}
