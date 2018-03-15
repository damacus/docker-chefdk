#!/bin/bash

docker run -v ~/repos/cookbooks/sous-chefs/sysctl/:/tmp/test-kitchen  -v /var/run/docker.sock:/var/run/docker.sock -it chef-dk
