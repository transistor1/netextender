## Dockerized NetExtender ##

This is a dockerized version of NetExtender, v 7.5.773

The remmina subdirectory combines NetExtender with Remmina, allowing a NetExtender connection with an RDP client.

**Note**: Please be aware that this build makes use of the --privileged flag in Docker, which allows access to system devices.

### Usage 

To run only NetExtender:

    sudo docker run transistor1/netextender config | bash

The VPN connection is limited to the docker container, so in order to do anything useful you'll have to log into the container using exec.

To run NetExtender with Remmina:

    sudo docker run transistor1/remmina config | bash

This build brings up NetExtender and Remmina.


