---
title: 'Google App Engine & Maven – Works For Me'
author: Yogi
type: post
date: 2014-01-03T18:23:58+00:00
url: /2014/01/04/google-app-engine-maven-works-for-me/
categories:
  - Java
  - Projects
  - Uncategorized
tags:
  - appengine
  - java
  - maven

---
Google has released its App Engine SDK on Maven central as a zip. But its very large and causes a &#8220;**Error 503 backend read error**&#8220;. So, after a lot of head-banging I resolved this by adding SDK zip package (Yes! one from website) and a few jars (optional), to maven. Skip to end for the commands. You may have to modify these for a newer version.

### [tl;dr Skip to End][1]

## Idea to Accident

I created a simple maven project for some usual &#8220;help a friend&#8221; work. It worked well, so I thought &#8220;Why not publish sources on GitHub?&#8221;. After a few cycles, it looked ok, so I though I will push is to Google App Engine.

And,  the nightmare began. I added following plugin and dependency in 

<pre class="lang:sh decode:1 inline:1 " >pom.xml</pre>

  based on official documentation.

<pre class="lang:xhtml decode:true" title="App Engie SDK Dependency">&lt;dependency&gt;
	&lt;groupId&gt;com.google.appengine&lt;/groupId&gt;
	&lt;artifactId&gt;appengine-api-1.0-sdk&lt;/artifactId&gt;
	&lt;version&gt;1.8.8&lt;/version&gt;
&lt;/dependency&gt;</pre>

<pre class="lang:xhtml decode:true" title="App Engine Maven Plugin">&lt;plugin&gt;
	&lt;groupId&gt;com.google.appengine&lt;/groupId&gt;
	&lt;artifactId&gt;appengine-maven-plugin&lt;/artifactId&gt;
	&lt;version&gt;1.8.8&lt;/version&gt;
&lt;/plugin&gt;</pre>

Just to be safe, I downloaded latest GAE SDK (1.8.8), Eclipse Plugin, etc. As per documentation, I tried to start dev server with following command:

<pre class="lang:sh decode:true" title="Fire up local server">mvn appengine:devserver_start</pre>

After a long list of downloads, build failed. Bang! The trouble started. Got this:

<pre class="lang:sh decode:true" title="GAE Maven Failure">[INFO] &lt;&lt;&lt; appengine-maven-plugin:1.8.8:devserver_start (default-cli) @ java-servlet &lt;&lt;&lt;
[INFO] 
[INFO] --- appengine-maven-plugin:1.8.8:devserver_start (default-cli) @ java-servlet ---
[INFO] 
[INFO] Google App Engine Java SDK - Starting the Development Server
[INFO] 
[INFO] Retrieving Google App Engine Java SDK from Maven
Downloading: http://repo.maven.apache.org/maven2/com/google/appengine/appengine-java-sdk/1.8.8/appengine-java-sdk-1.8.8.zip
[INFO] ------------------------------------------------------------------------
[INFO] BUILD FAILURE
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1:05.713s
[INFO] Finished at: Sat Jan 04 01:05:29 SGT 2014
[INFO] Final Memory: 17M/227M
[INFO] ------------------------------------------------------------------------
[ERROR] Failed to execute goal com.google.appengine:appengine-maven-plugin:1.8.8:devserver_start (default-cli) on project java-servlet: Could not resolve SDK artifact in Maven. Could not transfer artifact com.google.appengine:appengine-java-sdk:zip:1.8.8 from/to central (http://repo.maven.apache.org/maven2): Failed to transfer file: http://repo.maven.apache.org/maven2/com/google/appengine/appengine-java-sdk/1.8.8/appengine-java-sdk-1.8.8.zip. Return code is: 503 , ReasonPhrase:backend read error. -&gt; [Help 1]
[ERROR] 
[ERROR] To see the full stack trace of the errors, re-run Maven with the -e switch.
[ERROR] Re-run Maven using the -X switch to enable full debug logging.
[ERROR] 
[ERROR] For more information about the errors and possible solutions, please read the following articles:
[ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoExecutionException</pre>

This was unusual. So I tried again. Its maven central server not an &#8220;under-the-desk-server&#8221;. But same no change. I tried to download zip manually, just to be sure that artifact is indeed there. Damn it! I got same error, just a little more fancy looking though!

<img alt="Google App Engine : Maven SDK Download Error" src="http://www.yogendra.me/wp-content/uploads/2014/01/gae-sdk-mave-503-error-1024x454.png" width="688" height="305" />

In directory index ([here][2]), I saw that this file was a large (150+MB). So, now what? I did deploy the application after testing on Tomcat 7. I used simple appcfg.sh command.

<pre class="lang:sh decode:true" title="Temporary Solution">mvn tomcat7:run
...
...
appcfg.sh update target/java-servlet</pre>

But, this was not a &#8220;cool&#8221; way. Maven is my project management tool, and I should use it as much as possible.

##  Accident to Revival

After googling, reading, googling, reading and googling, I stumbled upon an [old blog][3] that added 1.2 version of SDK to maven using 

<pre class="lang:sh decode:1 inline:1 " >install:install-file</pre>

  goal. Eureka! Why not do this with SDK zip? Thats it. Here are the commands

## Solution {#gae_solution}

Install SDK zip via following command.

<pre class="lang:sh decode:true">mvn install:install-file -Dfile=appengine-java-sdk-1.8.8.zip -DgroupId=com.google.appengine -DartifactId=appenging-java-sdk -Dversion=1.8.8 -Dpackaging=zip -DgeneratePom=true</pre>

Optional JAR install

<pre class="lang:sh decode:true">mvn install:install-file -Dfile=appengine-java-sdk-1.8.8/lib/appengine-tools-api.jar -DgroupId=com.google -DartifactId=appengine-tools -Dversion=1.8.8 -Dpackaging=jar -DgeneratePom=true

mvn install:install-file -Dfile=appengine-java-sdk-1.8.8/lib/shared/appengine-local-runtime-shared.jar -DgroupId=com.google -DartifactId=appengine-local-runtime-shared -Dversion=1.8.8 -Dpackaging=jar -DgeneratePom=true

mvn install:install-file -Dfile=appengine-java-sdk-1.8.8/lib/user/appengine-api-1.0-sdk-1.8.8.jar -DgroupId=com.google -DartifactId=appengine-sdk-1.8.8-api -Dversion=1.8.8 -Dpackaging=jar -DgeneratePom=true

mvn install:install-file -Dfile=appengine-java-sdk-1.8.8/lib/user/orm/datanucleus-appengine-1.0.10.final.jar -DgroupId=org.datanucleus -DartifactId=datanucleus-appengine -Dversion=1.0.10.final -Dpackaging=jar -DgeneratePom=true</pre>

&nbsp;

Project :   <a href="http://github.com/yogendra/java-servlet" target="_blank">Source</a> | <a href="http://java-servlet.yogendra.me" target="_blank">Live</a>

Google App Engine: <a href="https://developers.google.com/appengine/docs/java/tools/maven" target="_blank">Maven</a> | [Dowloads][4]

&nbsp;

 [1]: #gae_solution
 [2]: http://repo.maven.apache.org/maven2/com/google/appengine/appengine-java-sdk/1.8.8
 [3]: http://shal.in/post/285908979/google-app-engine-and-maven
 [4]: https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_Java