import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:proj_app_roberto/models/negocios_models.dart';

class SwiperWidget extends StatelessWidget {
  const SwiperWidget({super.key, required this.lista});

  final List? lista;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: _swiper(context),
    );
  }
  
  Widget _swiper(context){
    final screenSize = MediaQuery.of(context).size;
    return Swiper(
      itemHeight: screenSize.height * 0.5,
      itemWidth: screenSize.width * 0.7,
      layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context,int index){
          return Image.network(
            "http://via.placeholder.com/350x150",
            fit: BoxFit.fill
          );
        },
        itemCount: 3,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
    );
  }
}