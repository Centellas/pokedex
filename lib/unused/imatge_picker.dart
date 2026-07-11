import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _file;

  Future<void> _pick(ImageSource source) async {
    final file = await _picker.pickImage(source: source);
    if (!mounted || file == null) return;
    setState(() => _file = file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image picker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => _pick(ImageSource.gallery),
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text('Galeria'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: () => _pick(ImageSource.camera),
                    icon: const Icon(Icons.photo_camera_outlined),
                    label: const Text('Càmera'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _file == null
                  ? const Center(child: Text('Cap imatge seleccionada'))
                  : Image.file(File(_file!.path), fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
