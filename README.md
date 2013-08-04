# Potter

[![Code Climate](https://codeclimate.com/github/cschell/potter.png)](https://codeclimate.com/github/cschell/potter)

[Potter](http://potterapp.de) is a side project where I try to fight the distractions coming from the immediate desire to share everything with people around you, regardless if they want or don't want their inboxes getting cluttered.

With [Potter](http://potterapp.de) you can create a "pot", invite people to it and start throwing links to interesting things on the internet into that pot – a sophisticated bookmarklet will help you anytime you discover something! Every week Potter will create an email containing last week's links and send it to its members so they get everything at once.


This project started more for fun and practicing than for anything else but quickly became a nice tool for my collegues and me. Please feel free to give feedback and report bugs!

![Screenshot from Potter](http://get.chrisschell.de/SUVj.png)

## Internals

 - Potter is written in Ruby on Rails and relies on a PostgreSQL database.
 - I used [Flat UI](http://designmodo.github.io/Flat-UI/), a twitter boostrap theme
 - emails are sent by postmarkapp.com
 - hosting is provided and sponsored by my company [Sophisticates GmbH](http://sophisticates.de)


## Roadmap

Potter is in an early development stage and I can picture it growing in various directions. I currently do not have special plans but one of my main concerns are:

  - i18n – potter is currently available only in German, I'd like to translate it completly into English
  - finding a better name. Potter resulted from "pot" but is neither a descriptive nor unique name
  - better testing. Currently there only are some unit tests but I'd like to have some view and integration testing as well. Usually I do TDD, but since this project started as a small exercise I havent been testing consequently at first
  - better readme – writing good readmes is so hard!

## Get in touch

Because this project is in such an early and experimental stage, please feel free to contact me anytime potter@chrisschell.de