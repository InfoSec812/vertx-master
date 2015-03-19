# Master Build Repository For Vert.x 3.x

## Overview

Vert.x is a complex project and as such it consists of several
components. If one wanted to download and compile all of those
components individually it could be a painful process. This
__master__ project links all of the currently working Vert.x
components as __git submodules__ and introduces a top-level 
POM file which can be used to build the entire set of components.

## Using This Repo

```bash
git clone --recursive https://github.com/InfoSec812/vertx-master.git
cd vertx-master
mvn -T4 compile package install
```

## WARNING:

This is a HUGE code base and will take a lot of time to build. 
During this time, you will likely use up all of your CPU resources.
You might be better off to start it right before going to bed!