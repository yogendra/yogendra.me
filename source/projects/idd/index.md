---
title: IDD Dialer
date: 2018-04-14 12:49:18
tags:
  - productivity
  - android
  - app
thumbnailImage: https://go.yogendra.me/2vg2Zxe
---

{% image right https://go.yogendra.me/2vg2Zxe %}
IDD Dialer is a simple utility application for Android. It simplifies usage of IDD service, Calling Cards, etc.

Most of the times, using these services requires you to either put custom numbers in your address book or copy-paste-edit phone numbers. Example, if you want to dial `+911234567890`, and idd service needs you to put `018`. So, you are expected to dial `018911234567890`.

You could store the number as expected by the service provider, in addressbook. But when you change service, well good luck updating all the numbers. Other option is to copy-paste numbers on dialer screen and prefix with whatever you need to.

![Number Replacement][number-replace-image]

This is *unacceptable* in 2018. So, I made this app to just replace the phone number on-the-fly. No more storing cutom prefixed numbers.
This application replaces `+` in the your outgoing number with another prefix.

# How does it work?

{% image right fig-50 https://go.yogendra.me/2vbUnHM %}
This app replaces `+` in the outgoing calls with the **prefix** that you supplied in the settings. It will skip this replacement for any number that starts with your local ISD code. So if you are in Singapore and using StarHub IDD service, you may have following settings (See image):

* Enabled: Yes
* Prefix: 018
* Local ISD Code: 65

# What Next?

I plan to opensource this project. Also, I plan to improve this application with better controls, wizards, etc. But I don't have a timeline for this. But keep your comments and feedback coming.

Post your feedback here in comments.


[![Get it on Google Play][playstore-icon]][app-link]


[number-replace-image]: https://go.yogendra.me/2Hlkp0m
[icon]: https://go.yogendra.me/2vg2Zxe
[example-starhub]: https://go.yogendra.me/2vbUnHM
[app-link]: https://play.google.com/store/apps/details?id=me.yogendra.idd&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1
[playstore-icon]: https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png
