import 'package:flutter/material.dart';
import '../utils/colors.dart';

class HomePageImproved extends StatelessWidget {
  const HomePageImproved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(maxWidth: isTablet ? 500 : 400),
          margin: EdgeInsets.symmetric(horizontal: isTablet ? 20 : 0),
          child: Column(
            children: [
              _buildHeader(),
              _buildMainContent(context),
              _buildBottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Column(
        children: [
          Row(
            children: [
              _buildProfileImage(),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  'SUTINAN SRIVISET',
                  style: AppTextStyles.userNameStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildBalanceCard(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: AppSizes.profileImageSize,
      height: AppSizes.profileImageSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.profileImageSize / 2),
        border: Border.all(color: AppColors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.profileImageSize / 2),
        child: Container(
          color: AppColors.appGreen,
          child: Image.network(
            'https://cdn.builder.io/api/v1/assets/3e98c2e405b4425fb9cb2adbdf1ba7a8/figma-screenshot-e70c86?format=webp&width=800',
            width: AppSizes.profileImageSize,
            height: AppSizes.profileImageSize,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.appGreen,
                child: const Icon(
                  Icons.person,
                  color: AppColors.white,
                  size: 32,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: AppSizes.balanceCardWidth,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.appYellowBright,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.monetization_on,
              color: AppColors.appYellowBright,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            '12,000,000.00',
            style: AppTextStyles.balanceStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              _buildWindowIllustration(),
              _buildCharacterImage(),
              _buildPlant(),
              _buildSettingsPanel(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWindowIllustration() {
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: 298,
          height: 337,
          child: Stack(
            children: [
              // Curtains
              _buildCurtains(),
              // Window Frame
              _buildWindowFrame(),
              // Window Frame Top
              _buildWindowFrameTop(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurtains() {
    return Stack(
      children: [
        // Left Curtain
        Positioned(
          left: 7,
          top: 0,
          child: Container(
            width: 64,
            height: 328,
            decoration: BoxDecoration(
              color: AppColors.appYellow,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          left: 28,
          top: 0,
          child: Container(
            width: 44,
            height: 337,
            decoration: BoxDecoration(
              color: AppColors.appYellowLight,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // Right Curtain
        Positioned(
          right: 7,
          top: 0,
          child: Container(
            width: 64,
            height: 328,
            decoration: BoxDecoration(
              color: AppColors.appYellow,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          right: 28,
          top: 0,
          child: Container(
            width: 44,
            height: 337,
            decoration: BoxDecoration(
              color: AppColors.appYellowLight,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWindowFrame() {
    return Positioned(
      left: 15,
      top: 37,
      child: Container(
        width: AppSizes.windowFrameSize,
        height: AppSizes.windowFrameSize,
        decoration: BoxDecoration(
          color: AppColors.appPurple,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.appBrown,
            width: 15,
          ),
        ),
        child: Stack(
          children: [
            // Window Cross Bars
            Positioned(
              top: 118,
              left: 0,
              right: 0,
              child: Container(
                height: 15,
                color: AppColors.appBrown,
              ),
            ),
            Positioned(
              left: 118,
              top: 0,
              bottom: 0,
              child: Container(
                width: 15,
                color: AppColors.appBrown,
              ),
            ),
            // Clouds
            Positioned(
              top: 40,
              right: 30,
              child: _buildCloud(60, 35),
            ),
            Positioned(
              bottom: 50,
              left: 30,
              child: _buildCloud(40, 25),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWindowFrameTop() {
    return Stack(
      children: [
        Positioned(
          top: 4,
          left: 7,
          right: 7,
          child: Container(
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.appBrown,
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: AppColors.appBrown,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: AppColors.appBrown,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCloud(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(width / 2),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -width * 0.15,
            top: height * 0.1,
            child: Container(
              width: width * 0.4,
              height: height * 0.6,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(width * 0.2),
              ),
            ),
          ),
          Positioned(
            right: width * 0.05,
            top: -height * 0.1,
            child: Container(
              width: width * 0.3,
              height: height * 0.5,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(width * 0.15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterImage() {
    return Positioned(
      top: 100,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: 282,
          height: 504,
          child: Image.network(
            'https://cdn.builder.io/api/v1/assets/3e98c2e405b4425fb9cb2adbdf1ba7a8/figma-screenshot-e70c86?format=webp&width=800',
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.appGray.withOpacity(0.3),
                child: const Icon(
                  Icons.person,
                  size: 100,
                  color: AppColors.appGray,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPlant() {
    return Positioned(
      bottom: 130,
      right: 30,
      child: SizedBox(
        width: AppSizes.plantWidth,
        height: AppSizes.plantHeight,
        child: Stack(
          children: [
            // Plant Pot
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: AppSizes.plantWidth,
                height: 64,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 8,
                      child: Container(
                        width: AppSizes.plantWidth,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: AppColors.appBrown,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: AppSizes.plantWidth,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.appBrownLight,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Plant Stem
            Positioned(
              bottom: 48,
              left: 38,
              child: Container(
                width: 4,
                height: 96,
                color: AppColors.appGreenDark,
              ),
            ),
            // Leaves - Various positioned leaf shapes
            ...List.generate(6, (index) => _buildLeaf(index)),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaf(int index) {
    final leafPositions = [
      {
        'bottom': 144.0,
        'left': 34.0,
        'width': 32.0,
        'height': 28.0,
        'rotation': 0.785
      },
      {
        'bottom': 128.0,
        'left': 58.0,
        'width': 20.0,
        'height': 16.0,
        'rotation': 0.0
      },
      {
        'bottom': 96.0,
        'right': 22.0,
        'width': 20.0,
        'height': 16.0,
        'rotation': 0.0
      },
      {
        'top': 0.0,
        'left': 34.0,
        'width': 32.0,
        'height': 28.0,
        'rotation': -0.21
      },
      {
        'top': 16.0,
        'left': 22.0,
        'width': 20.0,
        'height': 16.0,
        'rotation': 0.0
      },
      {
        'bottom': 160.0,
        'left': 2.0,
        'width': 40.0,
        'height': 32.0,
        'rotation': 0.0
      },
    ];

    if (index >= leafPositions.length) return const SizedBox.shrink();

    final pos = leafPositions[index];
    Widget leaf = Container(
      width: pos['width'] as double,
      height: pos['height'] as double,
      decoration: BoxDecoration(
        color: AppColors.appGreen,
        borderRadius: BorderRadius.circular((pos['width'] as double) / 2),
      ),
    );

    if (pos['rotation'] != 0.0) {
      leaf = Transform.rotate(
        angle: pos['rotation'] as double,
        child: leaf,
      );
    }

    return Positioned(
      top: pos.containsKey('top') ? pos['top'] as double : null,
      bottom: pos.containsKey('bottom') ? pos['bottom'] as double : null,
      left: pos.containsKey('left') ? pos['left'] as double : null,
      right: pos.containsKey('right') ? pos['right'] as double : null,
      child: leaf,
    );
  }

  Widget _buildSettingsPanel(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final rightPosition = screenWidth > 600 ? 30.0 : 20.0;

    return Positioned(
      top: 40,
      right: rightPosition,
      child: Container(
        width: AppSizes.settingsPanelWidth,
        height: AppSizes.settingsPanelHeight,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(26.5),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSettingsIcon(
                Icons.settings, AppColors.appBrownDark, 36, true),
            _buildSettingsIcon(Icons.mail, AppColors.appYellow, 28, false,
                AppColors.appBrownDark),
            _buildSettingsIcon(Icons.store, AppColors.appBlue, 28, false),
            _buildSettingsIcon(
                Icons.keyboard_arrow_down, AppColors.appRed, 28, false),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsIcon(
      IconData icon, Color bgColor, double size, bool isCircle,
      [Color? iconColor]) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(4),
      ),
      child: Icon(
        icon,
        color: iconColor ?? AppColors.white,
        size: size * 0.55,
      ),
    );
  }

  Widget _buildBottomSection() {
    return Stack(
      children: [
        // Background Shape
        Container(
          width: double.infinity,
          height: 147,
          color: AppColors.appBrownDarker,
        ),
        // Ground Shadow
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 217,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.appBrownDark,
                borderRadius: BorderRadius.circular(21),
              ),
            ),
          ),
        ),
        // Bottom Navigation
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.home, '', true),
                _buildNavItem(Icons.games, 'GAME', false),
                _buildNavItem(Icons.person, 'PROFILE', false),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    if (isActive) {
      return Container(
        width: AppSizes.navIconSize,
        height: AppSizes.navIconSize,
        decoration: const BoxDecoration(
          color: AppColors.appBlue,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.white,
          size: 28,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            icon,
            color: AppColors.appGray,
            size: 24,
          ),
        ),
        if (label.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(label, style: AppTextStyles.navLabelStyle),
        ],
      ],
    );
  }
}
