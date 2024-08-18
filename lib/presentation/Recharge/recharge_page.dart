import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/recharge_form_cubit.dart';
import 'recharge_controller.dart';
import 'repo/rechargeFormModel.dart'; // Import the controller

class RechargeFormPage extends StatefulWidget {
  const RechargeFormPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RechargeFormPageState createState() => _RechargeFormPageState();
}

class _RechargeFormPageState extends State<RechargeFormPage> {
  final _formKey = GlobalKey<FormState>();
  final RechargeController _rechargeController =
      RechargeController(); // Create an instance of the controller

  // Controllers
  final TextEditingController _operatorNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _receiverMobileNumberController =
      TextEditingController();
  final TextEditingController _individualRemarksController =
      TextEditingController();
  final List<TextEditingController> _additionalParameterControllers =
      List.generate(10, (index) => TextEditingController());

  @override
  void dispose() {
    _operatorNameController.dispose();
    _amountController.dispose();
    _receiverMobileNumberController.dispose();
    _individualRemarksController.dispose();
    for (var controller in _additionalParameterControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _downloadForm(List<List<String>> currentFormState) async {
    if (_formKey.currentState!.validate()) {
      // Prepare the data
      List<String> rowData = [
        _operatorNameController.text,
        _amountController.text,
        _receiverMobileNumberController.text,
        _individualRemarksController.text,
        ..._additionalParameterControllers.map((controller) => controller.text),
      ];
      // Use the controller to handle CSV download or saving
      await _rechargeController.handleCsvDownload(currentFormState);

      // Print the data to the console
      print('Form Submitted');
      print(rowData);
    }
  }

  // add data
  void _addFormData(RechargeFormCubit rechargeFormCubit) async {
    if (_formKey.currentState!.validate()) {
      // Prepare the data
      final rechargeData = RechargeFormModel(
        operatorName: _operatorNameController.text,
        amount: _amountController.text,
        receiverMobileNumber: _receiverMobileNumberController.text,
        individualRemarks: _individualRemarksController.text,
        additionalParameters: _additionalParameterControllers
            .map((controller) => controller.text)
            .toList(),
      );

      print("object: ${rechargeData.toCsvRow()}");

      rechargeFormCubit.addForm(rechargeData.toCsvRow());
    }
  }

  @override
  Widget build(BuildContext context) {
    final rechargeFormCubit = BlocProvider.of<RechargeFormCubit>(context);

    return BlocConsumer<RechargeFormCubit, List<List<String>>>(
      bloc: rechargeFormCubit,
      listener: (context, state) {
        // Optionally handle state changes here
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recharge Form'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  _buildTextField(_operatorNameController, 'Operator Name',
                      'Enter operator name'),
                  _buildTextField(_amountController, 'Amount', 'Enter amount',
                      keyboardType: TextInputType.number),
                  _buildTextField(_receiverMobileNumberController,
                      'Receiver Mobile Number', 'Enter mobile number',
                      keyboardType: TextInputType.phone),
                  _buildTextField(_individualRemarksController,
                      'Individual Remarks', 'Enter remarks',
                      optional: true),
                  ..._buildAdditionalParameters(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _addFormData(rechargeFormCubit);
                    },
                    child: const Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _downloadForm(state);
                    },
                    child: const Text('Download'),
                  ),
                  Text('Bloc Data: $state'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hint,
      {TextInputType keyboardType = TextInputType.text,
      bool optional = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        validator: optional
            ? null
            : (value) {
                if (value == null || value.isEmpty) {
                  return '$label is required';
                }
                return null;
              },
      ),
    );
  }

  List<Widget> _buildAdditionalParameters() {
    List<Widget> additionalFields = [];
    for (int i = 0; i < _additionalParameterControllers.length; i++) {
      additionalFields.add(_buildTextField(_additionalParameterControllers[i],
          'Additional Parameter ${i + 1}', 'Enter parameter ${i + 1}',
          optional: true));
    }
    return additionalFields;
  }
}
