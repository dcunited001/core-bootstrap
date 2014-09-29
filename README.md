## Core Bootstrap

This is a project that contains the files necessary to get a cluster of CoreOS machines up and running.

It should accomplish the following:
 
- Set up the cloud-config file in a config-2 partition for CoreOS, which will initiate discovery when nodes are rebooted.
- Resolve discovery for an etcd cluster of 3 nodes: `core`, `db-core` and `work-core`.
- Configure the `db-core` node to run the `paintedfox/postgres` and `dockerfile/redis` images.
- Configure the `work-core` node to run workers for the `centurylink/gitlab` image.
- Configure the `core` node to run the `centurylink/gitlab` image, which is linked to images running on the other nodes.
- Configure the `core` node to also run the `jineh/znc` image, which is an IRC Bouncer.

Refer to [my blog post]() (not written yet) for a step by step guide on using this repository.

## TODO

Add a vagrantfile
- Vagrantfile connects to D/O with API Token to create a new cluster
- Vagrantfile uses the erb template to fill out the user_data field with the box's cloud-config
- Or perhaps there's some other CoreOS-Specific Ruby utilities

## References

### CoreOS on Digital Ocean

- [Getting Started With CoreOS](https://www.digitalocean.com/community/tutorial_series/getting-started-with-coreos-2)
- [Overview of CoreOS Components](https://www.digitalocean.com/community/tutorials/an-introduction-to-coreos-system-components)
- [How to setup a CoreOS Cluster on D/O](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-coreos-cluster-on-digitalocean)

### Other Links

- [Fig2CoreOS](http://www.centurylinklabs.com/building-complex-apps-for-docker-on-coreos-and-fig/)
