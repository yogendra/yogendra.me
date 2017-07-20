---
title: yogendra/trusty32 – Announcing my first vagrant box
author: Yogi
type: post
date: 2014-12-11T15:08:49+00:00
url: /2014/12/11/yogendra-trusty32/
categories:
  - DevOps
tags:
  - devops
  - vagrant

---
I have finally released my first vagrant box. Its been a long time coming, but it&#8217;s here now. How to get it?

<!--more-->Create a new vagrant project with

<pre class="lang:default decode:true">vagrant init yogendra/trusty32</pre>

<span style="text-decoration: underline;"><strong>Or</strong></span> Create/update your Vagrantfile like below, and

<pre class="lang:ruby decode:true" title="Vagrantfile"># -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "yogendra/trusty32"
end</pre>

run this

<pre class="lang:sh decode:true">vagrant up --provider vmware_fusion</pre>

That&#8217;s it.

If you are new to Vagrant, read <a href="https://docs.vagrantup.com/v2/getting-started/" target="_blank">this tutorial </a>to get started