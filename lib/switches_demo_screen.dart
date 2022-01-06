import 'package:flutter/material.dart';

class SwitchesDemoScreen extends StatefulWidget {
  const SwitchesDemoScreen({Key? key}) : super(key: key);

  @override
  _SwitchesDemoScreenState createState() => _SwitchesDemoScreenState();
}

enum SkillLevel {Junior, middle, senior}

  class _SwitchesDemoScreenState extends State<SwitchesDemoScreen> {
  bool _checked = false;
  bool _confirmAgreement = true;
  SkillLevel? _skillLevel = SkillLevel.Junior;

  void _onCheckedChange(bool? val){
    setState(() {
      _checked = !_checked;
    });
  }

  void _onSkillLevelChanged (SkillLevel? value) {
  setState(() {
  _skillLevel = value;
  });
  }

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  home: Scaffold(
  appBar: AppBar(),
  body: Center(
  child: Column(children: [
  Row(
  children: [
  Checkbox(value: _checked, onChanged: _onCheckedChange),

  Text('Выбор'),
  ],
  ),
  CheckboxListTile(
  title: Text('Принять условия соглашения'),
  value: _confirmAgreement, onChanged: (val) {
    setState(() {
      _confirmAgreement=!_confirmAgreement;
    });
  }),
    Row(
      children: [
        Switch(value: _checked, onChanged: _onCheckedChange),
        const Text('Включить'),
      ],
    ),
    SwitchListTile(
      title: const Text('Включить'),
        value: _checked,
        onChanged: _onCheckedChange),
    const Text('Уровень навыков'),
    RadioListTile<SkillLevel>(
      title: const Text('Junior'),
      value: SkillLevel.Junior,
      groupValue: _skillLevel,
      onChanged: _onSkillLevelChanged
    ),
    RadioListTile<SkillLevel>(
      title: const Text('Middle'),
      value: SkillLevel.middle,
      groupValue: _skillLevel,
      onChanged: _onSkillLevelChanged,
    ),
    RadioListTile<SkillLevel>(
      title: const Text('Senior'),
      value: SkillLevel.senior,
      groupValue: _skillLevel,
      onChanged: _onSkillLevelChanged,
    ),
  ]))));
  }
  }
