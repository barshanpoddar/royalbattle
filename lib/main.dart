import 'package:flutter/material.dart';
import 'screens/champions_screen.dart';
import 'screens/profile_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Royal Battle',
      theme: AppTheme.darkTheme,
      home: HomePage(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header (Logo + Notifications + Support)
          Container(
            height: 60,
            color: AppTheme.headerGrey,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Royal Battle Logo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                Row(
                  children: [
                    IconButton(icon: Icon(Icons.notifications, color: AppTheme.textPrimary), onPressed: () {}),
                    IconButton(icon: Icon(Icons.support, color: AppTheme.textPrimary), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
          // 2. User Royal Summary Card
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [Text('Wins'), Text('150')]),
                  Column(children: [Text('Points'), Text('5000')]),
                  Column(children: [Text('Rank'), Text('Gold')]),
                ],
              ),
            ),
          ),
          // 3. Banner Slider (Hero Ads)
          SizedBox(
            width: double.infinity,
            height: 200,
            child: PageView(
              children: [
                Container(color: Colors.blue, child: Center(child: Text('Ad 1'))),
                Container(color: Colors.green, child: Center(child: Text('Ad 2'))),
                Container(color: Colors.red, child: Center(child: Text('Ad 3'))),
              ],
            ),
          ),
          // 4. Quick Join Matches
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Quick Join Matches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Solo')),
              ElevatedButton(onPressed: () {}, child: Text('Duo')),
              ElevatedButton(onPressed: () {}, child: Text('Squad')),
            ],
          ),
          // 5. Featured Tournaments (Horizontal)
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Featured Tournaments', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.only(right: 16),
                child: SizedBox(width: 120, child: Center(child: Text('Tournament ${index + 1}'))),
              ),
            ),
          ),
          // 6. Live Matches Section
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Live Matches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Column(
            children: List.generate(3, (index) => ListTile(title: Text('Live Match ${index + 1}'))),
          ),
          // 7. Recommended For You
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Recommended For You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 4,
            itemBuilder: (context, index) => Card(
              margin: EdgeInsets.all(8),
              child: Center(child: Text('Recommended ${index + 1}')),
            ),
          ),
          // 8. Achievements / Rewards (3 Cards)
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Achievements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) => Card(
              child: SizedBox(width: 80, height: 80, child: Center(child: Text('Achievement ${index + 1}'))),
            )),
          ),
          // 9. Today's Winners Showcase
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Today's Winners", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Column(
            children: List.generate(5, (index) => ListTile(title: Text('Winner ${index + 1}'))),
          ),
          // 10. Rules & Fairplay Panel
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text('Rules & Fairplay', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                ],
              ),
            ),
          ),
          // 11. Footer CTA Button
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                child: Text('Join Now'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TournamentScreen extends StatefulWidget {
  const TournamentScreen({super.key});

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  List<Map<String, dynamic>> categories = [
    {
      'name': 'Solo Battle',
      'icon': Icons.person,
      'feeMin': 50, 'feeMax': 100,
      'prizeMin': 1000, 'prizeMax': 5000,
      'fee': 'Rs. 50-100',
      'prize': 'Rs. 1000-5000',
      'matches': 25,
      'rank': 'Bronze',
    },
    {
      'name': 'Duo Clash',
      'icon': Icons.people,
      'feeMin': 100, 'feeMax': 200,
      'prizeMin': 2000, 'prizeMax': 10000,
      'fee': 'Rs. 100-200',
      'prize': 'Rs. 2000-10000',
      'matches': 15,
      'rank': 'Silver',
    },
    {
      'name': 'Squad War',
      'icon': Icons.group,
      'feeMin': 200, 'feeMax': 500,
      'prizeMin': 5000, 'prizeMax': 25000,
      'fee': 'Rs. 200-500',
      'prize': 'Rs. 5000-25000',
      'matches': 10,
      'rank': 'Gold',
    },
    {
      'name': 'Custom Room Matches',
      'icon': Icons.room,
      'feeMin': 10, 'feeMax': 50,
      'prizeMin': 200, 'prizeMax': 1000,
      'fee': 'Rs. 10-50',
      'prize': 'Rs. 200-1000',
      'matches': 50,
      'rank': 'Any',
    },
  ];

  void sortByPrizeHighToLow() {
    setState(() {
      categories.sort((a, b) => b['prizeMax'].compareTo(a['prizeMax']));
    });
  }

  void sortByEntryFeeLowToHigh() {
    setState(() {
      categories.sort((a, b) => a['feeMin'].compareTo(b['feeMin']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tournament Categories', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: sortByPrizeHighToLow, child: Text('Prize (High → Low)')),
              ElevatedButton(onPressed: sortByEntryFeeLowToHigh, child: Text('Entry Fee (Low → High)')),
            ],
          ),
          Text('Slots Available, Rank Requirement shown on cards.', style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(height: 16),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              var cat = categories[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.amber, width: 2),
                ),
                color: Colors.grey[900],
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(cat['icon'], size: 40, color: Colors.white),
                      SizedBox(height: 8),
                      Text(cat['name'], style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Entry: ${cat['fee']}', style: TextStyle(color: Colors.grey[300], fontSize: 12)),
                      Text('Prize: ${cat['prize']}', style: TextStyle(color: Colors.grey[300], fontSize: 12)),
                      Text('Slots: ${cat['matches']}', style: TextStyle(color: Colors.grey[300], fontSize: 12)),
                      Text('Rank: ${cat['rank']}', style: TextStyle(color: Colors.grey[300], fontSize: 12)),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TournamentListScreen(category: cat),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(minimumSize: Size(80, 30)),
                        child: Text('View Matches'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TournamentListScreen extends StatefulWidget {
  final Map<String, dynamic> category;

  const TournamentListScreen({super.key, required this.category});

  @override
  State<TournamentListScreen> createState() => _TournamentListScreenState();
}

class _TournamentListScreenState extends State<TournamentListScreen> {
  String selectedMode = 'BR';
  String selectedMap = 'Bermuda';
  RangeValues entryFeeRange = RangeValues(0, 500);
  RangeValues prizeRange = RangeValues(0, 50000);
  String selectedTime = 'Upcoming';

  List<Map<String, dynamic>> tournaments = [
    {
      'title': 'Empire Solo Match',
      'status': 'LIVE',
      'vipOnly': false,
      'entryFee': 'Rs. 100',
      'prize': 'Rs. 5000',
      'slots': '35/48',
      'timer': '02:30:45',
      'roomType': 'TPP',
      'mode': 'BR',
      'map': 'Bermuda',
      'rankReq': 'Bronze',
      'organizer':'Royal Admin',
    },
    {
      'title': 'Duo Clash Championship',
      'status': 'UPCOMING',
      'vipOnly': true,
      'entryFee': 'Rs. 200',
      'prize': 'Rs. 10000',
      'slots': '25/30',
      'timer': 'Starts in 1h',
      'roomType': 'FPP',
      'mode': 'CS',
      'map': 'Alpine',
      'rankReq': 'Silver',
      'organizer':'Royal Admin',
    },
    {
      'title': 'Squad War Special',
      'status': 'FULL',
      'vipOnly': false,
      'entryFee': 'Rs. 50',
      'prize': 'Rs. 2000',
      'slots': '48/48',
      'timer': 'Ended',
      'roomType': 'TPP',
      'mode': 'BR',
      'map': 'Bermuda',
      'rankReq': 'Gold',
      'organizer':'Royal Admin',
    },
  ];

  void showFilter() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: EdgeInsets.all(16),
              height: 400,
              child: Column(
                children: [
                  Text('Filters', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  DropdownButton<String>(
                    value: selectedMode,
                    items: ['BR', 'CS'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setModalState(() {
                        selectedMode = value!;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: selectedMap,
                    items: ['Bermuda', 'Purgatory', 'Alpine'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setModalState(() {
                        selectedMap = value!;
                      });
                    },
                  ),
                  RangeSlider(
                    values: entryFeeRange,
                    min: 0,
                    max: 500,
                    divisions: 50,
                    labels: RangeLabels(
                      entryFeeRange.start.round().toString(),
                      entryFeeRange.end.round().toString(),
                    ),
                    onChanged: (values) {
                      setModalState(() {
                        entryFeeRange = values;
                      });
                    },
                  ),
                  RangeSlider(
                    values: prizeRange,
                    min: 0,
                    max: 50000,
                    divisions: 100,
                    labels: RangeLabels(
                      prizeRange.start.round().toString(),
                      prizeRange.end.round().toString(),
                    ),
                    onChanged: (values) {
                      setModalState(() {
                        prizeRange = values;
                      });
                    },
                  ),
                  Column(
                    children: ['Upcoming', 'Live Now', 'Starting Soon'].map((String option) {
                      return RadioListTile<String>(
                        title: Text(option),
                        value: option,
                        groupValue: selectedTime,
                        onChanged: (value) {
                          setModalState(() {
                            selectedTime = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Apply filters here
                      setState(() {});
                    },
                    child: Text('Apply Filters'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Icon(widget.category['icon']),
            SizedBox(width: 8),
            Text(widget.category['name']),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.filter_list), onPressed: showFilter),
        ],
      ),
      body: ListView.builder(
        itemCount: tournaments.length,
        itemBuilder: (context, index) {
          var tour = tournaments[index];
          bool isLive = tour['status'] == 'LIVE';
          bool isFull = tour['status'] == 'FULL';
          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    color: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(tour['title'], style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: [
                      if (isLive) Container(color: Colors.red, padding: EdgeInsets.all(4), child: Text('📍 LIVE', style: TextStyle(color: Colors.white)))
                      else if (tour['status'] == 'UPCOMING') Container(color: Colors.blue, padding: EdgeInsets.all(4), child: Text('📅 UPCOMING', style: TextStyle(color: Colors.white)))
                      else Container(color: Colors.grey, padding: EdgeInsets.all(4), child: Text('👥 FULL', style: TextStyle(color: Colors.white))),
                      if (tour['vipOnly']) SizedBox(width: 8),
                      if (tour['vipOnly']) Container(color: Colors.purple, padding: EdgeInsets.all(4), child: Text('👑 VIP', style: TextStyle(color: Colors.white))),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Info Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Entry: ${tour['entryFee']}', style: TextStyle(fontSize: 14)),
                      Text('Prize: ${tour['prize']}', style: TextStyle(fontSize: 14)),
                      Text('Slots: ${tour['slots']}', style: TextStyle(fontSize: 14)),
                      Text('⏳ ${tour['timer']}', style: TextStyle(fontSize: 14)),
                      Text('${tour['roomType']}', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Icon Row
                  Row(
                    children: [
                      Icon(Icons.gamepad), Text(' ${tour['mode']}'),
                      SizedBox(width: 16),
                      Icon(Icons.map), Text(' ${tour['map']}'),
                      SizedBox(width: 16),
                      Icon(Icons.star), Text(' ${tour['rankReq']}'),
                      SizedBox(width: 16),
                      Icon(Icons.verified), Text(' ${tour['organizer']}'),
                    ],
                  ),
                  SizedBox(height: 8),
                  // CTA
                  Row(
                    children: [
                      if (!isFull)
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TournamentDetailsScreen(tournament: tour),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                            child: Text('Join Now'),
                          ),
                        )
                      else
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TournamentDetailsScreen(tournament: tour),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                            child: Text('View Details'),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TournamentDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> tournament;

  const TournamentDetailsScreen({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    // Mock data
    Map<String, dynamic> details = {
      'banner': Container(color: Colors.blue, height: 200, child: Center(child: Text('Banner Image'))),
      'organizer': 'Empire Mods',
      'verified': true,
      'rules': 'Room Rules\n...\nCompetitive Rules\n...\nDevice Rules\n...\nCheating Penalty\n...\nKick/Ban Policy\nScreenshot Required: YES',
      'totalSlots': 48,
      'joined': 36,
      'startTime': '08:30 PM',
      'joinedUsers': ['Team 1', 'Team 2', 'Team 3'],
      'roomID': 'Hidden',
      'pass': 'Hidden',
      'prizeBreakdown': [
        {'pos': '🥇 1st', 'prize': 'Rs. 2000'},
        {'pos': '🥈 2nd', 'prize': 'Rs. 1500'},
        {'pos': '🔥 Kill', 'prize': 'Rs. 50 per'},
        {'pos': 'Special Bonus', 'prize': 'Rs. 500'},
      ],
      'guide': ['Join Tournament', 'Wait for room ID & pass', 'Enter room', 'Play match', 'Upload result', 'Get prize instantly'],
      'userJoined': false, // Mock
      'isFull': tournament['status'] == 'FULL',
      'isLive': tournament['status'] == 'LIVE',
      'wallet': 'Rs. 500',
    };

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: details['banner'],
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(icon: Icon(Icons.share), onPressed: () {}),
              IconButton(icon: Icon(Icons.bookmark), onPressed: () {}),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tournament['title'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Organized by: ${details['organizer']}', style: TextStyle(fontSize: 16)),
                    if (details['verified']) Icon(Icons.verified, color: Colors.blue),

                    SizedBox(height: 16),
                    Text('Match Stats'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(color: Colors.amber[50], child: Padding(padding: EdgeInsets.all(8), child: Column(children: [Text('Entry'), Text(tournament['entryFee'])]))),
                        Card(color: Colors.amber[50], child: Padding(padding: EdgeInsets.all(8), child: Column(children: [Text('Prize Pool'), Text(tournament['prize'])]))),
                        Card(color: Colors.amber[50], child: Padding(padding: EdgeInsets.all(8), child: Column(children: [Text('Mode'), Text(tournament['mode'])]))),
                        Card(color: Colors.amber[50], child: Padding(padding: EdgeInsets.all(8), child: Column(children: [Text('Map'), Text(tournament['map'])]))),
                      ],
                    ),

                    SizedBox(height: 16),
                    ExpansionPanelList(
                      elevation: 1,
                      expandedHeaderPadding: EdgeInsets.all(0),
                      children: [
                        ExpansionPanel(
                          headerBuilder: (context, isExpanded) => ListTile(title: Text('Match Rules')),
                          body: Padding(padding: EdgeInsets.all(16), child: Text(details['rules'])),
                          isExpanded: false, // Need state for expandable
                        ),
                      ],
                    ),

                    SizedBox(height: 16),
                    Text('Slots & Time'),
                    Text('Total Slots: ${details['totalSlots']}'),
                    Text('Joined: ${details['joined']}'),
                    LinearProgressIndicator(value: details['joined'] / details['totalSlots']),
                    Text('Match Start Time: ${details['startTime']}'),

                    SizedBox(height: 16),
                    Text('Room ID & Pass'),
                    Text('Will be visible after countdown ends'),
                    ElevatedButton(onPressed: () {}, child: Text('Copy Room ID')),

                    SizedBox(height: 16),
                    Text('Joined Users'),
                    Column(
                      children: details['joinedUsers'].map<Widget>((user) => ListTile(title: Text(user))).toList(),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Create Team + Invite')),

                    SizedBox(height: 16),
                    Text('Prize Breakdown'),
                    Table(
                      border: TableBorder.all(),
                      children: details['prizeBreakdown'].map<TableRow>((p) => TableRow(children: [Text(p['pos']), Text(p['prize'])])).toList(),
                    ),

                    SizedBox(height: 16),
                    Text('How to Play'),
                    ...details['guide'].map<Widget>((step) => ListTile(leading: CircleAvatar(child: Text((details['guide'].indexOf(step) + 1).toString())), title: Text(step))),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!details['userJoined'] && !details['isFull'])
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                child: Text('Join Now'),
              )
            else if (details['userJoined'])
              Container(color: Colors.green, padding: EdgeInsets.all(8), child: Text('Joined Successfully'))
            else if (details['isFull'])
              Container(color: Colors.grey, padding: EdgeInsets.all(8), child: Text('Slots Full'))
            else if (details['isLive'])
              ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: Text('Spectate Soon')),
            Row(
              children: [
                Text('Wallet: ${details['wallet']}'),
                Spacer(),
                ElevatedButton(onPressed: () {}, child: Text('Add Money')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Wallet', style: TextStyle(color: Colors.amber, fontSize: 24)),
        actions: [
          IconButton(
            icon: Icon(Icons.history, color: Colors.amber), // Use receipt for history as 🚾 is not icon
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Color(0xFFF9C623), width: 2),
              ),
              color: Color(0xFF001122), // Dark Navy
              shadowColor: Color(0xFFF9C623).withAlpha(100), // Soft gold glow
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('💰 Available Balance', style: TextStyle(color: Colors.white, fontSize: 18)),
                            Text('₹ 1,250.00', style: TextStyle(color: Colors.amber, fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('👑 VIP Royal Coins', style: TextStyle(color: Colors.white, fontSize: 18)),
                                SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [BoxShadow(color: Colors.amber.withAlpha(100), blurRadius: 10)],
                                  ),
                                  child: Text('VIP', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            Text('₹ 350', style: TextStyle(color: Colors.amber, fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Transaction History 🧾'),
                      subtitle: Text('View all transactions'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8),
                    color: Colors.amber[50],
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bonus / Referral Coins 🎁', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('Referral Code: ROYAL123'),
                          ElevatedButton(onPressed: () {}, child: Text('Invite')),
                          Text('Bonus Earned: ₹150'),
                          Text('Bonus Withdrawal Rules: Min ₹500'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8),
                    color: Colors.purple[50],
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star),
                              SizedBox(width: 8),
                              Text('VIP Balance 👑', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text('VIP Level: Silver'),
                          Text('VIP Benefits: Extra Coins, Priority Support'),
                          Text('VIP Bonus Per Tournament: ₹50'),
                          ElevatedButton(onPressed: () {}, child: Text('Upgrade')),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8),
                    color: Colors.blue[50],
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.send),
                          Text('Withdraw Status 📤', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('Cashout ID: WB12345'),
                          Text('Method: UPI'),
                          Text('Amount: ₹500'),
                          Text('Approval status: Pending', style: TextStyle(color: Colors.amber[800])),
                          Text('Expected time: 2-3 hours'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(8),
                    color: Colors.green[50],
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.verified_user),
                          Text('Auto Verification System 🛡️', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('UPI ID: Verified'),
                          Text('Bank Account: Verified'),
                          Text('Identity Match Score: 98%'),
                          Text('Auto fraud detection: Enabled'),
                          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.amber), child: Text('Verify Now')),
                        ],
                      )

                      ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9), // Half of 18px for padding
                    child: ElevatedButton.icon(
                      icon: Text('➕', style: TextStyle(fontSize: 20)),
                      label: Text('Add Money'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF9C623), // Empire Gold
                        padding: EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    child: OutlinedButton.icon(
                      icon: Text('⬅', style: TextStyle(fontSize: 20)),
                      label: Text('Withdraw'),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFFF9C623), width: 2), // Gold Border
                        backgroundColor: Color(0xFF001122), // Navy
                        padding: EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Leaderboard', style: TextStyle(color: Colors.amber, fontSize: 24)),
        actions: [
          IconButton(
            icon: Icon(Icons.emoji_events, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChampionsScreen()),
              );
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Container(
              height: 180,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF001122), // Dark Navy
                gradient: LinearGradient(
                  colors: [Color(0xFF001122), Color(0xFF003344)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(color: Color.fromRGBO(249, 198, 35, 0.5), width: 2), // Soft gold stroke
                boxShadow: [
                  BoxShadow(color: Color.fromRGBO(249, 198, 35, 0.3), blurRadius: 10, spreadRadius: 1), // Gold glow
                  BoxShadow(color: Color.fromRGBO(249, 198, 35, 0.2), blurRadius: 20, spreadRadius: 2), // Additional glow for effect
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'RoyalBattle Empire Rank Board',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '👑',
                    style: TextStyle(fontSize: 40),
                  ), // Golden Crown Icon
                  SizedBox(height: 8),
                  Text(
                    '"Top Warriors of the Empire"',
                    style: TextStyle(color: Colors.grey[300], fontSize: 14, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TabBar(
                labelColor: Color(0xFFF9C623),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xFFF9C623),
                indicatorWeight: 3,
                labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.grey, shadows: [Shadow(color: Color.fromRGBO(249, 198, 35, 0.5), blurRadius: 5)]),
                tabs: [
                  Tab(text: 'Daily'),
                  Tab(text: 'Monthly'),
                  Tab(text: 'Kill Ranking'),
                  Tab(text: 'Season'),
                  Tab(text: 'Champions'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFF9C623), width: 2),
                  boxShadow: [BoxShadow(color: Color.fromRGBO(249, 198, 35, 0.3), blurRadius: 10)],
                ),
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: TabBarView(
                  children: [
                    buildRankingList(),
                    buildRankingList(),
                    buildKillRankingList(),
                    buildSeasonProgressDashboard(),
                    buildRankingList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRankingList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        int rank = index + 1;
        Color rankColor;
        Color cardColor;
        List<BoxShadow>? cardShadow;
        if (rank == 1) {
          rankColor = Color(0xFFF9C623); // Gold
          cardColor = Color.fromRGBO(249, 198, 35, 0.1);
          cardShadow = [BoxShadow(color: Color.fromRGBO(249, 198, 35, 0.5), blurRadius: 10, spreadRadius: 2)];
        } else if (rank == 2) {
          rankColor = Colors.white; // Silver
          cardColor = Color.fromRGBO(255, 255, 255, 0.1);
          cardShadow = [BoxShadow(color: Color.fromRGBO(255, 255, 255, 0.3), blurRadius: 8, spreadRadius: 1)];
        } else if (rank == 3) {
          rankColor = Color(0xFFCD7F32); // Bronze
          cardColor = Color.fromRGBO(205, 127, 50, 0.1);
          cardShadow = [BoxShadow(color: Color.fromRGBO(205, 127, 50, 0.4), blurRadius: 8, spreadRadius: 1)];
        } else {
          rankColor = Colors.grey;
          cardColor = Color(0xFF001122);
          cardShadow = null;
        }

        String badge = '';
        if (rank <= 3) {
          badge = ['Emperor', 'King', 'Hero'][rank - 1];
        } else if (rank <= 10) badge = 'Warrior';

        return Card(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          color: cardColor,
          shadowColor: rank == 1 ? Color(0xFFF9C623) : rank == 2 ? Colors.white : rank == 3 ? Color(0xFFCD7F32) : Colors.black,
          elevation: cardShadow != null ? 5 : 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: rank <= 3 ? Colors.transparent : Colors.grey.shade700, width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                // Left: Rank Number
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      color: Color.fromRGBO((rankColor.r * 255).round().clamp(0, 255), (rankColor.g * 255).round().clamp(0, 255), (rankColor.b * 255).round().clamp(0, 255), 0.2),
                    border: Border.all(color: rankColor, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      '#$rank',
                      style: TextStyle(color: rankColor, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                // Middle: Player Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Player $rank',
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          if (badge.isNotEmpty && ['Emperor', 'King', 'Hero'].contains(badge))
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: badge == 'Hero' ? Colors.blue.shade700 : badge == 'King' ? Color(0xFFF9C623).withValues(alpha: 0.2) : Colors.purple.shade700,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: badge == 'Hero' ? Colors.grey.shade400 : badge == 'King' ? Color(0xFFF9C623) : Color(0xFFF9C623),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    badge == 'Hero' ? '🛡️' : badge == 'King' ? '👑' : '🔱',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    badge,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      Text(
                        'UID: 12345$rank',
                        style: TextStyle(color: Colors.grey[400], fontSize: 12),
                      ),
                      if (rank % 2 == 0) // Simulate squad mode
                        Text(
                          'Team: Royal$rank',
                          style: TextStyle(color: Colors.grey[300], fontSize: 12),
                        ),
                    ],
                  ),
                ),
                // Right: Points
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${10000 - (index * 500)} Points',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildKillRankingList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        int rank = index + 1;
        Color rankColor;
        Color cardColor;
        List<BoxShadow>? cardShadow;
        if (rank == 1) {
          rankColor = Color(0xFFF9C623); // Gold
          cardColor = Color(0xFFF9C623).withValues(alpha: 0.1);
          cardShadow = [BoxShadow(color: Color(0xFFF9C623).withValues(alpha: 0.5), blurRadius: 10, spreadRadius: 2)];
        } else if (rank == 2) {
          rankColor = Colors.white; // Silver
          cardColor = Colors.white.withValues(alpha: 0.1);
          cardShadow = [BoxShadow(color: Colors.white.withValues(alpha: 0.3), blurRadius: 8, spreadRadius: 1)];
        } else if (rank == 3) {
          rankColor = Color(0xFFCD7F32); // Bronze
          cardColor = Color(0xFFCD7F32).withValues(alpha: 0.1);
          cardShadow = [BoxShadow(color: Color(0xFFCD7F32).withValues(alpha: 0.4), blurRadius: 8, spreadRadius: 1)];
        } else {
          rankColor = Colors.grey;
          cardColor = Color(0xFF001122);
          cardShadow = null;
        }

        String badge = '';
        if (rank <= 3) {
          badge = ['Emperor', 'King', 'Hero'][rank - 1];
        } else if (rank <= 10) badge = 'Warrior';

        int totalKills = 5000 - (index * 200);
        double avgKills = (totalKills / 50).roundToDouble(); // Assume 50 matches
        double headshotRate = 45.0 - index * 2.0; // Decreasing

        return Stack(
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              color: cardColor,
              shadowColor: rank == 1 ? Color(0xFFF9C623) : rank == 2 ? Colors.white : rank == 3 ? Color(0xFFCD7F32) : Colors.black,
              elevation: cardShadow != null ? 5 : 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: rank <= 3 ? Colors.transparent : Colors.grey.shade700, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Left: Rank Number
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: rankColor.withValues(alpha: 0.2),
                        border: Border.all(color: rankColor, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          '#$rank',
                          style: TextStyle(color: rankColor, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    // Middle: Player Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Player $rank',
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 8),
                              if (badge.isNotEmpty && ['Emperor', 'King', 'Hero'].contains(badge))
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: badge == 'Hero' ? Colors.blue.shade700 : badge == 'King' ? Color(0xFFF9C623).withValues(alpha: 0.2) : Colors.purple.shade700,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: badge == 'Hero' ? Colors.grey.shade400 : badge == 'King' ? Color(0xFFF9C623) : Color(0xFFF9C623),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        badge == 'Hero' ? '🛡️' : badge == 'King' ? '👑' : '🔱',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        badge,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (rank <= 3)
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: rank == 1 ? Colors.red.shade700 : Colors.orange.shade700,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    rank == 1 ? 'Most Dangerous Player' : 'Top Fragger',
                                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            'UID: 12345$rank',
                            style: TextStyle(color: Colors.grey[400], fontSize: 12),
                          ),
                          if (rank % 2 == 0) // Simulate squad mode
                            Text(
                              'Team: Royal$rank',
                              style: TextStyle(color: Colors.grey[300], fontSize: 12),
                            ),
                        ],
                      ),
                    ),
                    // Right: Stats
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total Kills: $totalKills',
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Avg: $avgKills/match',
                          style: TextStyle(color: Colors.grey[300], fontSize: 11),
                        ),
                        Text(
                          'HS Rate: ${headshotRate.toStringAsFixed(1)}%',
                          style: TextStyle(color: Colors.grey[300], fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (rank == 1)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red.shade900,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomLeft: Radius.circular(12)),
                  ),
                  child: Text(
                    '🐍 DEADLY',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget buildSeasonProgressDashboard() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Season Progress Title
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF001122),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color.fromRGBO(249, 198, 35, 0.5), width: 2),
              ),
              child: Column(
                children: [
                  // Animated flames
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 1.2),
                    duration: Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: Text(
                          '🔥 🔥 🔥',
                          style: TextStyle(fontSize: 30),
                        ),
                      );
                    },
                    onEnd: () {
                      // Restart on end for continuous animation
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Season Progress Dashboard',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Royal XP Journey',
                    style: TextStyle(color: Colors.amber, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Circular Progress Ring
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: CircularProgressIndicator(
                      value: 0.75, // 75% progress towards next rank
                      strokeWidth: 12,
                      backgroundColor: Colors.grey.shade800,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF9C623)),
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF001122),
                      border: Border.all(color: Color.fromRGBO(249, 198, 35, 0.8), width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(249, 198, 35, 0.3),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Gold',
                          style: TextStyle(color: Color(0xFFF9C623), fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Tier',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Rank Tiers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tierCard('Bronze', Color(0xFFCD7F32), false),
                tierCard('Silver', Colors.grey, false),
                tierCard('Gold', Color(0xFFF9C623), true),
                tierCard('Diamond', Colors.blue, false),
                tierCard('Emperor', Colors.purple, false),
              ],
            ),
            SizedBox(height: 30),
            // Season Stats
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                statCard('Matches Played', '247', Icons.gamepad, Color(0xFFF9C623)),
                statCard('Kill Ratio', '2.4', Icons.trending_up, Colors.red),
                statCard('Win Ratio', '68%', Icons.emoji_events, Colors.green),
                statCard('Damage Stats', '34.5K', Icons.flash_on, Color(0xFFF9C623)),
                statCard('Royal XP Gain', '15,750', Icons.star, Colors.amber),
                statCard('Current RP', '8,900 / 10,000', Icons.grade, Color(0xFFF9C623)),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget tierCard(String tier, Color color, bool isCurrent) {
    return Container(
      width: 60,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isCurrent ? color.withValues(alpha: 0.2) : Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isCurrent ? color : Colors.grey.shade600,
          width: isCurrent ? 2 : 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            tier[0], // First letter
            style: TextStyle(color: isCurrent ? color : Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            tier,
            style: TextStyle(color: isCurrent ? color : Colors.white, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget statCard(String title, String value, IconData icon, Color iconColor) {
    return Card(
      color: Color(0xFF001122),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 32),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final _widgetOptions = <Widget>[
    HomeScreen(),
    TournamentScreen(),
    WalletScreen(),
    LeaderboardScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Royal Battle'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Tournaments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.primaryGold,
        unselectedItemColor: AppTheme.textSecondary,
        backgroundColor: AppTheme.backgroundBlack,
        onTap: _onItemTapped,
      ),
    );
  }
}
