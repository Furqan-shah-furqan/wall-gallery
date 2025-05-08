import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../services/cart_class.dart';

class CardLayout extends StatefulWidget {
  const CardLayout({
    super.key,
    this.crossAxisCount,
    required this.mainAxisSpacing,
    this.crossAxisSpacing,
  });

  final dynamic crossAxisCount;
  final double mainAxisSpacing;
  final double? crossAxisSpacing;

  @override
  State<CardLayout> createState() => _CardLayoutState();
}

class _CardLayoutState extends State<CardLayout> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final cart = Provider.of<Cart>(context, listen: false);
      await cart.fetchImages(query: cart.selectedcategory);
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MasonryGridView.count(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: value.imageList.length,
                  crossAxisCount: widget.crossAxisCount,
                  mainAxisSpacing: widget.mainAxisSpacing,
                  crossAxisSpacing: widget.crossAxisSpacing ?? 5.0,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            value.imageList[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color.fromARGB(255, 255, 161, 161),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // ✅ Show single loader at bottom
            if (value.isLoading)
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                      child: Lottie.asset('assets/Images/animation.json',
                          height: 200, width: 200))),
          ],
        );
      },
    );
  }
}
