import 'package:flutter/material.dart';
import '../../routes/app_routes.dart'; // Route: AppRoutes.home
import '../widgets/store_card.dart';
import '../widgets/category_icons.dart';
import '../widgets/local_svg_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFDFB), // surface/surface-primary
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFDFB),
        elevation: 0,
        toolbarHeight: 60,
        title: Row(
          children: [
            const LocalSvgIcon(
              'location',
              size: 24,
              color: Color(0xFF757575),
            ),
            const SizedBox(width: 8),
            Text(
              '위치를 선택해주세요',
              style: textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF757575),
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to notifications
            },
            icon: const LocalSvgIcon(
              'alarm',
              size: 24,
              color: Color(0xFF757575),
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigate to favorites
            },
            icon: const LocalSvgIcon(
              'heart',
              size: 24,
              color: Color(0xFF757575),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 20),
                
                // Search Field
                _buildSearchField(context),
                
                const SizedBox(height: 20),
                
                // Category Buttons
                _buildCategoryButtons(),
                
                const SizedBox(height: 20),
                
                // Filter Header
                _buildFilterHeader(textTheme),
                
                const SizedBox(height: 20),
              ]),
            ),
          ),
          
          // Store List
          _buildStoreListSliver(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF757575).withOpacity(0.09),
            const Color(0xFFB0B0B0).withOpacity(0.09),
          ],
        ),
        borderRadius: BorderRadius.circular(360),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for stores',
          hintStyle: TextStyle(
            color: const Color(0xFF757575).withOpacity(0.62),
            fontSize: 17,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF757575),
            size: 18,
          ),
          suffixIcon: const Icon(
            Icons.mic,
            color: Color(0xFF757575),
            size: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(360),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10.5,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    final categories = [
      {'name': '전체', 'isActive': true, 'iconWidget': null},
      {'name': '해산물', 'isActive': false, 'iconWidget': const SeafoodIcon()},
      {'name': '조리식품', 'isActive': false, 'iconWidget': const CookedIcon()},
      {'name': '채소 · 과일', 'isActive': false, 'iconWidget': const VegieIcon()},
      {'name': '장류 · 양념', 'isActive': false, 'iconWidget': const SeasoningIcon()},
      {'name': '한방', 'isActive': false, 'iconWidget': const HealthIcon()},
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: categories.map((category) {
        final isActive = category['isActive'] as bool;
        final iconWidget = category['iconWidget'] as Widget?;
        final name = category['name'] as String;
        
        return Container(
          decoration: BoxDecoration(
            gradient: isActive
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFC6007E), Color(0xFF93328E)],
                  )
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFFB0B0B0).withOpacity(0.5),
                      const Color(0xFF281D1B).withOpacity(0.5),
                    ],
                  ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: const Color(0xFFA7B6C2),
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconWidget != null) ...[
                  iconWidget,
                  const SizedBox(width: 4),
                ],
                Text(
                  name,
                  style: TextStyle(
                    color: const Color(0xFFFFFDFB),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFilterHeader(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '현재 위치에서 가까운 가게들을 만나보세요',
          style: textTheme.titleMedium?.copyWith(
            color: const Color(0xFF757575),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Icon(
          Icons.tune,
          color: Color(0xFF757575),
          size: 24,
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFDFB),
        border: Border(
          top: BorderSide(
            color: Color(0xFFE0E0E0),
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              iconName: 'home',
              isSelected: true,
              onTap: () {
                // Already on home
              },
            ),
            _buildNavItem(
              iconName: 'schedule',
              isSelected: false,
              onTap: () {
                // Navigate to schedule
              },
            ),
            _buildNavItem(
              iconName: 'map',
              isSelected: false,
              onTap: () {
                // Navigate to map
              },
            ),
            _buildNavItem(
              iconName: 'chat',
              isSelected: false,
              onTap: () {
                // Navigate to chat
              },
            ),
            _buildNavItem(
              iconName: 'user',
              isSelected: false,
              onTap: () {
                // Navigate to profile
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String iconName,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: LocalSvgIcon(
          iconName,
          size: 14, // 약간만 더 작게 조정
          color: isSelected 
              ? const Color(0xFFC6007E) // Primary color for selected
              : const Color(0xFF757575), // Gray for unselected
        ),
      ),
    );
  }

  Widget _buildStoreListSliver() {
    final stores = [
      {
        'name': '청과원',
        'category': '과일',
        'rating': 4.2,
        'priceRange': '₩29,700',
        'pickupTime': '픽업시간: 6~7시',
        'imageUrl': 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=400&h=300&fit=crop',
      },
      {
        'name': '영원유과',
        'category': '가공식품',
        'rating': 4.8,
        'priceRange': '₩29,700',
        'pickupTime': '픽업시간: 6~7시',
        'imageUrl': 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&h=300&fit=crop',
      },
      {
        'name': '김씨네 채소 가게',
        'category': '채소',
        'rating': 4.5,
        'priceRange': '₩29,700',
        'pickupTime': '픽업시간: 6~7시',
        'imageUrl': 'https://images.unsplash.com/photo-1542838132-92c53300491e?w=400&h=300&fit=crop',
      },
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final store = stores[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == stores.length - 1 ? 20 : 12,
              ),
              child: StoreCard(
                storeName: store['name'] as String,
                category: store['category'] as String,
                rating: store['rating'] as double,
                priceRange: store['priceRange'] as String,
                pickupTime: store['pickupTime'] as String,
                imageUrl: store['imageUrl'] as String?,
                onTap: () {
                  // Navigate to store detail
                  Navigator.pushNamed(context, AppRoutes.cart);
                },
                onFavoritePressed: () {
                  // Handle favorite toggle
                },
              ),
            );
          },
          childCount: stores.length,
        ),
      ),
    );
  }
}
