import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String image;
  const LoadingWidget({
    super.key,
    required this.image,
    });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      // "assets/anime-loading.gif",
      height: 150,
      fit: BoxFit.contain,
      gaplessPlayback: true,
      alignment: Alignment.center,
    );



    // return Image.network(
    //   "https://www.google.com/url?sa=i&url=https%3A%2F%2Fgifer.com%2Fde%2Fgifs%2Fkawaii-anime&psig=AOvVaw1pA4wRrhHP_ZjSXGCH2rgi&ust=1748093239163000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCLjkrvfYuY0DFQAAAAAdAAAAABAs", 
    //   fit: BoxFit.cover,
    //   height: 150,
    // );
  }
}
