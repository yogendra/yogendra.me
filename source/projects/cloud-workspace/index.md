---
title: Cloud Workspace
date: 2019-12-19 14:55:33
slug: cloud-workspace
---

# Why?

I run a lot of workshops as part of my full time job. These workshops can range from simple demos to full hands-on lab. Demos are relatively easier bit as I can control a lot of the environment. I mostly run these from my machine and connect to some cloud resource, etc. But Hands on lab can get very tricky. I have run into serveral problems:

- Enterprise Proxy

  This is the worst of all. I have worked in corporate environment long enough to identify a proxy problem quickly. But solving it for each participant, everytime, is time consuming.

- Lack of Permissions

  Another corporate policy driven time waster. Engineers can't download or install tools, change environment variables, etc. I understand the need (Legal/Security/Compliance) but still I am sure that there is a better way to solve this.

- Its Window

  Say bye to all the bash or shell commands that you may have written in the instructions. Some tools don't have a windows equivalent. Especially one-liners are tough to translate from bash to cmd/powershell.

I can go on with this list, but you get the picture.

So I tought wouldn't it be nice to have some more control on the lab environment. Kind of run it all in cloud and access from browser. I have explored few things:

- Amazon Workspace

  This is greate but kind of chasing fly with a bazooka. I also lack the skills to autmate stuff on windows at scale. And its expensive. Thick client is also a bit of a tough one.

- Cloud based IDE/Workspace (Codeanywhere)

  This is something I have tried. Its a good quick solution. But need get subscription and licensing can be a bit tricky

- Google Cloud Console

  This is a good option and I have tried it. It worked flawlessly. But requires participant to signup, which is not a bad thing. This gave me all the right set of ideas.

After going through all these things and then some, I thought of looking at building one with some opensource IDE.

Basically, I want

- Has a terminal
- Has a test editor
- Runs in browser
- Create many independent instances quickly
- Docker/K8s

# What?

[Thiea IDE][thiea-home] is an opensource IDE from Eclipse foundation. It fits my need almost on all accounts. After trying other "online IDEs", I stumbled upon this. So I created a docker image that has all the neccessary tooling with thiea and deployed it on kubernetes. At first glance, it looks like VS Code in a browser.

![][thiea-workspace]

# How do I use it?

# How do develop / contribute?

[thiea-home]: https://theia-ide.org/
[thiea-workspace]: https://theia-ide.org/static/theia-screenshot-5da315784b70a935f8196407284cbe1e.jpg
