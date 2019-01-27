#!/bin/bash

# Convert environment variables in the conf to fixed entries
# http://stackoverflow.com/questions/21056450/how-to-inject-environment-variables-in-varnish-configuration
varnishd -f /etc/varnish/default.vcl
varnishlog