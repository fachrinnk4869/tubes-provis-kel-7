import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InputUmkm extends StatelessWidget {
  const InputUmkm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        // pengajuanpendanaan1ZY (239:307)
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(14, 28, 14, 23.6),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffc0c0c0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // toprq4 (239:308)
                margin: EdgeInsets.fromLTRB(0, 0, 0, 38),
                width: double.infinity,
                height: 93,
                decoration: BoxDecoration(
                  color: Color(0x63ffffff),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // est2yen (239:310)
                      left: 64,
                      top: 0,
                      child: Align(
                        child: SizedBox(
                          width: 164,
                          height: 75,
                          child: Image.network(
                            '[Image url]',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // silahkanisidatadiriandadenganb (239:311)
                      left: 42,
                      top: 64,
                      child: Align(
                        child: SizedBox(
                          width: 207,
                          height: 15,
                          child: Text(
                            'Silahkan Isi Data Diri Anda Dengan Benar',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // namalengkapMfL (239:322)
                margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // jumlahpengajuandanasNn (239:325)
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
                      // rectangle5a2J (239:323)
                      width: double.infinity,
                      height: 39.76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Color(0xffbcbcbc)),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // emailWRk (239:312)
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // emailWRk (239:312)
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 6.24),
                      child: Text(
                        'Email',
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
                      // rectangle5ccH (239:314)
                      width: double.infinity,
                      height: 39.76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Color(0xffbcbcbc)),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // nomorteleponJS0 (239:316)
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // nomorteleponZ5a (239:318)
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 6.24),
                      child: Text(
                        'Nomor Telepon',
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
                      // rectangle5TDa (239:320)
                      width: double.infinity,
                      height: 39.76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Color(0xffbcbcbc)),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
