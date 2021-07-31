import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    @required this.items,
    @required this.builder,
    @required this.cta,
    @required this.label,
    @required this.onPressed,
    @required this.height,
  });

  final String label, cta;
  final List<dynamic> items;
  final void Function(BuildContext context, int index) builder;
  final void Function() onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.label,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: this.onPressed,
                child: Text(this.cta),
              ),
            ],
          ),
        ),
        SizedBox(
          height: this.height,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemCount: this.items.length,
            itemBuilder: builder,
          ),
        ),
      ],
    );
  }
}
