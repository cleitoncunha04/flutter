import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_counter_bloc/bloc/counter_bloc.dart';

class DecrementIncrementFloatingButton extends StatelessWidget {
  const DecrementIncrementFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => context.read<CounterBloc>().add(
                CounterDecremented(),
              ),
          tooltip: 'Decrement',
          child: const Icon(
            Icons.remove,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        FloatingActionButton(
          onPressed: () => context.read<CounterBloc>().add(
                CounterIncremented(),
              ),
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}
