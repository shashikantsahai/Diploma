import 'package:flutter/material.dart';

void main() => runApp(const MentorApp());

class MentorApp extends StatelessWidget {
  const MentorApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Diploma AI Mentor',
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF4F46E5),
      scaffoldBackgroundColor: const Color(0xFFF7F8FC),
    ),
    home: const Shell(),
  );
}

class Shell extends StatefulWidget {
  const Shell({super.key});
  @override State<Shell> createState() => _ShellState();
}
class _ShellState extends State<Shell> {
  int tab = 0;
  final pages = const [Home(), Daily10(), Mentor(), Progress(), Skills()];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: pages[tab]),
    bottomNavigationBar: NavigationBar(
      selectedIndex: tab,
      onDestinationSelected: (i) => setState(() => tab = i),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.bolt_outlined), selectedIcon: Icon(Icons.bolt), label: 'Daily 10'),
        NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), selectedIcon: Icon(Icons.auto_awesome), label: 'Mentor'),
        NavigationDestination(icon: Icon(Icons.insights_outlined), selectedIcon: Icon(Icons.insights), label: 'Progress'),
        NavigationDestination(icon: Icon(Icons.route_outlined), selectedIcon: Icon(Icons.route), label: 'Skills'),
      ],
    ),
  );
}

class CardBox extends StatelessWidget {
  final Widget child;
  const CardBox({super.key, required this.child});
  @override Widget build(BuildContext context) => Card(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    child: Padding(padding: const EdgeInsets.all(16), child: child),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      const Row(children: [
        CircleAvatar(child: Icon(Icons.person_outline)),
        SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Good evening 👋'),
          Text('Student', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
          Text('Diploma CSE • Semester 3'),
        ])),
        Icon(Icons.notifications_none),
      ]),
      const SizedBox(height: 18),
      CardBox(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Continue where you left off', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        const Text('DBMS • Normalization • 7/10 completed yesterday'),
        const SizedBox(height: 12),
        const LinearProgressIndicator(value: .70, minHeight: 8),
        const SizedBox(height: 12),
        FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.play_arrow), label: const Text('Continue learning')),
      ])),
      const SizedBox(height: 12),
      Row(children: const [
        Expanded(child: CardBox(child: Column(children: [Text('🔥', style: TextStyle(fontSize: 22)), Text('7', style: TextStyle(fontWeight: FontWeight.w800)), Text('streak')]))),
        SizedBox(width: 8),
        Expanded(child: CardBox(child: Column(children: [Text('⭐', style: TextStyle(fontSize: 22)), Text('420', style: TextStyle(fontWeight: FontWeight.w800)), Text('XP')]))),
        SizedBox(width: 8),
        Expanded(child: CardBox(child: Column(children: [Text('🎯', style: TextStyle(fontSize: 22)), Text('74%', style: TextStyle(fontWeight: FontWeight.w800)), Text('mastery')]))),
      ]),
      const SizedBox(height: 14),
      const Text('Today at a glance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
      const SizedBox(height: 8),
      CardBox(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text('🎯 Daily 10', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        SizedBox(height: 5), Text('4/10 completed • personalized from your history'),
        SizedBox(height: 10), LinearProgressIndicator(value: .4, minHeight: 8),
      ])),
      const SizedBox(height: 10),
      const CardBox(child: ListTile(contentPadding: EdgeInsets.zero, leading: CircleAvatar(child: Icon(Icons.warning_amber)), title: Text('Weakness detected'), subtitle: Text('Data Structures • Linked List • 48% mastery'))),
      const SizedBox(height: 10),
      const CardBox(child: ListTile(contentPadding: EdgeInsets.zero, leading: CircleAvatar(child: Icon(Icons.route)), title: Text('Next skill'), subtitle: Text('Arrays → Linked Lists → Problem Solving'))),
      const SizedBox(height: 14),
      const Text('Your improvement', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
      const SizedBox(height: 8),
      const CardBox(child: Column(children: [
        ListTile(contentPadding: EdgeInsets.zero, title: Text('Today'), trailing: Text('+2%', style: TextStyle(fontWeight: FontWeight.w800)), subtitle: Text('12 questions • 83% accuracy')),
        Divider(),
        ListTile(contentPadding: EdgeInsets.zero, title: Text('This week'), trailing: Text('+8%', style: TextStyle(fontWeight: FontWeight.w800)), subtitle: Text('68 questions • Python +8%')),
        Divider(),
        ListTile(contentPadding: EdgeInsets.zero, title: Text('This month'), trailing: Text('+13%', style: TextStyle(fontWeight: FontWeight.w800)), subtitle: Text('284 questions • 21 topics')),
      ])),
    ],
  );
}

const sampleQuestions = [
  ['Python • Loops', 'Which keyword skips the current loop iteration?', 'continue', ['break','continue','pass','return']],
  ['DBMS • Normalization', 'Which normal form removes partial dependency?', '2NF', ['1NF','2NF','3NF','BCNF']],
  ['Data Structures • Stack', 'A stack follows which principle?', 'LIFO', ['FIFO','LIFO','Random','Priority']],
  ['Networks • OSI', 'How many layers are in the OSI model?', '7', ['5','6','7','8']],
];

