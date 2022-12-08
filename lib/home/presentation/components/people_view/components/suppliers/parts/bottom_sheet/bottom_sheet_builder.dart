part of '../../suppliers_view.dart';

Widget _builderOfSheetBuilder(BuildContext context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: BlocProvider<SuppliersAddCubit>(
          create: (context) => SuppliersAddCubit(),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: _AddSupplierForm(),
          ),
        ),
      ),
    );
