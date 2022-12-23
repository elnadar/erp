import 'package:erp/components/text_weights.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/material_info_cubit.dart';

class MaterialInfo extends StatefulWidget {
  const MaterialInfo({super.key});

  @override
  State<MaterialInfo> createState() => _MaterialInfoState();
}

class _MaterialInfoState extends State<MaterialInfo> {
  late final MaterialInfoCubit _cubit;
  @override
  void initState() {
    _cubit = BlocProvider.of<MaterialInfoCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MaterialInfoCubit, MaterialInfoState>(
        builder: (context, state) {
          if (state is MaterialInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MaterialInfoDone) {
            return Center(child: H1(_cubit.model?.name ?? ""));
          }
          debugPrint(state.toString());
          return const Center(child: Text("Not Found"));
        },
      ),
    );
  }
}
