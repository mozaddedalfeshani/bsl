import 'dart:math';

import 'package:bsl/src/objective/model.dart';
import 'package:flutter/material.dart';

class ObjectiveView extends StatefulWidget {
  const ObjectiveView({Key? key}) : super(key: key);

  @override
  State<ObjectiveView> createState() => _ObjectiveViewState();
}

class _ObjectiveViewState extends State<ObjectiveView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _objectiveAnimation;
  late final Animation<double> _profileAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(
        milliseconds: 270,
      ),
      vsync: this,
    );
    _objectiveAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.7),
      ),
    );
    _profileAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 1),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, snapshot) {
          return ClipRRect(
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (_, constraints) {
                    return Transform.translate(
                      offset: Offset(
                          -_animationController.value * constraints.maxWidth,
                          0),
                      child: ObjectiveViewBox(),
                    );
                  },
                ),
                LayoutBuilder(
                  builder: (_, constraints) {
                    return Transform.translate(
                      offset: Offset(
                          constraints.maxWidth -
                              _animationController.value * constraints.maxWidth,
                          0),
                      child: CompanyProfile(),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Transform.translate(
                    offset: const Offset(-25.0, 0),
                    child: Transform.rotate(
                      angle: (pi / 2) * 3,
                      child: Transform.scale(
                        scale: _objectiveAnimation.value,
                        child: TextButton(
                          onPressed: () {
                            _animationController.reverse();
                          },
                          child: const Text(
                            "Objective",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Transform.translate(
                    offset: const Offset(48.0, 0),
                    child: Transform.rotate(
                      angle: (pi / 2) * 3,
                      child: Transform.scale(
                        scale: _profileAnimation.value,
                        child: TextButton(
                          onPressed: () {
                            _animationController.forward();
                          },
                          child: const Text(
                            "Company Profile",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class ObjectiveViewBox extends StatelessWidget {
  ObjectiveViewBox({
    Key? key,
    ScrollController? scrollController,
  })  : _scrollController = scrollController ?? ScrollController(),
        super(key: key);
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30),
      controller: _scrollController,
      key: const ValueKey("Objective_list"),
      children: [
        Text(
          "Objective",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          "Our Mission",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "Providing the Quality Products and services through environmentally & friendly technology along with the satisfaction of the customers and the interests of related partners. We implement a high productive technology through efficient and capable human resources to implement our dreams. We will again build a beautiful and healthier world by going beyond the expectations of the Customers.",
        ),
        Text(
          "Our Vision",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "Commitment, Integrity, Passion, Seamlessness, Quality Products & Modern Services as per demand of the Customers.",
        ),
        Text(
          "Our Values",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "Respect the Customers Feelings. Achieved goals as celebrities and owner/workers celebrated success. No wastes are acceptable. We never complacent. We enjoy our responsibilities & believe in Social & Environmental Awareness.",
        ),
      ],
    );
  }
}

class CompanyProfile extends StatelessWidget {
  CompanyProfile({Key? key, ScrollController? scrollController})
      : _scrollController = scrollController ?? ScrollController(),
        super(key: key);
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30),
      key: const ValueKey("company_profile_list"),
      controller: _scrollController,
      children: [
        Text(
          "Company Profile",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          "CUTTING & FUSING",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "From the moment that materials enter the building the philosophy of best practice begins. For any factory, high quality output depends directly upon high quality input, so all focus is on ensuring that raw materials are cared for and prepared properly for production. Clean and dry storage conditions, well maintained inspection and laying tables and comprehensive training, ensure that customers achieve the best yield possible from the raw materials. Fusing is by top class Veit Brisay Kannegiesser equipment, meticulously maintained and repeatedly tested throughout the day. Lays and small part cutting are performed by skilled teams, correctly trained in safe practices,",
        ),
        Text(
          "Sewing Floors",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "Basic Tower’s 17state of the art sewing lines are capable of producing 500,000 pieces per month, including 100,000 fully taped, non iron shirts. Automated collar and cuff setting, trimming and placket forming equipment, ensure that garments are produced consistently, throughout the programme.Each floor is managed by 4 senior production staff and 4 moving Quality Controllers, to identify and correct any anomalies, as soon as they occur, in order to keep garment rejection to a minimum, The non-iron section uses the latest taping technology to achieve clean and consistent shoulder,side scams,Armhole,pocket, back yok,sleep placket and hem by attachment of tape, producing a shirt wrinckle free that is of a premium standard. Automation is key to the productivity and consistency of the product. Guided sewing, automatic folding, collar setting and component trimming keeps garment rejection to garment rejection to a minimum improving the final yield. Clean and well maintained placket setting, ensures that the finished product presentation is at its best.",
        ),
        Text(
          "Non-iron capability",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "Basic Tower's 100,000 unit per month non-iron shirt capacity is the result of the latest automated technological investment. Full taping, followed by an impressive sequence of men’s and ladies side, armhole and placket presses, sets up the garments, for final ironing and presentation processing.",
        ),
        Text(
          "Finishing & Packaging",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "The investment in equipment and training continues through the floors, as the assembled garments pass through thread removal, inspection, automated pressing and guided folding tables, Once packed the goods are passed through metal detection to the metal free zone, where they are boxed and sealed before dispatch, Consignments are stored in a purpose built, 14,000 sq ft finished goods area, ready for shipment, The finished goods area has the flexibility to hold both boxed and hanging goods, depending on customer preference, Notification of workers’ rights is printed in multiple languages and displayed prominently around the building, Discreet grievance boxes are available to allow staff to anonymously raise any concerns if it is felt necessary.Clean & bright canteen facilities for all staff along with a plentifull supply of clean & fress water.\n A large first aid room is provieded for all workers,staff by a fully qualified doctor and medicale asistant.Clean and bright child care facilities are also provided for the use of all workers.\nIn order to promote high workforce retention,all staff and workers are offered the following additional benefits :",
        ),
        const Text(
          "1. Attendance bonus.\n2. Two festival bonuses.\n3. Yearly bonus to the worker.\n4. Free medical treatment.\n5. Uniform and head dress.\n6. Profit share for all workers.\n7. Help medical treatment of husband/wife, children parents of the worker.\n8. 500 Eggs project for weak worker.\n9. Provided household goods to the newly married workers.",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          "BASIC SHIRTS LIMITED Bangladesh based,dedicated compliance manager,independently monitors all compliance criteria, working with the factory's senior management team,to ensure that the highest standards are maintained.",
        ),
        Text(
          "Workforce Security & Welfare",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "Protection of workers’ physical and social wellbeing is top priority, Firstly, the building itself has been passed as fit for purpose by the Gazipur City Corporation, Equipment used in the factory employs the latest safety mechanisms. Power is provided via RCD protected Busbar overhead channels, Bosch fire alert and control systems, fitted during the build, are supplemented by a high level of fire fighting and defence equipment on every floor. Fire exit provision is via wide, clearly visible push bar operated doors, leading to high capacity exit walkways, The building access is monitored by a dedicated security team with in order to protect personnel within, C.C camera",
        ),
        Text(
          "Productivity & Continuity",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "In order to ensure maximum continuity of productivity, Basic Tower benefits from its own independent source of emergency power. A Perkins 2206A generator, coupled with a Stamford alternator rated 450K VA, feeds a suite of Adex transformers, capable of producing GOOO KWh of power to the factory, in the event of an interruption to the civil power supply.",
        ),
        Text(
          "Audit Completed",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Text(
          "1. ISO CERTIFIED\n2. ACCORD (STRUCTURAL, FIRE & ELECTRIC SAFETY)\n3. SEDEX MEMBER\n4. WRAP CERTIFIED\n5. CT-PAT CERTIFIED\n6. OCS (ORGANIC CONTENT STANDARD)\n7. INDITEX ( BUYER AUDIT)\n8. LI & FUNG ( BUYER AUDIT)\n9. NEXT ( BUYER AUDIT)\n10. OMEGA ( BUYER AUDIT)\n11. ENGELBERT STRAUSS ( BUYER AUDIT)",
        ),
        Text(
          "Machinery & Equipment",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Table(
          columnWidths: const {
            1: IntrinsicColumnWidth(),
            2: IntrinsicColumnWidth(),
          },
          border: TableBorder.all(width: 1),
          children: tableInformation
              .map<TableRow>((e) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(e.machineType),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(e.brand),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(e.quantity),
                      ),
                    ],
                  ))
              .toList(),
        )
      ],
    );
  }
}
