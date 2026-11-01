import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_finance/main.dart';

void main() {
  runApp(const homeScreen());
}

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                right: 12,
                bottom: 40,
                left: 12,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Total balance
                    totalBalance(),

                    incomeAndExpenses(),

                    SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: Container(
                        decoration: BoxDecoration(
                          color: mainColor,
                          boxShadow: [
                            BoxShadow(
                              color: mainColorShadow,
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Last Week Expenses",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                        123,
                                        87,
                                        87,
                                        87,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "- ₺13.275.00",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                        122,
                                        247,
                                        34,
                                        34,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: weeklyIncomeExpensesChart(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      spacing: 18,
                                      children: [
                                        _chartLegend(
                                          "Income",
                                          const Color(0xFF35B779),
                                        ),
                                        _chartLegend(
                                          "Expenses",
                                          const Color(0xFFE85D5D),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DayFinanceData {
  const _DayFinanceData({
    required this.day,
    required this.income,
    required this.expenses,
  });

  final String day;
  final double income;
  final double expenses;
}

const _weeklyFinanceData = [
  _DayFinanceData(day: "M", income: 4500, expenses: 1250),
  _DayFinanceData(day: "T", income: 0, expenses: 480),
  _DayFinanceData(day: "W", income: 2000, expenses: 2200),
  _DayFinanceData(day: "T", income: 0, expenses: 900),
  _DayFinanceData(day: "F", income: 3500, expenses: 1750),
  _DayFinanceData(day: "S", income: 0, expenses: 3650),
  _DayFinanceData(day: "S", income: 10975, expenses: 3045),
];

Widget weeklyIncomeExpensesChart() {
  const chartWidth = 392.0;
  const cellWidth = 56.0;
  const maxBarHeight = 42.0;
  const baseline = 62.0;
  const chartHeight = 132.0;
  const incomeColor = Color(0xFF35B779);
  const expenseColor = Color(0xFFE85D5D);
  const maxIncome = 10975.0;
  const maxExpenses = 3650.0;

  return SizedBox(
    height: chartHeight,
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: chartWidth,
          child: Stack(
            children: [
              Positioned(
                top: baseline,
                left: 0,
                right: 0,
                child: Container(height: 1, color: const Color(0xFFD8D8D8)),
              ),
              Row(
                children: [
                  for (final day in _weeklyFinanceData)
                    SizedBox(
                      width: cellWidth,
                      height: chartHeight,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          if (day.income > 0)
                            Positioned(
                              top:
                                  baseline -
                                  maxBarHeight * day.income / maxIncome,
                              child: Tooltip(
                                message:
                                    "${day.day} income: ₺${day.income.toStringAsFixed(2)}",
                                child: Container(
                                  width: 14,
                                  height: maxBarHeight * day.income / maxIncome,
                                  decoration: BoxDecoration(
                                    color: incomeColor,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ),
                            ),
                          if (day.expenses > 0)
                            Positioned(
                              top: baseline + 2,
                              child: Tooltip(
                                message:
                                    "${day.day} expenses: ₺${day.expenses.toStringAsFixed(2)}",
                                child: Container(
                                  width: 14,
                                  height:
                                      maxBarHeight * day.expenses / maxExpenses,
                                  decoration: BoxDecoration(
                                    color: expenseColor,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ),
                            ),
                          Positioned(
                            top: 112,
                            child: Text(
                              day.day,
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: const Color(0xFF575757),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _chartLegend(String label, Color color) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    spacing: 6,
    children: [
      Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      Text(
        label,
        style: GoogleFonts.montserrat(
          fontSize: 10,
          color: const Color(0xFF575757),
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

// Total balance widget
SizedBox totalBalance() {
  return SizedBox(
    width: double.infinity,
    height: 160,
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 35, 95, 79),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Balance",
            style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),

          Text(
            "₺7.700.00",
            style: GoogleFonts.montserrat(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Percentage increase in income compared to the previous month.
          Row(
            spacing: 8,
            children: [
              Icon(
                Icons.trending_up,
                color: const Color.fromARGB(255, 13, 219, 140),
              ),
              Text(
                "+12.5% this month",
                style: GoogleFonts.montserrat(
                  color: const Color.fromARGB(255, 13, 219, 140),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Income and Expenses widget
SizedBox incomeAndExpenses() {
  return SizedBox(
    width: double.infinity,
    height: 120,
    child: Row(
      spacing: 10,
      children: [
        // Income widget
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 61, 167, 138),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.south_west,
                  color: const Color.fromARGB(255, 91, 252, 209),
                  size: 20,
                ),
                Text(
                  "₺20.975.00",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Income",
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: const Color.fromARGB(190, 255, 240, 255),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Expenses widget
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: mainColor,
              border: Border.all(
                color: const Color.fromARGB(76, 194, 50, 40),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(255, 73, 73, 0.438),
                  blurRadius: 2,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.north_east,
                  color: const Color.fromARGB(255, 255, 77, 77),
                  size: 20,
                ),
                Text(
                  "₺13.275.00",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 255, 77, 77),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Expenses",
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: const Color.fromARGB(71, 65, 65, 65),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
