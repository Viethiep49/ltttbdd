import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Điểm bắt đầu của ứng dụng.
void main() {
  runApp(const MyApp());
}

// Bảng màu theo thiết kế Figma.
const Color kBackground = Color(0xFFF8FAFC);
const Color kTextDark = Color(0xFF0F172A);
const Color kTextGrey = Color(0xFF64748B);
const Color kTextLight = Color(0xFF94A3B8);
const Color kBorder = Color(0xFFE2E8F0);
const Color kLightFill = Color(0xFFF1F5F9);

// MyApp: widget gốc, cấu hình theme và màn hình chính.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackground,
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

// ProfileScreen: màn hình hồ sơ cá nhân.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 390,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24, 16, 24, 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBar(),
                  SizedBox(height: 24),
                  ProfileHeader(),
                  SizedBox(height: 24),
                  StatsCard(),
                  SizedBox(height: 24),
                  AboutMe(),
                  SizedBox(height: 24),
                  SkillsSection(),
                  SizedBox(height: 24),
                  ProjectsSection(),
                  SizedBox(height: 24),
                  ContactCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// TopBar: thanh trên cùng gồm nút Back – tiêu đề – nút Share.
class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SquareIconButton(icon: Icons.chevron_left, onTap: () {}),
        Text(
          'Profile',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: kTextDark,
          ),
        ),
        SquareIconButton(icon: Icons.share_outlined, onTap: () {}),
      ],
    );
  }
}

// SquareIconButton: nút icon vuông 42x42, bo góc 12, có viền.
class SquareIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SquareIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: kBorder),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: SizedBox(
          width: 42,
          height: 42,
          child: Icon(icon, size: 18, color: kTextDark),
        ),
      ),
    );
  }
}

// ProfileHeader: avatar + tên + chức danh + địa điểm.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Avatar(),
          const SizedBox(height: 8),
          Text(
            'Alex Rivers',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: kTextDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Lead Mobile Engineer',
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: kTextGrey,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: kLightFill,
              border: Border.all(color: kBorder),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: Color(0xFF475569),
                ),
                const SizedBox(width: 6),
                Text(
                  'Tokyo, Japan',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF475569),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Avatar: ảnh đại diện 140x140 có viền gradient và huy hiệu xác minh.
class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFB088),
                  Color(0xFFFF8080),
                  Color(0xFFFFCF71),
                ],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 124,
                  height: 124,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 104,
            top: 104,
            child: Container(
              width: 22,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFF0284C7),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/check.svg',
                  width: 12,
                  height: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// StatsCard: thẻ thống kê 3 cột, bo góc 20, có bóng đổ.
class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kLightFill),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D0F1729),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: const Row(
        children: [
          Expanded(
            child: StatItem(value: '148', label: 'Projects'),
          ),
          StatDivider(),
          Expanded(
            child: StatItem(value: '9 Yrs', label: 'Experience'),
          ),
          StatDivider(),
          Expanded(
            child: StatItem(
              value: '4.9 ★',
              label: 'Rating',
              valueColor: Color(0xFFEAB308),
            ),
          ),
        ],
      ),
    );
  }
}

// StatItem: 1 ô thống kê (số lớn ở trên, nhãn nhỏ ở dưới) – dùng lại 3 lần.
class StatItem extends StatelessWidget {
  final String value;
  final String label;
  final Color valueColor;

  const StatItem({
    super.key,
    required this.value,
    required this.label,
    this.valueColor = kTextDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: kTextLight,
          ),
        ),
      ],
    );
  }
}

// StatDivider: đường kẻ dọc 1x28 ngăn cách các cột.
class StatDivider extends StatelessWidget {
  const StatDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 28, color: kBorder);
  }
}

// SectionTitle: tiêu đề mỗi mục (About Me, Skills, Projects).
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: kTextDark,
      ),
    );
  }
}

// AboutMe: tiêu đề + đoạn giới thiệu (giới hạn 3 dòng như thiết kế).
class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('About Me'),
        const SizedBox(height: 8),
        Text(
          'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and '
          'building high-performance cross-platform applications. Focused on '
          'elegant architecture, intuitive UX, and design systems.',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            fontSize: 14,
            height: 1.5,
            color: const Color(0xFF475569),
          ),
        ),
      ],
    );
  }
}

// SkillsSection: tiêu đề + danh sách chip kỹ năng.
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Skills & Expertise'),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            SkillChip(
              svg: 'assets/icons/flutter.svg',
              label: 'Flutter',
              color: Color(0xFF0369A1),
              bg: Color(0xFFE0F2FE),
            ),
            SkillChip(
              icon: Icons.code,
              label: 'Dart',
              color: Color(0xFF15803D),
              bg: Color(0xFFDCFCE7),
            ),
            SkillChip(
              icon: Icons.layers_outlined,
              label: 'Clean Arch',
              color: Color(0xFFBE123C),
              bg: Color(0xFFFFE4E6),
            ),
            SkillChip(
              svg: 'assets/icons/uiux.svg',
              label: 'UI/UX',
              color: Color(0xFF7E22CE),
              bg: Color(0xFFF3E8FF),
            ),
            SkillChip(
              icon: Icons.local_fire_department_outlined,
              label: 'Firebase',
              color: Color(0xFFB45309),
              bg: Color(0xFFFEF3C7),
            ),
          ],
        ),
      ],
    );
  }
}

// SkillChip: 1 chip gồm icon + tên kỹ năng, nền nhạt, bo góc 14.
class SkillChip extends StatelessWidget {
  final IconData? icon;
  final String? svg;
  final String label;
  final Color color;
  final Color bg;

  const SkillChip({
    super.key,
    this.icon,
    this.svg,
    required this.label,
    required this.color,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          svg != null
              ? SvgPicture.asset(svg!, width: 14, height: 14)
              : Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ProjectsSection: tiêu đề + 2 thẻ dự án nằm cạnh nhau.
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Featured Projects'),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ProjectCard(
                image: 'assets/images/eshop.png',
                title: 'E-Shop Flutter',
                subtitle: 'Mobile App • 2026',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: ProjectCard(
                image: 'assets/images/crypto.png',
                title: 'Crypto Vault',
                subtitle: 'Finance • Clean Arch',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ProjectCard: thẻ dự án (ảnh 85px ở trên, tên + mô tả ở dưới).
class ProjectCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const ProjectCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kBorder),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F1729),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 85,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: kTextDark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: kTextGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ContactCard: thẻ liên hệ gồm 3 dòng, ngăn cách bởi Divider.
class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kBorder),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F1729),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        children: [
          ContactRow(
            icon: Icons.alternate_email,
            text: 'Contact Information',
            isHeader: true,
          ),
          Divider(height: 1, thickness: 1, color: kLightFill),
          ContactRow(icon: Icons.mail_outline, text: 'alex.rivers@email.com'),
          Divider(height: 1, thickness: 1, color: kLightFill),
          ContactRow(icon: Icons.phone_outlined, text: '+81 (90) 1234-5678'),
        ],
      ),
    );
  }
}

// ContactRow: 1 dòng liên hệ (ô icon – chữ – mũi tên), bấm được.
class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isHeader;

  const ContactRow({
    super.key,
    required this.icon,
    required this.text,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 62,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: isHeader ? kLightFill : kBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 18, color: const Color(0xFF334155)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500,
                    color: isHeader ? kTextDark : const Color(0xFF334155),
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, size: 18, color: kTextLight),
            ],
          ),
        ),
      ),
    );
  }
}
