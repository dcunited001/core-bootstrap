## Core Bootstrap

This is a project that contains the files necessary to get a cluster of CoreOS machines up and running.

It should accomplish the following:
 
- Set up the cloud-config file in a config-2 partition for CoreOS, which will initiate discovery when nodes are rebooted.
- Resolve discovery for an etcd cluster of 3 nodes: `core`, `db-core` and `work-core`.
- Configure the `db-core` node to run the `paintedfox/postgres` and `dockerfile/redis` images.
- Configure the `work-core` node to run workers for the `centurylink/gitlab` image.
- Configure the `core` node to run the `centurylink/gitlab` image, which is linked to images running on the other nodes.
- Configure the `core` node to also run the `jineh/znc` image, which is an IRC Bouncer.

Refer to [my blog post]() for a step by step guide on using this repository.
