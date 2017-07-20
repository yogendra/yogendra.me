---
title: How to use UOB Internet Banking on Chrome/Safari on MAC OS X Lion
author: Yogi
type: post
date: 2012-01-08T10:15:50+00:00
url: /2012/01/08/how-to-use-uob-internet-banking-on-chrome-on-mac-os-x/
categories:
  - Chrome
  - Productivity
tags:
  - bookmarklet
  - chrome
  - firefox
  - fix
  - javascript
  - lion
  - opera
  - safari
  - uob

---
I have been suffering with login issues on [UOB][1] internet banking site for as long as I can remember. I had to use Windows on a virtual machine to always login on UOB internet banking site.

<div id="attachment_89" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://www.yogendra.me/wp-content/uploads/2012/01/UOB-ERROR.png"><img class="size-medium wp-image-89" title="UOB Login Error" src="http://www.yogendra.me/wp-content/uploads/2012/01/UOB-ERROR-300x109.png" alt="uob login error on mac os x chrome" width="300" height="109" srcset="http://www.yogendra.me/wp-content/uploads/2012/01/UOB-ERROR-300x109.png 300w, http://www.yogendra.me/wp-content/uploads/2012/01/UOB-ERROR.png 835w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Error Message on login page in Chrome
  </p>
</div>

I checked java installation and its all in top shape. I knew that its some crappy javascript coding that is causing it to fail to load (or merely reporting it as &#8220;failed to load&#8221;). Surprisingly site got loaded perfectly on Firefox and Opera on OS X Lion. Puh! After searching internet for possible issue I ran into a chromium issue report [40364][2]. That made me wear my developer hat.

I started looking up for the error message all over the javascript and html code. I started by stepping through code in the &#8220;Developer Tools&#8221; in chrome. Main culprit here was initApplet() method in pib_login.js.

All you need to do is execute &#8216;initApplet&#8217; and &#8216;init&#8217; method on the login page after everything is finished loading. I tried writing an extension to DO THAT , but Chrome&#8217;s extension protects the page javascript and css. It allows you to modify DOM only. So, I had to think of something else. And then I remembered &#8220;Bookmarklet&#8221;. And here it is now. Just follow the steps below to get it working.

  1. Drag the link below (&#8220;FIX UOB Login&#8221;) to your bookmark bar (one time only) or create a bookmark with address/URL as one mentioned below (Updated).
  2. Goto UOB internet banking page.
  3. On the login page, after you get the error (see image) click &#8220;OK&#8221;, **let the page load fully**
  4. Once page is fully loaded, click on the bookmarklet (that you dragged in first step).
  5. That&#8217;s it you can login now.
  6. Repeat step 2-5, every time you want to login.

<div style="text-align: center;">
  <strong><a title="UOB Login Fix" href="javascript:(function()%7Bif(location.href==%22https://pib.uob.com.sg/PIBLogin/appmanager/Login/Public%22)%7BinitApplet();init();%7D%7D)();">UOB Login Fix</a></strong>
</div>

<strong style="text-align: left;">Update</strong><span style="text-align: left;">: Some users have reported issues with the bookmarklet. So, I am also posting javascript code that you can put as URL/Address of you bookmark to</span>

<div style="text-align: center;">
  <em><strong>javascript:(function()%7Bif(location.href==%22https://pib.uob.com.sg/PIBLogin/appmanager/Login/Public%22)%7BinitApplet();init();%7D%7D)();</strong></em>
</div>

> <div style="text-align: center;">
>
> </div>

<div>
  Please note, that this bookmarklet is designed for Singapore Personal Banking UOB site only. If you are going to any other UOB Banking site, then this Bookmarklet may not work
</div>

<p style="text-align: center;">
  <em><strong>Disclaimer</strong></em>: <em>I will not be liable for any issues resulting, directly or indirectly, due to use of any information provided here.</em>
</p>

 [1]: http://www.uob.com.sg/personal/index.html
 [2]: http://code.google.com/p/chromium/issues/detail?id=40364