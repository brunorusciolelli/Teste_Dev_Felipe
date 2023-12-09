import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Perfil"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildHeader(),
          ),
          SliverToBoxAdapter(
            child: _buildProfileStats(),
          ),
          SliverToBoxAdapter(
            child: _buildBio(),
          ),
          SliverToBoxAdapter(
            child: _buildPublicacoesTitle(),
          ),
          // SliverGrid commented out, remove if not needed
          // _buildPostsGrid(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            // Change to your desired profile picture
            backgroundColor: const Color.fromARGB(255, 255, 255, 255), 
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nome do Usuário",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Bio...",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("Publicações", "0"),
          _buildStatItem("Seguidores", "0"),
          _buildStatItem("Seguindo", "0"),
        ],
      ),
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildBio() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "Descrição mais detalhada do usuário. Pode incluir interesses, hobbies e outras informações relevantes.",
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildPublicacoesTitle() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "Suas publicações",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // SliverGrid and related methods commented out, remove if not needed
  /*
  Widget _buildPostsGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _buildPostItem(index);
        },
        childCount: 9,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
    );
  }

  Widget _buildPostItem(int index) {
    return Image.asset(
      "assets/post_$index.jpg",
      fit: BoxFit.cover,
    );
  }
  */

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(Icons.home, "Home"),
          _buildNavBarItem(Icons.search, "Buscar"),
          _buildNavBarItem(Icons.add_box, "Criar"),
          _buildNavBarItem(Icons.favorite, "Favoritos"),
          _buildNavBarItem(Icons.person, "Perfil"),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 4),
        Text(title),
      ],
    );
  }
}
