# CA APM Example for Tomcat in Docker

## Description
This example shows how to install a CA APM Java agent in a Tomcat [Docker](http://www.docker.com/) container along with your application.

## APM version
APM 10.2

## Supported third party versions
Tested with Docker 1.8.2 and 1.9.1.

## License
[Apache 2.0 License](LICENSE)


# Installation Instructions

## Prerequisites
### Digital Experience Insight (DXI)
* Install [Docker](http://www.docker.com/) .
* Download the Tomcat agent from CA DXI APM: click on *Download Agent* in the blue bar at the top of the page and select *Tomcat*. Copy `Tomcat_v1.tar` to the Docker build directory.

### CA APM On-premise
* Install [Docker](http://www.docker.com/) .
* Download `IntroscopeAgentFiles-NoInstaller<version>tomcat.unix.tar` from the [CA Download Center](http://support.ca.com) and copy it to the Docker build directory.

## Dependencies
None.

## Configuration
* In [Dockerfile](Dockerfile) replace `mytomcatapplication` with your application image.
* If you already have a `setenv.sh` script in your container merge the supplied script with your existing `setenv.sh`.
* Optional: set the environment variable `AGENT_HOSTNAME` to a persistent hostname (e.g. the container name) that will be used instead of the container id for identifying the CA APM agent. You can also set the `AGENT_NAME` directly in the Dockerfile when you build the image, from the command line when you start the container or a config file for e.g. [Docker Compose](http://www.docker.com/products/docker-compose).


### For On-premise APM Only
* In the Dockerfile set the environment variables `INTROSCOPE_VERSION` to the the version of the Introscope Agent that you downloaded.
* Optional: set the environment variables `EM_HOST`, `EM_PORT` to point to your CA APM Enterprise Manager. You can do this directly in the Dockerfile when you build the image, from the command line when you start the container or a config file for e.g. [Docker Compose](http://www.docker.com/products/docker-compose).

## Creating the Docker image
* For on-premise APM: run `[sudo] docker build -t <image name>`
* For DXI: run `[sudo] docker build -f Dockerfile-dxi -t <image name>`

## Starting a Docker container
Run `[sudo] docker run [options] <image name>` or start the container via the tool of your choice.

## Debugging and Troubleshooting
Take a look at the output of the docker build command and the log files inside the container. Connect to the container in interactive mode and run the commands from the Dockerfile manually.

## Support
This document and associated tools are made available from CA Technologies as examples and provided at no charge as a courtesy to the CA APM Community at large. This resource may require modification for use in your environment. However, please note that this resource is not supported by CA Technologies, and inclusion in this site should not be construed to be an endorsement or recommendation by CA Technologies. These utilities are not covered by the CA Technologies software license agreement and there is no explicit or implied warranty from CA Technologies. They can be used and distributed freely amongst the CA APM Community, but not sold. As such, they are unsupported software, provided as is without warranty of any kind, express or implied, including but not limited to warranties of merchantability and fitness for a particular purpose. CA Technologies does not warrant that this resource will meet your requirements or that the operation of the resource will be uninterrupted or error free or that any defects will be corrected. The use of this resource implies that you understand and agree to the terms listed herein.

Although these utilities are unsupported, please let us know if you have any problems or questions by adding a comment to the CA APM Community Site area where the resource is located, so that the Author(s) may attempt to address the issue or question.

Unless explicitly stated otherwise this extension is only supported on the same platforms as the APM core agent. See [APM Compatibility Guide](http://www.ca.com/us/support/ca-support-online/product-content/status/compatibility-matrix/application-performance-management-compatibility-guide.aspx).


# Change log
Changes for each version of the extension.

Version | Author | Comment
--------|--------|--------
1.0 | Guenter Grossberger | First version of the example.
1.1 | Guenter Grossberger | build from application image, add browser agent switch
1.2 | Guenter Grossberger | added instructions for DXI

## Support URL
https://github.com/CA-APM/ca-apm-example-docker-tomcat/issues

## Short Description
This example shows how to install a CA APM Java agent to Tomcat on Docker.

## Categories
Examples, Cloud, Virtualization/Containers
