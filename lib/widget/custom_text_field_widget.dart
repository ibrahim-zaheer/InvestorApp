import 'package:flutter/material.dart';

//we use this code so that we don't have to rewrite text editing controller everytime
class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController? editingController;
  final IconData? iconData;
  final String? assetRef;
  final String? labelText;
  final bool? isHidden;
  const CustomTextFieldWidget(
      {super.key,
      this.editingController,
      this.iconData,
      this.assetRef,
      this.labelText,
      this.isHidden});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: editingController,
      decoration: InputDecoration(
        label: Text(labelText.toString()),
        prefixIcon: iconData != null
            ? Icon(iconData)
            : Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(assetRef.toString()),
              ),
        labelStyle: const TextStyle(
          fontSize: 10,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.grey)),
      ),
      obscureText: isHidden!,
    );
  }
}
