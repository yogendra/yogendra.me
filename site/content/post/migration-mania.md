---
title: "Migration Mania"
date: 2017-07-20T22:13:49+08:00
draft: false
categories:
  - DevOps
  - Technology
tags:
  - "web"
  - "blog"
  - "cd/ci"
  - "git"
highlightLanguages: 
  - "bash"
  - "yaml"

---
# Migrating to Static Site Generator

I am embarking on this new journey to use [Statc Site Generator](https://www.staticgen.com/). So far, I have managed to setup:

* [Hugo](http://gohugo.io) base project
* [GitHub repository](http://www.github.com/yogendra/yogendra.me)
* [Travis CI](http://travis-ci.org/yogendra/yogendra.me) based build and deploy

I have a shared hosting service (for many years now) so I want to use that to host my site. This added some (small) challenges in my journey. I will share my experience, so far and in future, in this post. One thing that I really like is how natural I find this. After all I am a *Programmer*.

## How can you use my work?

You can fork my repository (link above) and follow the simple instruction on the `README.md` to start using. I will use my own repository for instructions here.

Before you start, get these softwares and setup correctly

* [Hugo](https://gohugo.io/getting-started/installing/)
* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Travis CI Client](https://github.com/travis-ci/travis.rb#installation)
* [Firebase CLI](https://firebase.google.com/docs/cli/)
* [autoenv](https://github.com/kennethreitz/autoenv) *(Optional but Highly Recommended)*

I use [autoenv](https://github.com/kennethreitz/autoenv) to manager per-project shell environment. It executes `.env` file in the directory when you `cd` into it. This is optional but very useful.

## Clone and Change

```bash
git clone git@github.com:yogendra/yogendra.me.git
cd yogendra.me
git submodule update --init --recursive
```

Here are some changes that you should consider:

* You should probably delete `content/*` (or not). 
* You **should** change information in `config.minimal.toml`, consider changing:
  * googleAnalytics
  * baseUrl
  * title
  * author
  * description
  * githubUsername
  * \[menu.icon\] links

## Run and Test

You can run development server using following command

```bash
hugo server --config config.minimal.toml -wDEF -b http://localhost:1313 -p 1313 --navigateToChanged --cleanDestinationDir -d dev
```

What the hell! Read instruction in  `hugo server --help` to understand what each of those switches mean. We are asking hugo to:

* --config : use `config.minimal.toml` config
* -w : watch for changes
* -D : build draft
* -E : build expired pages
* -F : build future date page, 
* -b : set base url to `http://localhost:1313`
* -p : bind to port `1313`
* --navigateToChanged : navigate browser to updated file
* --cleanDestinationDir: Delete all the files that might be there in destination dir
* -d : Destination dir to store files into

You can add your own content using command like 

```bash
hugo new post/<post-name.md>
```

When you want to prepare actual deployment, you can use following command

```bash
hugo --config config.minimal.toml -d public
```

## Configure Firebase

I recommend using [Firebase](https://firebase.google.com). Read the [hosting guide](https://firebase.google.com/docs/hosting/) and get familiar with the concept and commands.

First, login to firebase from cli. This needs to be done only once. If you have already done this for any other prohect, you can skip this step

```bash
firebase login
```

Now you need to initialize firebase setting for the project. This will run as a wizard. Follow onscreen instructions.

```bash
firebase init hosting
```

You may test your firebase configuration by deploying changes directly from your machine

```bash
firebase deploy
```

**Important:** *Choose "N" for "Configure as a single-page app (rewrite all urls to /index.html)?". Also, don't overwrite files under `public/`*

## Configure Travis CI

*Based on [Travis CI - Firebase Deployment](https://docs.travis-ci.com/user/deployment/firebase/)*

Create a new project on Travis CI website  website. Login to Travis CI via `travis` command.

```bash
travis login
```

Get a deployment token from firebase, for using in travis ci build environment. 

```bash
firebase login:ci
```

This should generate a string that looks like `1/AD7sdasdasdKJA824OvEFc1c89Xz2ilBlaBlaBla`. 
Use following command to encrypt this string and use in `.travis.yml`. 

```bash
travis encrypt "1/AD7sdasdasdKJA824OvEFc1c89Xz2ilBlaBlaBla" --add
```

Replace `deploy` key in `.travis.yml` with folowing text. Remember to change `encrpted-firebase-token` with text from last command output

```yaml
deploy:
  provider: firebase
  token:
    secure: "encrpted-firebase-token"
  on:
    branch: master
```

That's it!
