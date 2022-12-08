import 'package:erp/components/text_weights.dart';
import 'package:erp/screens/home/components/people_view/components/suppliers/data/supplier_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/supplier_info/supplier_info_cubit.dart';

class SupplierInfo extends StatefulWidget {
  const SupplierInfo({super.key});

  @override
  State<SupplierInfo> createState() => _SupplierInfoState();
}

class _SupplierInfoState extends State<SupplierInfo> {
  late final SupplierInfoCubit _cubit;
  @override
  void initState() {
    _cubit = BlocProvider.of<SupplierInfoCubit>(context);
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
      body: BlocBuilder<SupplierInfoCubit, SupplierInfoState>(
        builder: (context, state) {
          if (state is SupplierInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SupplierInfoDone) {
            return Center(child: H1(_cubit.model?.name ?? ""));
          }
          debugPrint(state.toString());
          return const Center(child: Text("Not Found"));
        },
      ),
    );
  }
}
