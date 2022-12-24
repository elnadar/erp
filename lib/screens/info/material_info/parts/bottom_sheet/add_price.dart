part of '../../material_info.dart';

Widget _builderOfSheetBuilder(BuildContext context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: BlocProvider<PricesAddCubit>(
          create: (context) => PricesAddCubit(),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: _AddPriceForm(),
          ),
        ),
      ),
    );
