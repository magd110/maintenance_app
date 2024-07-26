import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';
import 'package:maintenance_app1/features/add_order/presentation/manager/cubit/show_electric_cubit.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/build_electrical_grid.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/header_clipper.dart';

class ShowElectricalBody extends StatelessWidget {
  const ShowElectricalBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ShowElectricCubit,ShowElectricState>(
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.2,
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Maintenance',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue[800],
                      shadows: [
                        Shadow(
                          offset: const Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.grey[500]!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Text("اختر الآلة التي تريد تقديم طلب صيانة لها "),
          Expanded(
            child: state is ShowElectricSuccessState ? GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.2,crossAxisSpacing: 1,mainAxisSpacing: 1),
              itemBuilder: (context, index) => BuildElectricalGrid(image: state.electric[index].photo!, name: state.electric[index].name!, size: state.electric[index].size!,) ,
              itemCount: state.electric.length,
            ) : const CustomProgressIndicator(),
          ),
        ]);
      },
    );
  }
}
