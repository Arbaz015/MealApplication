import 'package:flutter/material.dart';

enum Filters {
  GlutenFree,
  LactoseFree,
  VeganFreen,
  VegitarianFree,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});
  final Map<Filters, bool> currentFilter;

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _gultanFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegitarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();

    _gultanFreeFilterSet = widget.currentFilter[Filters.GlutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilter[Filters.LactoseFree]!;
    _vegitarianFreeFilterSet = widget.currentFilter[Filters.VegitarianFree]!;
    _veganFreeFilterSet = widget.currentFilter[Filters.VeganFreen]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filters.GlutenFree: _gultanFreeFilterSet,
            Filters.LactoseFree: _lactoseFreeFilterSet,
            Filters.VeganFreen: _veganFreeFilterSet,
            Filters.VegitarianFree: _veganFreeFilterSet
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gultanFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _gultanFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gulta-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only Include Gultan-Free Meal',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 32),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactosed-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only Include Lactose-Free Meal',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 32),
            ),
            SwitchListTile(
              value: _vegitarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegitarianFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegitarian-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only Include vegitarin-Free Meal',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 32),
            ),
            SwitchListTile(
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              subtitle: Text(
                'Only Include vegan-Free Meal',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 32),
            ),
          ],
        ),
      ),
    );
  }
}
