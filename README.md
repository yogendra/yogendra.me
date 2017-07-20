# Yogendra.Me - Web Site

[![Build Status](https://travis-ci.org/yogendra/yogendra.me.svg?branch=master)](https://travis-ci.org/yogendra/yogendra.me)

This is my personal website. I am using a simple static site generator to 
maintain it. 

## How to Contribute?

Simple F-C-PR

* You can **fork** this repository
* Make **changes** and test
* Raise **pull request**

## How to build or check changes?

You need to have [hugo](https://gohugo.io/) and a text editor installed.

```shell
git clone git@github.com:yogendra/yogendra.me.git
cd yogendra.me
git submodule update --init --recursive
hugo server -s site -wDEF -b http://localhost:1313 --navigateToChanged --cleanDestinationDir -d dev
```

Navigate to http://localhost:1313


##  FAQ
### Why are you using public git repository?/Static Sites repo for Website?

To get feedback. I want feedback on my work, posts, etc. And I want to provide a
simple/familier way for everyone to do so.

### Why not use Blogger?
I like Blogger. Its great. Frill free. But I want to be able to play around with
with javascript libraries (Just for fun!).

### Why not use WP/Drupal?
Simple stack (only need webserver) and easy maintainance. I have used WP/Drupal
and they are great. Keeping up with version (core/plugin/theme) can be time
consuming. And they have a bit of learning curve. I have limited time.
