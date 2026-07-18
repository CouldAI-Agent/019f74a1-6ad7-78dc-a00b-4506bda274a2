import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('My Resume'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      const Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.blueGrey,
                              child: Icon(Icons.person, size: 60, color: Colors.white),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'JUAN DELA CRUZ',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Software Engineer',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Divider(thickness: 2),
                      const SizedBox(height: 16),
                      
                      // Contact Info
                      Wrap(
                        spacing: 24,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildContactInfo(Icons.email, 'juan.delacruz@email.com'),
                          _buildContactInfo(Icons.phone, '+63 912 345 6789'),
                          _buildContactInfo(Icons.location_on, 'Cebu City, Philippines'),
                          _buildContactInfo(Icons.link, 'linkedin.com/in/juandelacruz'),
                        ],
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Professional Summary
                      _buildSectionTitle('PROFESSIONAL SUMMARY'),
                      const Text(
                        'Highly motivated software engineer with experience in developing scalable web and mobile applications. Passionate about learning new technologies and solving complex problems to deliver high-quality digital solutions.',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Experience Section
                      _buildSectionTitle('EXPERIENCE'),
                      _buildExperienceItem(
                        title: 'Senior Flutter Developer',
                        company: 'Tech Solutions Inc.',
                        date: 'Jan 2023 - Present',
                        description: 'Developed and maintained cross-platform mobile applications using Flutter. Collaborated with the design and backend teams to deliver features on time.',
                      ),
                      const SizedBox(height: 16),
                      _buildExperienceItem(
                        title: 'Web Developer',
                        company: 'Creative Web Agency',
                        date: 'Jun 2020 - Dec 2022',
                        description: 'Created responsive websites and web applications using React, HTML, CSS, and JavaScript. Improved overall site performance by 30%.',
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Education Section
                      _buildSectionTitle('EDUCATION'),
                      _buildExperienceItem(
                        title: 'Bachelor of Science in Information Technology',
                        company: 'University of San Carlos',
                        date: '2016 - 2020',
                        description: 'Graduated Cum Laude. Active member of the programming varsity team.',
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Skills Section
                      _buildSectionTitle('SKILLS'),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildSkillChip('Flutter'),
                          _buildSkillChip('Dart'),
                          _buildSkillChip('JavaScript'),
                          _buildSkillChip('React'),
                          _buildSkillChip('Firebase'),
                          _buildSkillChip('Git'),
                          _buildSkillChip('Agile/Scrum'),
                          _buildSkillChip('UI/UX Design'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: Colors.blueGrey),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildExperienceItem({
    required String title,
    required String company,
    required String date,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          company,
          style: TextStyle(
            fontSize: 16,
            color: Colors.blueGrey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 15, height: 1.4),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blueGrey.withOpacity(0.1),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
