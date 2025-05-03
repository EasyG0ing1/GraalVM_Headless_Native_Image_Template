## Linux and MacOS GraalVM Build Environment

The process for both operating systems is identical except for the last step.

First, install SDK Man

```bash
curl -s "https://get.sdkman.io" | bash
```

After it installs, it will give you a command to copy and paste into terminal that will source the config, or simply restart your terminal session.

Next, install GraalVM v25 and Maven version 4.0.0-rc-3

```bash
sdk install java 25.ea.20-graal
sdk install maven 4.0.0-rc-3
```

SDKMan will download and install the JDK and Maven into folders that it manages so that all you need to do if you want to switch SDKs or Maven versions is:

```bash
sdk use java 25.ea.20-graal
sdk use maven 4.0.0-rc-3
```

It handles all the environment variables for you.

Next, run

```shell
mvn --version
```
Output will look similar to this:

```bash
Apache Maven 4.0.0-rc-3 (3952d00ce65df6753b63a51e86b1f626c55a8df2)
Maven home: /Users/michael/.sdkman/candidates/maven/4.0.0-rc-3
Java version: 25, vendor: Oracle Corporation, runtime: /Users/michael/.sdkman/candidates/java/25.ea.20-graal
Default locale: en_US, platform encoding: UTF-8
OS name: "mac os x", version: "15.4", arch: "x86_64", family: "mac"
```

Now, expand the text here for your operating system.

<details><summary>Linux</summary>

> Next, you need to run:
>
> ```shell
> sudo apt update
> sudo apt install build-essential libz-dev zlib1g-dev -y
> ```
>
> This won't take too long to install

</details>

<details><summary>MacOS</summary>

> If you DON'T have the xcode command line tools installed, run this command (don't run it as sudo).
>
> ```shell
> xcode-select install
> ```
>
> It will take a LOOOONG time to finish - possibly up to 20 minutes or longer. Take a break ... you deserve it!

</details>

Your build environment is now ready to go!


[Back to README](https://github.com/EasyG0ing1/GraalVM_Headless_Native_Image_Template)_