class Daily10 extends StatefulWidget {
  const Daily10({super.key});
  @override State<Daily10> createState() => _Daily10State();
}
class _Daily10State extends State<Daily10> {
  int i = 0, score = 0;
  String? selected;
  bool checked = false;
  @override Widget build(BuildContext context) {
    final q = sampleQuestions[i];
    return ListView(padding: const EdgeInsets.all(16), children: [
      Text('Daily 10', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
      Text('${i+1} / 10 • ${q[0]}'),
      const SizedBox(height: 10),
      LinearProgressIndicator(value: (i+1)/10, minHeight: 8),
      const SizedBox(height: 20),
      CardBox(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(q[1] as String, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
        const SizedBox(height: 12),
        ...(q[3] as List<String>).map((o) => RadioListTile<String>(
          value: o, groupValue: selected,
          onChanged: checked ? null : (v) => setState(() => selected = v),
          title: Text(o),
        )),
        FilledButton(onPressed: selected == null || checked ? null : () {
          setState(() { checked = true; if (selected == q[2]) score++; });
        }, child: const Text('Check answer')),
        if (checked) ...[
          const SizedBox(height: 10),
          Text(selected == q[2] ? '✅ Correct!' : '❌ Correct answer: ${q[2]}'),
          const SizedBox(height: 8),
          OutlinedButton.icon(onPressed: () => showModalBottomSheet(context: context, builder: (_) => const Padding(
            padding: EdgeInsets.all(20), child: Text('The production LLM will explain this exact concept using the student’s level, syllabus context and previous mistakes.', style: TextStyle(fontSize: 16)),
          )), icon: const Icon(Icons.psychology), label: const Text('I want a better explanation')),
          FilledButton.tonal(onPressed: () {
            setState(() { i = (i + 1) % sampleQuestions.length; selected = null; checked = false; });
          }, child: const Text('Next')),
        ],
      ])),
    ]);
  }
}

class Mentor extends StatefulWidget {
  const Mentor({super.key});
  @override State<Mentor> createState() => _MentorState();
}
class _MentorState extends State<Mentor> {
  final c = TextEditingController();
  String answer = 'Ask about a topic, mistake, code, or what you should practice next.';
  @override Widget build(BuildContext context) => Column(children: [
    Padding(padding: const EdgeInsets.all(16), child: Align(alignment: Alignment.centerLeft, child: Text('My AI Mentor', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)))),
    Expanded(child: ListView(padding: const EdgeInsets.symmetric(horizontal: 16), children: [
      CardBox(child: Text(answer)),
      const SizedBox(height: 10),
      const CardBox(child: Text('🎯 Today’s focus: Linked List. Recent accuracy is 48%.')),
    ])),
    SafeArea(top: false, child: Padding(padding: const EdgeInsets.all(12), child: Row(children: [
      Expanded(child: TextField(controller: c, maxLines: 2, decoration: const InputDecoration(hintText: 'Ask, explain, debug, or plan…', border: OutlineInputBorder()))),
      const SizedBox(width: 8),
      IconButton.filled(onPressed: () => setState(() { answer = 'Demo response: the production AI will use your personal learning history and syllabus context.'; c.clear(); }), icon: const Icon(Icons.send)),
    ]))),
  ]);
}

class Progress extends StatelessWidget {
  const Progress({super.key});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(16), children: [
    Text('My Progress', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
    const SizedBox(height: 5),
    const Text('Compare yourself with your previous performance.'),
    const SizedBox(height: 16),
    const CardBox(child: Column(children: [
      ListTile(title: Text('Today'), subtitle: Text('12 questions'), trailing: Text('+2%')),
      Divider(), ListTile(title: Text('This week'), subtitle: Text('68 questions'), trailing: Text('+8%')),
      Divider(), ListTile(title: Text('This month'), subtitle: Text('284 questions'), trailing: Text('+13%')),
    ])),
    const SizedBox(height: 14),
    const Text('Skill mastery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
    const SizedBox(height: 8),
    ...const [('Python',.82),('DBMS',.76),('Problem Solving',.63),('Data Structures',.48),('Mathematics',.44)].map((x) => Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [Expanded(child: Text(x.$1)), Text('${(x.$2*100).round()}%')]),
        const SizedBox(height: 5), LinearProgressIndicator(value: x.$2, minHeight: 8),
      ]),
    )),
  ]);
}

class Skills extends StatelessWidget {
  const Skills({super.key});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(16), children: [
    Text('My Skill Path', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
    const SizedBox(height: 5),
    const Text('Build practical skills step by step—not just exam marks.'),
    const SizedBox(height: 15),
    const CardBox(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('🚀 Recommended next', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
      SizedBox(height: 6), Text('Arrays → Linked Lists → Problem Solving'),
      SizedBox(height: 6), Text('Why: your Python fundamentals are strong enough for the next step.'),
    ])),
    const SizedBox(height: 10),
    ...const [
      ('1','Programming Fundamentals','Mastered • 82%'),
      ('2','Python','Strong • 82%'),
      ('3','Arrays & Linked Lists','Next • 48%'),
      ('4','Problem Solving','Upcoming'),
      ('5','Git & GitHub','Upcoming'),
      ('6','Build a Project','Goal'),
    ].map((x) => Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: CardBox(child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(child: Text(x.$1)),
        title: Text(x.$2, style: TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(x.$3),
        trailing: Icon(Icons.chevron_right),
      )),
    )),
  ]);
}
