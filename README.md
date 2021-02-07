# Java Docker Images
Java docker images using [Azul's Zulu OpenJDK](https://www.azul.com/downloads/zulu-community).

## Supported Tags

**NOTE**: Timestamped tags are **NOT** maintained.

#### Release
* `jdk-11`, `jdk-11-debian`, `jdk-11-debian-10`, `jdk-11-buster`
* `jdk-11-ubuntu`, `jdk-11-ubuntu-20.04`, `jdk-11-focal`
* `jdk-11u10`, `jdk-11u10-debian`, `jdk-11u10-debian-10`, `jdk-11u10-buster`
* `jdk-11u10-ubuntu`, `jdk-11u10-ubuntu-20.04`, `jdk-11u10-focal`
* `jdk-11-yyyymmdd`, `jdk-11-debian-yyyymmdd`, `jdk-11-debian-10-yyyymmdd`, `jdk-11-buster-yyyymmdd`
* `jdk-11-ubuntu-yyyymmdd`, `jdk-11-ubuntu-20.04-yyyymmdd`, `jdk-11-focal-yyyymmdd`
* `jdk-11u10-yyyymmdd`, `jdk-11u10-debian-yyyymmdd`, `jdk-11u10-debian-10-yyyymmdd`, `jdk-11u10-buster-yyyymmdd`
* `jdk-11u10-ubuntu-yyyymmdd`, `jdk-11u10-ubuntu-20.04-yyyymmdd`, `jdk-11u10-focal-yyyymmdd`
* `jdk-11-yyyymmdd.buildNumber`, `jdk-11-debian-yyyymmdd.buildNumber`, `jdk-11-debian-10-yyyymmdd.buildNumber`, `jdk-11-buster-yyyymmdd.buildNumber`
* `jdk-11-ubuntu-yyyymmdd.buildNumber`, `jdk-11-ubuntu-20.04-yyyymmdd.buildNumber`, `jdk-11-focal-yyyymmdd.buildNumber`
* `jdk-11u10-yyyymmdd.buildNumber`, `jdk-11u10-debian-yyyymmdd.buildNumber`, `jdk-11u10-debian-10-yyyymmdd.buildNumber`, `jdk-11u10-buster-yyyymmdd.buildNumber`
* `jdk-11u10-ubuntu-yyyymmdd.buildNumber`, `jdk-11u10-ubuntu-20.04-yyyymmdd.buildNumber`, `jdk-11u10-focal-yyyymmdd.buildNumber`

#### Development

**NOTE**: Do **NOT** use in a production environment. `-SNAPSHOT` tags indicate development artifacts from builds of the main branch.

* `jdk-11-SNAPSHOT`, `jdk-11-debian-SNAPSHOT`, `jdk-11-debian-10-SNAPSHOT`, `jdk-11-buster-SNAPSHOT`
* `jdk-11-ubuntu-SNAPSHOT`, `jdk-11-ubuntu-20.04-SNAPSHOT`, `jdk-11-focal-SNAPSHOT`
* `jdk-11u10-SNAPSHOT`, `jdk-11u10-debian-SNAPSHOT`, `jdk-11u10-debian-10-SNAPSHOT`, `jdk-11u10-buster-SNAPSHOT`
* `jdk-11u10-ubuntu-SNAPSHOT`, `jdk-11u10-ubuntu-20.04-SNAPSHOT`, `jdk-11u10-focal-SNAPSHOT`
* `jdk-11-SNAPSHOT-yyyymmdd`, `jdk-11-debian-SNAPSHOT-yyyymmdd`, `jdk-11-debian-10-SNAPSHOT-yyyymmdd`, `jdk-11-buster-SNAPSHOT-yyyymmdd`
* `jdk-11-ubuntu-SNAPSHOT-yyyymmdd`, `jdk-11-ubuntu-20.04-SNAPSHOT-yyyymmdd`, `jdk-11-focal-SNAPSHOT-yyyymmdd`
* `jdk-11u10-SNAPSHOT-yyyymmdd`, `jdk-11u10-debian-SNAPSHOT-yyyymmdd`, `jdk-11u10-debian-10-SNAPSHOT-yyyymmdd`, `jdk-11u10-buster-SNAPSHOT-yyyymmdd`
* `jdk-11u10-ubuntu-SNAPSHOT-yyyymmdd`, `jdk-11u10-ubuntu-20.04-SNAPSHOT-yyyymmdd`, `jdk-11u10-focal-SNAPSHOT-yyyymmdd`
* `jdk-11-SNAPSHOT-yyyymmdd.buildNumber`, `jdk-11-debian-SNAPSHOT-yyyymmdd.buildNumber`, `jdk-11-debian-10-SNAPSHOT-yyyymmdd.buildNumber`, `jdk-11-buster-SNAPSHOT-yyyymmdd.buildNumber`
* `jdk-11-ubuntu-SNAPSHOT-yyyymmdd.buildNumber`, `jdk-11-ubuntu-20.04-SNAPSHOT-yyyymmdd.buildNumber`, `jdk-11-focal-SNAPSHOT-yyyymmdd.buildNumber`
* `jdk-11u10-SNAPSHOT-yyyymmdd.buildNumber`, `jdk-11u10-debian-SNAPSHOT-yyyymmdd.buildNumber`, `jdk-11u10-debian-10-SNAPSHOT-yyyymmdd.buildNumber`, `jdk-11u10-buster-SNAPSHOT-yyyymmdd.buildNumber`
* `jdk-11u10-ubuntu-SNAPSHOT-yyyymmdd.buildNumber`, `jdk-11u10-ubuntu-20.04-SNAPSHOT-yyyymmdd.buildNumber`, `jdk-11u10-focal-SNAPSHOT-yyyymmdd.buildNumber`

## Environment variables
There are several environment variables available to tweak the behaviour. While none of the variables are required, they may significantly aid you in using these images.
The variables are read by an init script which further appends them to JAVA_OPTS.

Environment variables:

| Variable                         |  Default  | Java variable |
| -------------------------------- | --------- | ------------- |
| JAVA_XMS                         |           | -Xmx          |
| JAVA_XMX                         |           | -Xms          |
| DEBUG                            | false     | -Xdebug <br> -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n |
| JMX_ENABLED                      | false     | -Dcom.sun.management.jmxremote.authenticate=false <br> -Dcom.sun.management.jmxremote.local.only=false<br>-Dcom.sun.management.jmxremote.ssl=false <br> -Dcom.sun.management.jmxremote <br> -Dcom.sun.management.jmxremote.rmi.port=5000 <br> -Dcom.sun.management.jmxremote.port=5000 <br> -Djava.rmi.server.hostname=$JMX_RMI_HOST |
| JMX_RMI_HOST                     | 0.0.0.0   |               |
| JAVA_OPTS_\<variable\>=\<value\> | \<value\> | \<variable\>  |

## Quick reference
**Supported Architectures:**
* linux-x64

## Environment Variables
The `docker.io/koenvangeerteruy/openjdk` image supports the following environment variables:
### JAVA_OPTS_xxx
This image iterates over all environment variables that start with `JAVA_OPTS_` and collects them into the environment variable `JAVA_OPTS` when the container is started. This `JAVA_OPTS` variable can be used to pass JVM arguments to the _java_ process.

The environment variable should have the format `JAVA_OPTS_xxx="-Dkey=value"`, where the key `xxx` is ignored.

_Note:_ This ignored key can be useful, when you want to override a particular JVM argument when using multiple _docker-compose.yml_ files or _docker-compose.override.yml_. See the [Docker Compose documentation](https://docs.docker.com/compose/extends/#example-use-case) for more information.

## Image variants
The `openjdk` images come in a few flavors, where the variants use the following tag-structure:
```
openjdk:<type>-<version>-<os>
```
There are permutations possible of three parameters in this project.

* **Type**: the Java distribution type, one of `jdk`, `jre`.
* **Version**: the Java version, for example `11` or `11u9.1`
* **OS**: the Operating system, for example `debian` ,`debian-10` or `buster`

Please file an issue if you need a different combination of parameters.

### Java versions
In general, the latest update of the LTS-releases of different Java major versions, are maintained:

* jdk-11
    - `jdk-11-debian`
    - `jdk-11-ubuntu`

**NOTE**: the Java _update_ (=minor version) is **NOT** maintained.
For example: the current Debian JDK 11 image is tagged with `jdk-11-debian-10` and has the additional tag `jdk-11u10-debian-10` to indicate the Java 11 _update_ version. 
Once the next update gets published the image tagged `jdk-11-debian-10` will be updated, but `jdk-11u10-debian-10` will no longer be supported and will not receive OS or Java security patches.

### Operating Systems
*  Debian 10 - `debian:buster`
*  Ubuntu 20.04 LTS - `ubuntu:focal`

## Initialization
This image uses Docker `ENTRYPOINT` to provide initialization hooks.

If you would like to do additional initialization in an image derived from this one, add one or more `*.sh` scripts under `/docker-entrypoint.d/`. The scripts are _source_'d and do not need to be executable. This means these scripts run within the existing shell, any variables created or modified by the script will remain available after the script completes. These initialization scripts will be executed in sorted name order as defined by the current locale.

After initialization completes, the main `CMD` will be _exec_'ed, to avoid starting the main process in a subshell.

You can override or disable the initialization scripts by overriding the `ENTRYPOINT` instruction using the `docker run --entrypoint` flag.

## Contributions
### How to build
To build a local version of the java image:
```
./gradlew buildDockerImage
```

## FAQ
### How do I access the Java debug port?
Set the environment variable `DEBUG=true`. The debug port is `8000`.

### How do I enable JMX?
Set the environment variable `JMX_ENABLED=true`. The JMX port is `5000`.
