import 'package:flutter/material.dart';
import 'githubCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

//this is the view part of the card
class GithubCardItem extends StatelessWidget {
  GithubCard _card;


  GithubCardItem(GithubCard _card) {
    this._card = _card;
  }

  @override
  Widget build(BuildContext context) {

    String description = this._card.getDescription();
    String title = this._card.getTitle();
    String avatarUrl = this._card.getAvatar();
    num star = this._card.getStar();
    num openIssueCount = this._card.getOpenIssue();
    String url = this._card.getProjectURL();

    //some project don't have descrition
    if(description == null)
      description = "The repo doesn't have a desciption";
    //check if the description is too long
    //in case wrap the string
    else if (description.length > 100)
      description = description.substring(0, 100) + "...";

    return new Card(

      child: new InkWell(
        onTap:  () => _launchInBrowser(),
        child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            leading: avatarUrl != null
                ? new Image.network(avatarUrl)
                : new Image.network(
                "https://identicons.github.com/jasonlong.png"),
            title: new Text(title,
                style: new TextStyle(
                    color: new Color.fromARGB(255, 117, 117, 117),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto')
            ),
            subtitle: new Text(description),
          ),

          new Container(
            padding: const EdgeInsets.only(left: 280.0,bottom: 30.0),
            child: new Column(
              children: <Widget>[
              new Row(
              children: <Widget>[
                  new Icon(
                  Icons.star,
                  color: Colors.red[500],
                  ),
                  new Text(star.toString()),
              ]),

              ],
            ),
          )
        ],
      ),
      )
    );
  }

  ///redirect the browser to the project
  Future<Null> _launchInBrowser() async {
    if (await canLaunch(this._card.projectURL)) {
      await launch(this._card.projectURL, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $this._card.projectURL';
    }
  }
}