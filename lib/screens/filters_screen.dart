
import 'package:flutter/material.dart';
import 'package:meals_app/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set your filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: filterState[Filters.gultenFree]!,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filters.gultenFree, isChecked);
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only contains gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filterState[Filters.lactoseFree]!,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filters.lactoseFree, isChecked);
            },
            title: Text(
              'lactose-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only contains lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filterState[Filters.vagentarianFree]!,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filters.vagentarianFree, isChecked);
            },
            title: Text(
              'vegantarian-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only contains vagantarian meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
           value: filterState[Filters.vaganFree]!,
            onChanged: (isChecked) {
              ref.read(filterProvider.notifier).setFilter(Filters.vaganFree, isChecked);
            },
            title: Text(
              'vagan-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Only contains vangan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
