import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_app1/core/widgets/custom_progress_indicator.dart';

class BuildElectricalGrid extends StatelessWidget {
  const BuildElectricalGrid(
      {super.key, required this.image, required this.name, required this.size});
  final String image;
  final String name;
  final int size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      width: size.width * 0.4,
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 130,
                height: 140,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: 'http://192.168.1.106/fixx/$image',
                  placeholder: (context, url) => const CustomProgressIndicator(),
                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error_outline,color: Colors.red,),),
                  
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 2.0),
            Center(
              child: Text(
                size.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
