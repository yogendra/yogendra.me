---
title: OpenVPN on (Rooted) SGS2
author: Yogi
type: post
date: 2012-01-01T16:59:22+00:00
url: /2012/01/02/openvpn-on-rooted-sgs2/
categories:
  - Android
tags:
  - android
  - openvpn
  - s2
  - sgs2
  - tun.ko
  - vpn

---
<img class="size-full wp-image-27 alignleft" style="border-style: initial; border-color: initial; margin: 5px;" title="OpenVPN" src="http://www.yogendra.me/wp-content/uploads/2012/01/ovpnlogo.png" alt="" width="228" height="54" />

<p style="text-align: left;">
  Since mid-last year, I started using a VPN service. Good for me, my VPN provider has both <a href="http://goo.gl/8LTMa" target="_blank">L2TP</a> and <a href="http://goo.gl/jEe4k" target="_blank">OpenVPN</a> services. L2TP is very easy to configure on Android phones (newer ones). But I find it unstable (may be my provider&#8217;s problem). So, I prefer OpenVPN as its stable.
</p>

I can only switch between L2TP and OpenVPN a limited number of time in a month. My provider do provide a good guide for getting OpenVPN up and running on a rooted android phone. But as we know &#8220;NO TWO DROIDS ARE SAME&#8221;, I had to improvise to get it all up. I did manage to get VPN up in a sec but requests were not getting routed via VPN.

After all the reading around at regular places, I got this thing working. Here&#8217;s how I did it. You would require:

  1.  tun.ko module for your kernel (Optional as SGS2 should have it build in, I am using DXKL3 firmware. Else try <a href="http://goo.gl/g8Rnj" target="_blank">tun.ko installer</a> app), if you can not find one and don&#8217;t feel like compiling one, STOP HERE else read on.
  2. Rooted Phone (procedure for SGS2 <a title="here" href="http://goo.gl/ehSbJ" target="_blank">here</a>)
  3. Busybox (SGS2 w/ [CF-Root][1] don&#8217;t have to do anything, its all burnt in, else use <a href="http://goo.gl/p8Q1z" target="_blank">BusyBox Installer</a>)
  4. VPN Account with OpenVPN service (I guess you have one already else just google it)
  5. Application: <a href="http://goo.gl/Xoecp" target="_blank">OpenVPN Installer</a>
  6. Application: <a href="http://goo.gl/W1VeQ" target="_blank">OpenVPN Settings</a>
  7. A PC/Mac with [Android SDK][2] (adb tool) and [Kies][3] **OR** <a href="http://goo.gl/G9Ids" target="_blank">Terminal Emulator</a> **OR** [SSHDroid][4] application in the phone
  8. 30 minutes of time to make all this work.

[<img class="alignright size-thumbnail wp-image-28" style="margin: 5px;" title="OpenVPN Install" src="http://www.yogendra.me/wp-content/uploads/2012/01/openvpn-install-150x150.png" alt="" width="150" height="150" />][5]

<div>
</div>

<div>
  Once you have rooted your phone, install applications mentioned above as per your preference . Start &#8220;OpenVPN Installer&#8221; application and click &#8220;Install&#8221;. Choose &#8220;<strong>/system/xbin</strong>&#8221; location for &#8220;<strong>openvpn</strong>&#8220;. For &#8220;<strong>ifconfig/route</strong>&#8221; choose &#8220;<strong>/system/xbin/bb</strong>&#8221; for ifconfig/route.
</div>

<div>
</div>

<div>
  Now, this is the most tricky part. ifconfig and route commands did not get configured correctly. Then I stumbled on<a href="http://goo.gl/3BgZE"> this thread</a> where people were facing exact same issue. Its a huge thread, so just read post #30 and #34 or better, run following commands (in bold) on PC/Mac:
</div>

> <div>
>   # Remount /system are R/W
> </div>
> 
> <div>
>   <strong>adb remount</strong>
> </div>
> 
> <div>
>   # Create a symlink of /system/xbin at /system/xbin/bb
> </div>
> 
> <div>
>   <strong>adb  ls -s /system/xbin /system/xbin/bb</strong>
> </div>
> 
> <div>
>   # Link toolbox (busybox) as ifconfig and route under /system/xbin/bb
> </div>
> 
> <div>
>   <strong>adb shell ln -s /system/bin/toolbox /system/xbin/bb</strong>
> </div>

<div>
  <blockquote>
    <div>
      <strong>adb shell ln -s /system/bin/toolbox /system/xbin/bb</strong>
    </div>
    
    <div>
       # (Optional) Reboot your phone to just make /system R/O
    </div>
    
    <div>
      <strong>adb reboot</strong>
    </div>
  </blockquote>
</div>

<div>
</div>

<div>
  Puh! congrats you are through with toughest part. Put your OpenVPN configuration files (keys and ovpn file) in <strong>/sdcard/openvpn</strong> folder. Start <strong>OpenVPN Settings</strong>, and you should see your configuration listed just under &#8220;<strong>OpenVPN</strong>&#8221; option.
</div>

<div>
</div>

<div>
  Optional: Long press on your configuration name and choose &#8220;Preferences&#8221;. Put Google DNS Server &#8220;<strong>8.8.8.8</strong>&#8221; in VPN DNS Server field and check &#8220;<strong>Use VPN DNS Server</strong>&#8220;.
</div>

<div>
</div>

<div>
   <a href="http://www.yogendra.me/wp-content/uploads/2012/01/openvpn-connected.png"><img class="alignleft size-thumbnail wp-image-34" style="border-image: initial; margin: 5px;" title="OpenVPN Successfully Connected" src="http://www.yogendra.me/wp-content/uploads/2012/01/openvpn-connected-150x150.png" alt="" width="150" height="150" /></a>All set! Just click on &#8220;<strong>OpenVPN</strong>&#8221; on main screen and then click on your configuration name (might have to click twice). You will see the progress in the status bar and final message is &#8220;<strong>Connection successful</strong>&#8220;. If you pull the notification bar down, you should see upload and download speeds.
</div>

<div>
</div>

<div>
  Just go to any site (<a href="http://goo.gl/auec" target="_blank">ip2location</a>) which tells your ip/location (I go to my VPN provider&#8217;s page) and check if all works.
</div>

<div>
</div>

<div>
  Okay I have just enough time to catch next episode of CSI:Miami on CBS. Bye.
</div>

<div>
</div>

<div>
  Note: For other Android (2.1+) phones checkout <a href="http://goo.gl/UrJMn">vpnblog</a>
</div>

 [1]: http://goo.gl/ehSbJ
 [2]: http://goo.gl/2qpr
 [3]: http://goo.gl/dS1rv
 [4]: http://goo.gl/J7agC
 [5]: http://www.yogendra.me/wp-content/uploads/2012/01/openvpn-install.png