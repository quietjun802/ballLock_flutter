import 'package:flutter/material.dart';
import 'category_screen.dart'; // 카테고리 화면 import

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단 타이틀
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Food\nLocker!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 검색창 + 필터 버튼
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "야구장 검색!",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // ✅ 여기 버튼 누르면 CategoryScreen 이동
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF11AB69),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(14),
                    ),
                    child: const Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // 카테고리 타이틀
              const Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // 카테고리 리스트 (이미지는 그대로 둠)
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategory("Sandwich", "assets/images/sandwich.png"),
                    _buildCategory("Pizza", "assets/images/pizza.png"),
                    _buildCategory("Burger", "assets/images/burger.png"),
                    _buildCategory("Drinks", "assets/images/drinks.png"),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // 추천 타이틀
              const Text(
                "Recommended",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // 추천 메뉴
              Row(
                children: [
                  Expanded(
                      child: _buildFoodCard(
                          "Sandwich", "\$15.50", "assets/images/sandwich.png")),
                  const SizedBox(width: 12),
                  Expanded(
                      child: _buildFoodCard(
                          "Hamburger", "\$19.99", "assets/images/burger.png")),
                ],
              ),
            ],
          ),
        ),
      ),

      // 하단 네비게이션바
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF11AB69),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // 카테고리 위젯 (탭 이벤트 제거됨)
  Widget _buildCategory(String title, String imagePath) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 40,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }

  // 음식 카드 위젯
  Widget _buildFoodCard(String title, String price, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Starting From $price",
            style: const TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
