import 'package:fanby/fan_controllers/fan_check_controller.dart';
import 'package:fanby/fan_controllers/fan_profile_controller.dart';
import 'package:fanby/fan_screens/fan_calendar_screen/fan_calendar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class FanCalendarScreen extends StatefulWidget {
  const FanCalendarScreen({super.key});

  @override
  State<FanCalendarScreen> createState() => _FanCalendarScreenState();
}

class _FanCalendarScreenState extends State<FanCalendarScreen> {
  final fanController = Get.find<FanCheckController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Calendar',
          style: TextStyle(
            fontFamily: 'Mont',
            fontSize: 18,
            fontVariations: [FontVariation('wght', 800)],
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<FanProfileController>(builder: (profController) {
          return GetBuilder<FanCheckController>(builder: (_) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => TableCalendar(
                        focusedDay: fanController.fanDate.value,
                        weekendDays: const [],
                        onDaySelected: (selectedDay, focusedDay) {
                          fanController.fanDate.value = focusedDay;
                          fanController.getNotes();
                        },
                        onPageChanged: (focusedDay) {
                          fanController.fanDate.value = focusedDay;
                          fanController.getNotes();
                        },
                        headerStyle: HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          leftChevronIcon: Container(
                            height: 24,
                            width: 24,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                                'fan_assets/icons/c_right.svg'),
                          ),
                          rightChevronIcon: Container(
                            height: 24,
                            width: 24,
                            alignment: Alignment.center,
                            child:
                                SvgPicture.asset('fan_assets/icons/c_left.svg'),
                          ),
                          titleTextStyle: TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 16,
                            fontVariations: [FontVariation('wght', 700)],
                            color: Colors.black,
                          ),
                        ),
                        startingDayOfWeek: StartingDayOfWeek.sunday,
                        firstDay: DateTime.utc(DateTime.now().year - 1,
                            DateTime.now().month, DateTime.now().day),
                        lastDay: DateTime.utc(
                            DateTime.now().year, DateTime.now().month + 2),
                        daysOfWeekHeight: 20,
                        calendarStyle: const CalendarStyle(),
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 14,
                            fontVariations: [FontVariation('wght', 500)],
                            color: Colors.black.withOpacity(0.5),
                          ),
                          weekendStyle: TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 14,
                            fontVariations: [FontVariation('wght', 500)],
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        calendarBuilders: CalendarBuilders(
                          dowBuilder: (context, day) {
                            if (day.weekday == 1) {
                              return Center(
                                child: Text(
                                  'Mo',
                                  style: TextStyle(
                                    fontFamily: 'Mont',
                                    fontSize: 14,
                                    fontVariations: [
                                      FontVariation('wght', 500)
                                    ],
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              );
                            }
                            if (day.weekday == 2) {
                              return Center(
                                child: Text(
                                  'Tu',
                                  style: TextStyle(
                                    fontFamily: 'Mont',
                                    fontSize: 14,
                                    fontVariations: [
                                      FontVariation('wght', 500)
                                    ],
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              );
                            }
                            if (day.weekday == 3) {
                              return Center(
                                child: Text(
                                  'We',
                                  style: TextStyle(
                                    fontFamily: 'Mont',
                                    fontSize: 14,
                                    fontVariations: [
                                      FontVariation('wght', 500)
                                    ],
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              );
                            }
                            if (day.weekday == 4) {
                              return Center(
                                child: Text(
                                  'Th',
                                  style: TextStyle(
                                    fontFamily: 'Mont',
                                    fontSize: 14,
                                    fontVariations: [
                                      FontVariation('wght', 500)
                                    ],
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              );
                            }
                            if (day.weekday == 5) {
                              return Center(
                                child: Text(
                                  'Fr',
                                  style: TextStyle(
                                    fontFamily: 'Mont',
                                    fontSize: 14,
                                    fontVariations: [
                                      FontVariation('wght', 500)
                                    ],
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              );
                            }
                            if (day.weekday == 6) {
                              return Center(
                                child: Text(
                                  'St',
                                  style: TextStyle(
                                    fontFamily: 'Mont',
                                    fontSize: 14,
                                    fontVariations: [
                                      FontVariation('wght', 500)
                                    ],
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              );
                            }
                            if (day.weekday == 7) {
                              return Center(
                                child: Text(
                                  'Su',
                                  style: TextStyle(
                                    fontFamily: 'Mont',
                                    fontSize: 14,
                                    fontVariations: [
                                      FontVariation('wght', 500)
                                    ],
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              );
                            }
                          },
                          defaultBuilder: (context, day, focusedDay) {
                            final datenote = fanController.datenotes
                                .firstWhereOrNull(
                                    (element) => element.fanDay == day.day);
                            Color fancolor;
                            if (datenote == null) {
                              fancolor = Colors.transparent;
                            } else {
                              if (datenote.isRed) {
                                fancolor = Color.fromRGBO(0, 205, 21, 1);
                              } else {
                                fancolor = Color.fromRGBO(0, 205, 21, 1);
                              }
                            }
                            if (fanController.lastCheck != null) {
                              final nextCheck = profController.fanPrem
                                  ? DateTime(
                                      fanController.lastCheck!.year,
                                      fanController.lastCheck!.month,
                                      fanController.lastCheck!.day + 1)
                                  : DateTime(
                                      fanController.lastCheck!.year,
                                      fanController.lastCheck!.month + 1,
                                      fanController.lastCheck!.day);
                              if (day.day == nextCheck.day &&
                                  day.month == nextCheck.month &&
                                  day.year == nextCheck.year) {
                                fancolor = Color.fromRGBO(248, 161, 59, 1);
                              }
                            }
                            // final notedate = teNotesController.teNotedates
                            //     .firstWhereOrNull(
                            //         (element) => element.day == day.day);
                            return Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: fancolor == Colors.transparent
                                    ? fancolor
                                    : fancolor.withOpacity(0.1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    day.day.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Mont',
                                      fontSize: 14,
                                      fontVariations: [
                                        FontVariation('wght', 500)
                                      ],
                                      color: fancolor == Colors.transparent
                                          ? Colors.black
                                          : fancolor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: day.day ==
                                                  fanController
                                                      .fanDate.value.day &&
                                              day.month ==
                                                  fanController
                                                      .fanDate.value.month &&
                                              day.year ==
                                                  fanController
                                                      .fanDate.value.year
                                          ? fancolor == Colors.transparent
                                              ? Colors.black
                                              : fancolor
                                          : Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          todayBuilder: (context, day, focusedDay) {
                            final datenote = fanController.datenotes
                                .firstWhereOrNull(
                                    (element) => element.fanDay == day.day);
                            Color fancolor;
                            if (datenote == null) {
                              fancolor = Colors.transparent;
                            } else {
                              if (datenote.isRed) {
                                fancolor = Color.fromRGBO(0, 205, 21, 1);
                              } else {
                                fancolor = Color.fromRGBO(0, 205, 21, 1);
                              }
                            }
                            if (fanController.lastCheck != null) {
                              final nextCheck = profController.fanPrem
                                  ? DateTime(
                                      fanController.lastCheck!.year,
                                      fanController.lastCheck!.month,
                                      fanController.lastCheck!.day + 1)
                                  : DateTime(
                                      fanController.lastCheck!.year,
                                      fanController.lastCheck!.month + 1,
                                      fanController.lastCheck!.day);
                              if (day.day == nextCheck.day &&
                                  day.month == nextCheck.month &&
                                  day.year == nextCheck.year) {
                                fancolor = Color.fromRGBO(248, 161, 59, 1);
                              }
                            }
                            // final notedate = teNotesController.teNotedates
                            //     .firstWhereOrNull(
                            //         (element) => element.day == day.day);
                            return Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: fancolor == Colors.transparent
                                    ? fancolor
                                    : fancolor.withOpacity(0.1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    day.day.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Mont',
                                      fontSize: 14,
                                      fontVariations: [
                                        FontVariation('wght', 500)
                                      ],
                                      color: fancolor == Colors.transparent
                                          ? Colors.black
                                          : fancolor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: day.day ==
                                                  fanController
                                                      .fanDate.value.day &&
                                              day.month ==
                                                  fanController
                                                      .fanDate.value.month &&
                                              day.year ==
                                                  fanController
                                                      .fanDate.value.year
                                          ? fancolor == Colors.transparent
                                              ? Colors.black
                                              : fancolor
                                          : Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          outsideBuilder: (context, day, focusedDay) {
                            return Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    day.day.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Mont',
                                      fontSize: 14,
                                      fontVariations: [
                                        FontVariation('wght', 500)
                                      ],
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    if (fanController.notes.isNotEmpty)
                      SizedBox(
                        height: 20,
                      ),
                    if (fanController.notes.isNotEmpty)
                      FanCalendarCard(fanModel: fanController.notes.first),
                  ],
                ),
              ),
            );
          });
        }),
      ),
    );
  }
}
