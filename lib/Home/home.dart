import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../responsive/Pages/desktop_body.dart';
import '../responsive/Pages/laptop_body.dart';
import '../responsive/Pages/mobile_body.dart';
import '../responsive/Pages/tablet_body.dart';
import '../responsive/resposive_layout.dart';
import '../services/cart_class.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              'WALL GALLERY',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        cursorHeight: 13.sp,
                        style: TextStyle(
                            fontSize: 13.sp), // Smaller text = smaller height
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          isDense: true, // Reduces default vertical padding
                          hintStyle: TextStyle(
                            fontSize: 17.sp,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 17,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.r),
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: const BorderSide(
                              width: 0.2,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                      color: Colors.black,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: const AutoSizeText('SEARCH',style: TextStyle(color: Colors.white),),
                    ),
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
              height: 55.h, // increased for better tap area
              child: Consumer<Cart>(
                builder: (context, cart, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics:
                        const BouncingScrollPhysics(), // 🚀 Smooth sliding bounce
                    itemCount: cart.wallCategory.length,
                    itemBuilder: (context, index) {
                      final isSelected =
                          cart.selectedcategory == cart.wallCategory[index];
                      final categoryName = cart.wallCategoryName[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.r),
                        child: MaterialButton(
                          color: isSelected ? Colors.grey : Colors.black,
                          textColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          onPressed: () {
                            cart.fetchImages(query: cart.wallCategory[index]);
                          },
                          child: AutoSizeText(
                            categoryName,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      );
                    },
                  );
                },
              )),
          SizedBox(height: 20.h),
          const Expanded(
            child: ResponsiveLayout(
                mobile: MoblileBody(),
                tablet: TabletBody(),
                laptop: LaptopBody(),
                desktop: DesktopBody()),
          ),
        ],
      )),
    );
  }
}
