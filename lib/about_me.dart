import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'atoms/linkedin_button.dart';
import 'atoms/download_cv.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    var about_me = '''
Hello, my name is [Your Name], and I am a dedicated M.Sc. Computer Science student at the University of Freiburg. With a passion for technology and a drive to innovate, I have gained valuable experience through my professional journey.

During my time at Siemens, I worked as a Software Developer in the Technology and Innovation department. As a full-stack developer, I had the opportunity to design and develop a global fire tracking and satellite imagery API and frontend. This project involved harnessing the power of various technologies such as Liveua Map API, NASA FIRMS API, SkyWatch API, OpenLayer map service, Geoserver, Docker, NodeJS, and ReactJS.

Additionally, I had the privilege of working at Huawei as an Android Developer Engineer in Test. In this role, I played a crucial part in building documentation and application test automation API using Python, Docker, and PostgreSQL. I also created a web application that utilized the test automation API using JavaScript, HTML, and CSS. Furthermore, I developed Android applications specifically designed to test Huawei Mobile Service.

Prior to pursuing my Master's degree, I successfully completed my Bachelor's degree in Computer Engineering with honors. This educational foundation provided me with a comprehensive understanding of computer systems and their applications.

I am a highly motivated individual with a strong commitment to excellence. Throughout my experiences, I have honed my skills in software development, full-stack development, test automation, and Android application development. I thrive in dynamic environments that foster creativity and encourage collaboration.

As I continue my academic journey, I am excited to explore new horizons and expand my knowledge in the field of computer science. I am eager to contribute my expertise, enthusiasm, and dedication to future projects and teams.

Thank you for taking the time to learn a little about me. I look forward to engaging in new opportunities and making a positive impact in the world of technology.

''';
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlurryContainer(
                  color: Color.fromARGB(119, 6, 30, 49),
                  blur: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Text(
                    'About Me',
                    style: Theme.of(context).textTheme.titleLarge,
                  ).animate().shimmer(
                      duration: const Duration(seconds: 3),
                      color: Colors.white,
                      colors: [
                        Colors.white,
                        const Color.fromARGB(119, 50, 107, 153),
                        const Color.fromARGB(255, 102, 64, 254),
                        const Color.fromARGB(255, 81, 58, 176),
                        const Color.fromARGB(255, 81, 58, 176),
                        const Color.fromARGB(255, 81, 58, 176),
                        const Color.fromARGB(255, 35, 45, 140),
                        const Color.fromARGB(255, 58, 68, 157),
                        const Color.fromARGB(255, 58, 68, 157),
                        const Color.fromARGB(255, 125, 130, 180),
                        const Color.fromARGB(255, 212, 213, 220),
                      ],
                      curve: Curves.easeInOut))
              .animate()
              .moveY(
                  begin: 30,
                  end: -10,
                  delay: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500)),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: BlurryContainer(
              color: const Color.fromARGB(119, 6, 30, 49),
              height: MediaQuery.sizeOf(context).height * 0.65,
              width: MediaQuery.sizeOf(context).width * 0.6,
              padding: const EdgeInsets.all(30),
              blur: 10,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Text(
                    '$about_me',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlurryContainer(
                    color: Color.fromARGB(119, 6, 30, 49),
                    padding: const EdgeInsets.all(20),
                    blur: 10,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: SelectableText(
                      'berkyldzgorer@gmail.com',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                const SizedBox(
                  width: 20,
                ),
                BlurryContainer(
                    color: Color.fromARGB(119, 6, 30, 49),
                    padding: const EdgeInsets.all(20),
                    blur: 10,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: SelectableText(
                      '+49 176 7980 8498',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                const SizedBox(
                  width: 20,
                ),
                LinkedInButton(),
                const SizedBox(
                  width: 20,
                ),
                CvButton(),
              ],
            )
                .animate()
                .fadeIn(
                  delay: const Duration(milliseconds: 200),
                  duration: const Duration(milliseconds: 500),
                )
                .shimmer(
                  duration: const Duration(milliseconds: 2500),
                  delay: const Duration(milliseconds: 100),
                  color: const Color.fromARGB(179, 55, 80, 135),
                  curve: Curves.ease,
                ),
          ),
        ],
      ),
    );
  }
}
