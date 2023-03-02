import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/view_models/screens/interface/ihome_screen_view_model.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/category_item.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:kid_shop/ui/common_widgets/custom_text_form_field.dart';
import 'package:kid_shop/ui/common_widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatefulWidget {
  final AccountDto? accountDto;

  const HomePage({Key? key, required this.accountDto}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final IHomeScreenViewModel _homeScreenViewModel;

  @override
  void initState() {
    _homeScreenViewModel = context.read<IHomeScreenViewModel>();
    _homeScreenViewModel.getListProductByType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: Text(
          'Home',
          style: AppStyle.titleAppBar(),
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.png'),
              radius: 14,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Hello ${widget.accountDto == null ? '' : widget.accountDto!.username}!'),
            SizedBox(height: 7.h),
            Text(
              'What are you looking for ?',
              style: AppStyle.h3(),
            ),
            SizedBox(height: 7.h),
            CustomTextFormField(
              controller: searchController,
              hint: 'Search keywords...',
              onSubmitted: (String value) {},
            ),
            SizedBox(height: 30.h),
            Image.asset('assets/images/banner.png'),
            SizedBox(height: 15.h),
            Text(
              'Categories',
              style: AppStyle.h2(),
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryItem(
                  title: 'Fruit',
                  imageUrl: 'assets/images/fruit.png',
                  onTap: () =>
                      _homeScreenViewModel.changeFeaturedProduct('fruit'),
                ),
                CategoryItem(
                  title: 'Meat',
                  imageUrl: 'assets/images/meat.png',
                  onTap: () =>
                      _homeScreenViewModel.changeFeaturedProduct('meat'),
                ),
                CategoryItem(
                  title: 'Rice',
                  imageUrl: 'assets/images/rice.png',
                  onTap: () =>
                      _homeScreenViewModel.changeFeaturedProduct('rice'),
                ),
                CategoryItem(
                  title: 'Bakery',
                  imageUrl: 'assets/images/bakery.png',
                  onTap: () =>
                      _homeScreenViewModel.changeFeaturedProduct('bakery'),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Text(
              'Featured products',
              style: AppStyle.h2(),
            ),
            SizedBox(height: 10.h),
            Consumer<IHomeScreenViewModel>(
              builder: (_, value, __) {
                return Visibility(
                  visible: value.products != null,
                  replacement: SizedBox(
                    width: Get.width * 0.4,
                    height: 300.h,
                    child: ProductItem(
                      productDto: ProductDto(
                        id: 'id',
                        productName: 'productName',
                        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2bXZbyjsy2knyTmAfr8YheMeSV1vdVXr6ag&usqp=CAU',
                        category: 'category',
                        price: 0.0,
                        height: 12.0,
                        description: 'description',
                        numberOfReview: 1.0,
                        averagePoint: 1,
                      ),
                    ),
                  ),
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount:
                          value.products == null ? 0 : value.products!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItem(productDto: value.products![index]);
                      }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
