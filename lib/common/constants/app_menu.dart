import '../../presentation/screens/screens.dart';
import 'app_icon.dart';

final List homeScreens = [
  const MainScreen(),
  const FavoriteScreen(),
  const PremiumScreen(),
  const SearchScreen(),
  const AccountScreen(),
];

final List<Map> homeBottomNavItems = [
  {
    'icon': AppIcon.appHome,
    'iconFilled': AppIcon.appHomeFilled,
    'label': 'Home',
  },
  {
    'icon': AppIcon.appFavorite,
    'iconFilled': AppIcon.appFavoriteFilled,
    'label': 'Favorite',
  },
  {
    'icon': AppIcon.appPremium,
    'iconFilled': AppIcon.appPremium,
    'label': 'Premium',
  },
  {
    'icon': AppIcon.appSearch,
    'iconFilled': AppIcon.appSearchFilled,
    'label': 'Search',
  },
  {
    'icon': AppIcon.appUser,
    'iconFilled': AppIcon.appUser,
    'label': 'Account',
  },
];
