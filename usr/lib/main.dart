import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume - Lin Dion Aligsao',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          background: Colors.white,
          surface: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 12,
            height: 1.4,
            fontFamily: 'Arial', // Fallback to standard sans-serif
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ResumeScreen(),
      },
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 16),
                  _buildSectionTitle('SUMMARY'),
                  _buildSummary(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('PERSONAL PROFILE'),
                  _buildPersonalProfile(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('WORK EXPERIENCE'),
                  _buildWorkExperience(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('EDUCATION'),
                  _buildEducation(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('SKILLS'),
                  _buildSkills(),
                  const SizedBox(height: 24),
                  _buildSectionTitle('CHARACTER REFERENCES'),
                  const Text(
                    'Available upon request.',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    Widget textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'LIN DION ALIGSAO',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: const [
            Text('09701280369'),
            Text('|'),
            Text('aligsaolindion02@gmail.com'),
            Text('|'),
            Text('Talisayan, Misamis Oriental, Philippines'),
          ],
        ),
      ],
    );

    Widget imageContent = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey[400]!),
      ),
      child: const Icon(
        Icons.person,
        size: 64,
        color: Colors.grey,
      ),
    );

    return Column(
      children: [
        if (isMobile) ...[
          imageContent,
          const SizedBox(height: 16),
          textContent,
        ] else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: textContent),
              const SizedBox(width: 16),
              imageContent,
            ],
          ),
        const SizedBox(height: 8),
        const Divider(color: Colors.black, thickness: 2.0, height: 2.0),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const Divider(color: Colors.black, thickness: 1.5, height: 8),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildSummary() {
    return const Text(
      'A motivated, reliable, and goal-oriented fresh graduate seeking an opportunity to begin a meaningful career in a dynamic and supportive work environment. Eager to apply my strong work ethic, adaptability, and willingness to learn in a role where I can contribute to team success, develop new skills, and grow professionally. Committed to continuously expanding my knowledge and abilities to maintain and enhance the quality of service I provide.',
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildPersonalProfile() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        // On very small screens, use 1 column. Otherwise 3 columns.
        int columns = width < 450 ? 1 : 3;
        double itemWidth = width / columns;

        return Wrap(
          runSpacing: 12,
          children: [
            SizedBox(
              width: itemWidth,
              child: _buildProfileItem('Age:', '22 years old'),
            ),
            SizedBox(
              width: itemWidth,
              child: _buildProfileItem('Civil Status:', 'Single'),
            ),
            SizedBox(
              width: itemWidth,
              child: _buildProfileItem('Nationality:', 'Filipino'),
            ),
            SizedBox(
              width: itemWidth,
              child: _buildProfileItem('Date of Birth:', 'January 2, 2004'),
            ),
            SizedBox(
              width: itemWidth,
              child: _buildProfileItem('Religion:', 'Roman Catholic'),
            ),
            SizedBox(
              width: itemWidth,
              child: _buildProfileItem('Language Spoken:', 'Filipino &\nEnglish'),
            ),
            SizedBox(
              width: itemWidth,
              child: _buildProfileItem('Place of Birth:', 'Talisayan,\nMisamis Oriental'),
            ),
            SizedBox(
              width: itemWidth,
              child: _buildProfileItem('Height:', '5\'3"'),
            ),
          ],
        );
      }
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 12, height: 1.4),
                children: [
                  TextSpan(text: '$label ', style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkExperience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('OFFICE INTERN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 2),
        RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 12),
            children: [
              TextSpan(text: 'Municipality of Balingoan ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '| ', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: 'Balingoan, Misamis Oriental', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const Text(
          'January 2026 – May 2026',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 8),
        _buildBulletText('Prepared transmittal documents for Abstract of Inspection Reports (AIR) and encoded Purchase Request (PR) forms from vouchers, ensuring accurate and complete procurement records.'),
        _buildBulletText('Managed the requesting and issuance of office supplies, furniture, ICT equipment, tools, and property assigned to various departments.'),
        _buildBulletText('Assisted in general administrative tasks including filing, document organization, and office record management.'),
      ],
    );
  }

  Widget _buildEducation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 2.0, right: 8.0),
              child: Text('•', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'BACHELOR OF SCIENCE IN BUSINESS ADMINISTRATION MAJOR IN FINANCIAL MANAGEMENT',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      children: [
                        TextSpan(text: 'Bukidnon State University  ', style: TextStyle(fontStyle: FontStyle.italic)),
                        TextSpan(text: '|  '),
                        TextSpan(text: 'Expected: July 2026', style: TextStyle(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSkills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSkillBullet('Microsoft Office (Word & Excel)', 'Document creation, data entry, and spreadsheet management'),
        _buildSkillBullet('QuickBooks', 'Basic accounting and financial record management'),
        _buildSkillBullet('Office Administration', 'Filing, procurement processing, transmittal preparation, and supply management'),
        _buildSkillBullet('Data Entry & Records Management', 'Accurate encoding of purchase requests and inspection reports'),
        _buildSkillBullet('Communication & Teamwork', 'Effective collaboration in a government office environment'),
      ],
    );
  }

  Widget _buildSkillBullet(String skill, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text('•', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 12, height: 1.4),
                children: [
                  TextSpan(text: skill, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: ' – '),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
