import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PengajuanPendanaan extends StatelessWidget {
  const PengajuanPendanaan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pengajuan Pendanaan'),
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Image.network(
                    'https://picsum.photos/300/100',
                    width: 300,
                    height: 100,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 6.24),
                        child: Text(
                          'Jumlah Pengajuan Dana',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Color(0xff343434),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(color: Color(0xffbcbcbc)),
                            ),
                            fillColor: Color(0xffffffff),
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 6.24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Rincian Anggaran Biaya',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Color(0xff343434),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 6.24),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        PlatformFile file = result.files.first;
                        // Gunakan file yang dipilih
                        print('Path file:${file.path}');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      onPrimary: Color(0xff343434),
                      side: BorderSide(color: Color(0xff343434)),
                    ),
                    icon: const Icon(Icons.attach_file),
                    label: const Text('Choose File'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 6.24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Jangka Waktu Investasi',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Color(0xff343434),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 6.24),
                  height: 40,
                  padding: EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Color(0xff343434)),
                    // color: Color(0xff202441),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                          isDense: true,
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'option1',
                            child: const Text('Option 1'),
                          ),
                          DropdownMenuItem(
                            value: 'option2',
                            child: const Text('Option 2'),
                          ),
                          DropdownMenuItem(
                            value: 'option3',
                            child: const Text('Option 3'),
                          ),
                        ],
                        onChanged: (value) {
                          // Action when dropdown value is changed
                        },
                        hint: const Text('Pilih opsi'),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 6.24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Potensi Pertumbuhan Bisnis',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        // color: Color(0xff343434),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 6.24),
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        PlatformFile file = result.files.first;
                        // Gunakan file yang dipilih
                        print('Path file:${file.path}');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      onPrimary: Color(0xff343434),
                      side: BorderSide(color: Color(0xff343434)),
                    ),
                    icon: const Icon(Icons.attach_file),
                    label: const Text('Choose File'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {
                        // Action when checkbox value is changed
                      },
                    ),
                    Flexible(
                      child: const Text(
                          'Saya setuju dengan syarat dan ketentuan yang berlaku dan telah ditentukan'),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action when button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff202441),
                    ),
                    child: const Text('Lanjutkan'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}