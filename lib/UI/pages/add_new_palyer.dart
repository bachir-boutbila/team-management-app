import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:team_management_app/UI/widgets/custom_app_bar.dart';
import 'package:team_management_app/models/design_properties.dart';
import 'package:team_management_app/models/player_data.dart';

class AddNewPalyer extends StatefulWidget {
  const AddNewPalyer({super.key});

  @override
  State<AddNewPalyer> createState() => _AddPlayerBodyState();
}

class _AddPlayerBodyState extends State<AddNewPalyer> {
  final _formKey = GlobalKey<FormState>();

  final _familyName = TextEditingController();
  final _name = TextEditingController();
  final _birthDate = TextEditingController();
  final _fatherName = TextEditingController();
  final _fatherPhone = TextEditingController();
  final _playerNumber = TextEditingController();

  DateTime? _selectedDate;

  @override
  void dispose() {
    _familyName.dispose();
    _name.dispose();
    _birthDate.dispose();
    _fatherName.dispose();
    _fatherPhone.dispose();
    _playerNumber.dispose();
    super.dispose();
  }

  String? _required(String? v) =>
      (v == null || v.trim().isEmpty) ? 'هذا الحقل مطلوب' : null;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(now.year - 10),
      firstDate: DateTime(1980),
      lastDate: now,
    );
    if (picked == null) return;
    setState(() {
      _selectedDate = picked;
      _birthDate.text = '${picked.year}/${picked.month}/${picked.day}';
    });
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(text, textAlign: TextAlign.center)));
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final box = Hive.box<PlayerData>('players');
    final number = _playerNumber.text.trim();

    if (box.values.any((p) => p.playerNumber == number)) {
      _showMessage('رقم اللاعب مستخدم بالفعل');
      return;
    }

    await box.add(
      PlayerData(
        _familyName.text.trim(),
        _name.text.trim(),
        _selectedDate!,
        _fatherName.text.trim(),
        _fatherPhone.text.trim(),
        number,
      ),
    );

    if (!mounted) return;
    _formKey.currentState!.reset();
    setState(() => _selectedDate = null);
    _showMessage('تمت إضافة اللاعب');
  }

  /// Heading + underline input, separated by objectPadding.
  Widget _field({
    required String label, // heading, e.g. "اللقب"
    required TextEditingController controller,
    TextInputType? keyboardType,
    List<TextInputFormatter>? formatters,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: objectPadding),
        TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: keyboardType,
          inputFormatters: formatters,
          readOnly: readOnly,
          onTap: onTap,
          validator: _required,
          style: TextStyle(color: textColor, fontSize: 16),
          decoration: InputDecoration(
            hintText: 'ادخل $label',
            hintStyle: TextStyle(color: textColor.withOpacity(0.4)),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: objectPadding),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: textColor.withOpacity(0.4)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        // top: false because the AppBar already handles the top inset.
        // No bottom nav bar here, so the card runs down to the bottom edge,
        // kept mainPadding away from it.
        child: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.all(mainPadding),
            child: Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(groupPadding),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(groupPadding),
                    child: ConstrainedBox(
                      // Keeps the button at the bottom when the content is short,
                      // and lets everything scroll when it is long.
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - groupPadding * 2,
                      ),
                      child: IntrinsicHeight(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _field(label: 'اللقب', controller: _familyName),
                              SizedBox(height: ePadding),
                              _field(label: 'الاسم', controller: _name),
                              SizedBox(height: ePadding),
                              _field(
                                label: 'تاريخ الميلاد',
                                controller: _birthDate,
                                readOnly: true,
                                onTap: _pickDate,
                              ),
                              SizedBox(height: ePadding),
                              _field(
                                label: 'اسم الأب',
                                controller: _fatherName,
                              ),
                              SizedBox(height: ePadding),
                              _field(
                                label: 'رقم هاتف الأب',
                                controller: _fatherPhone,
                                keyboardType: TextInputType.phone,
                                formatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                              SizedBox(height: ePadding),
                              _field(
                                label: 'رقم اللاعب',
                                controller: _playerNumber,
                                keyboardType: TextInputType.number,
                                formatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                              SizedBox(height: groupPadding),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: _save,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  foregroundColor: Colors.white,
                                  // horizontal = groupPadding + ePadding = 40
                                  // vertical   = ePadding = 16
                                  padding: EdgeInsets.symmetric(
                                    horizontal: groupPadding + ePadding,
                                    vertical: ePadding,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      ePadding,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'اضف لاعب',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
