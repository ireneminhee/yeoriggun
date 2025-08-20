import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 로컬 assets에서 SVG 아이콘을 로드하는 위젯
/// 네트워크 연결이 필요 없어 안정적이고 빠름
class LocalSvgIcon extends StatelessWidget {
  final String name; // 예: 'home' (확장자 제외)
  final double size;
  final Color? color;

  const LocalSvgIcon(
    this.name, {
    super.key,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).iconTheme.color ?? Colors.black;
    
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      placeholderBuilder: (context) => SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(iconColor),
        ),
      ),
      // assets에서 로드 실패 시 Material Icon으로 폴백
      errorBuilder: (context, error, stackTrace) {
        return _getFallbackIcon(name, size, iconColor);
      },
    );
  }

  Widget _getFallbackIcon(String name, double size, Color color) {
    IconData iconData;
    switch (name) {
      // Bottom Navigation Icons
      case 'home':
        iconData = Icons.home;
        break;
      case 'schedule':
        iconData = Icons.schedule;
        break;
      case 'map':
        iconData = Icons.location_on;
        break;
      case 'chat':
        iconData = Icons.chat_bubble_outline;
        break;
      case 'user':
        iconData = Icons.person_outline;
        break;
      // Top Navigation Icons
      case 'location':
        iconData = Icons.location_on_outlined;
        break;
      case 'alarm':
        iconData = Icons.notifications_outlined;
        break;
      case 'heart':
        iconData = Icons.favorite_border;
        break;
      // Category Icons
      case 'seafood':
        iconData = Icons.set_meal;
        break;
      case 'cooked':
        iconData = Icons.restaurant;
        break;
      case 'vegetable':
        iconData = Icons.eco;
        break;
      case 'seasoning':
        iconData = Icons.local_grocery_store;
        break;
      case 'health':
        iconData = Icons.healing;
        break;
      default:
        iconData = Icons.help_outline;
    }
    
    return Icon(iconData, size: size, color: color);
  }
}
