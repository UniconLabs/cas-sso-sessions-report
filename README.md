cas-sso-sessions-report
=======================

This is a web application that renders a pretty UI report of active CAS SSO sessions that it fetches from [cas-addons REST endpoint](https://github.com/Unicon/cas-addons/wiki/Active-SSO-Sessions-Report)

### Prerequisites

JDK 1.7+

### Configure, Build, and Deploy

* Create directory: `/etc/cas-sso-sessions-report`
* Copy `logback.xml` from `etc` directory of this project to `/etc/cas-sso-sessions-report`
* Run `./gradlew` (or `gradlew.bat` if on Windows) from the root directory of the project. The resulting war archive will be then available in `build/libs`. Deploy to a Servlet container of choice. Then access the app in a browser: `http(s)://<server>/cas-sso-sessions-report`

### Contributing

This is a free and open source application released under [Apache 2.0 license.](https://github.com/UniconLabs/cas-sso-sessions-report/blob/master/LICENSE.md) If you like what you see and would like to further improve the app or add features, please do not hesistate to offer pull requests.



