# Signal Captcha Helper

Signal's captcha system is designed to be used in an embedded browser. This utility
provides that and the bare minimum to parse the resulting token.

## pre-compiled binary

*no need to install valac*

* [linux amd64](https://gitlab.com/api/v4/projects/27947268/jobs/artifacts/main/raw/signal-captcha-helper?job=build%3Aamd64)
* [linux arm64](https://gitlab.com/api/v4/projects/27947268/jobs/artifacts/main/raw/signal-captcha-helper?job=build%3Aarm64)

## build

*if you can't or don't want to use the pre-compiled binaries*

```
valac --pkg gtk+-3.0 --pkg webkit2gtk-4.0 signal-captcha-helper.vala
```

## use

The captcha token is output to standard out when the program completes, so you probably
want to launch this tool from the terminal so you can see the output. There are no
options (for now), so just invoke it directly.

For a captcha token to use when registering an account:

```
./signal-captcha-helper
```

for a challenge token to use to send messages:

```
./signal-captcha-helper --challenge
```
