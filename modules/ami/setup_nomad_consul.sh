#!/bin/sh
set -e

# Environment variables are set by packer
/tmp/install-nomad/install-nomad --version "${NOMAD_VERSION}"

# FIXME: This is so ugly! Why not catching the binaries directly?
git clone --branch "${CONSUL_MODULE_VERSION}"  https://github.com/hashicorp/terraform-aws-consul.git /tmp/terraform-aws-consul
/tmp/terraform-aws-consul/modules/install-consul/install-consul --version "${CONSUL_VERSION}"