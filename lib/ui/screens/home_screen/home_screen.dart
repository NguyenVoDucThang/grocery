import 'package:flutter/material.dart';
import 'package:kid_shop/core/constants/app_colors.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/core/view_models/screens/interface/iauthentication_view_model.dart';
import 'package:kid_shop/global/locator.dart';
import 'package:kid_shop/ui/screens/home_screen/widgets/cart_page.dart';
import 'package:kid_shop/ui/screens/home_screen/widgets/favorite_page.dart';
import 'package:kid_shop/ui/screens/home_screen/widgets/home_page.dart';
import 'package:kid_shop/ui/screens/home_screen/widgets/profile_page.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    locator.get<IHomeScreenService>().getCarts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getBody(context.read<IAuthenticationViewModel>().accountDto),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) => setState(() => _currentIndex = newIndex),
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home_outlined,
                color:
                    _currentIndex == 0 ? AppColors.primaryGreen : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.favorite_border_outlined,
                color:
                    _currentIndex == 1 ? AppColors.primaryGreen : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.add_shopping_cart,
                color:
                    _currentIndex == 2 ? AppColors.primaryGreen : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.person_outline,
                color:
                    _currentIndex == 3 ? AppColors.primaryGreen : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody(AccountDto? accountDto) {
    switch (_currentIndex) {
      case 0:
        return HomePage(accountDto: accountDto);
      case 1:
        return const FavoritePage();
      case 2:
        return const CartPage();
      case 3:
        return ProfilePage(accountDto: accountDto);
      default:
        return HomePage(accountDto: accountDto);
    }
  }
}
