import 'package:DSC/configs/assets.dart';
import 'package:DSC/data/models/eventsModel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:DSC/widgets/pageIndicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class EventDetails extends StatefulWidget {
  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  int slideIndex = 0;
  PageController controller;
  @override
  void initState() {
    super.initState();
    controller = new PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EventModel eventTriggred = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.containerBackgroundImg),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  color: Color(0xff0C346A).withOpacity(0.9),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        eventTriggred.eventTitle,
                        minFontSize: 12,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: AutoSizeText(
                          "Vellore Institute of Technology, Bhopal",
                          minFontSize: 10,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      AutoSizeText(
                        eventTriggred.eventDay != null
                            ? eventTriggred.eventDay +
                                ", ${eventTriggred.eventDate}, ${eventTriggred.eventTime}"
                            : "" +
                                "${eventTriggred.eventDate}, ${eventTriggred.eventTime}",
                        minFontSize: 10,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              margin:
                                  EdgeInsets.only(top: 5, right: 5, bottom: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  FontAwesome.facebook,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  FontAwesome.twitter,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  FontAwesome.instagram,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  FontAwesome.pinterest,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  FontAwesome.mail,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  FontAwesome.youtube,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 1, color: Colors.white),
                            ),
                            child: AutoSizeText(
                              "#${eventTriggred.eventHashTag}",
                              minFontSize: 10,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              String url = eventTriggred.eventURL;
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10, left: 10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                              child: AutoSizeText(
                                "JOIN us NOW",
                                minFontSize: 10,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 12),
                  child: AutoSizeText(
                    slideIndex == 0 ? "About this event" : "Web Timeline",
                    minFontSize: 12,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      slideIndex = index;
                    });
                  },
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: AutoSizeText(
                          eventTriggred.eventDesc,
                          minFontSize: 12,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    eventTriggred.secondPagePoints != null
                        ? Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: AutoSizeText(
                                  eventTriggred.secondPageSubHeading,
                                  minFontSize: 12,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Scrollbar(
                                  radius: Radius.circular(20),
                                  thickness: 4,
                                  child: ListView.builder(
                                    itemCount:
                                        eventTriggred.secondPagePoints.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.all(8),
                                        padding: EdgeInsets.only(left: 10),
                                        child: AutoSizeText(
                                          eventTriggred.secondPagePoints[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            child: Center(
                              child: Text(
                                "No data avilable😖\nplease contact the admistrator",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                    eventTriggred.thirdPagePoints != null
                        ? Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: AutoSizeText(
                                  eventTriggred.thirdPageSubHeading,
                                  minFontSize: 12,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Scrollbar(
                                  radius: Radius.circular(20),
                                  thickness: 4,
                                  child: ListView.builder(
                                    itemCount:
                                        eventTriggred.secondPagePoints.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.all(8),
                                        padding: EdgeInsets.only(left: 10),
                                        child: AutoSizeText(
                                          eventTriggred.secondPagePoints[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            child: Center(
                              child: Text(
                                "No data avilable😖\nplease contact the admistrator",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    i == slideIndex
                        ? buildPageIndicator(
                            true,
                            Constants.googleLogoColorsList[
                                Constants.googleLogoColorsList.length - i - 1],
                          )
                        : buildPageIndicator(
                            false,
                            Constants.googleLogoColorsList[
                                Constants.googleLogoColorsList.length - i - 1],
                          ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
