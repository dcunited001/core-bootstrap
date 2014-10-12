## Core Bootstrap

This is a project that contains the files necessary to get a cluster of CoreOS machines up and running on Digital Ocean.

Originally, I wanted this to be a script that automated the following.  However, I've since
decided to just make it create droplets on Digital Ocean and I'll set up the SystemD stuff later.
 
- Set up the cloud-config file in a config-2 partition for CoreOS, which will initiate discovery when nodes are rebooted.
- Resolve discovery for an etcd cluster of 3 nodes: `core`, `db-core` and `work-core`.
- Configure the `db-core` node to run the `paintedfox/postgres` and `dockerfile/redis` images.
- Configure the `work-core` node to run workers for the `centurylink/gitlab` image.
- Configure the `core` node to run the `centurylink/gitlab` image, which is linked to images running on the other nodes.
- Configure the `core` node to also run the `jineh/znc` image, which is an IRC Bouncer.

Refer to [my blog post](http://te.xel.io) (not written yet) for a step by step guide on using this repository.

## Creating a CoreOS node with the Digital Ocean API

1. Generate a new token on the Digital Ocean API
1. Find your SSH key id using the digital ocean API by running this command:
  - `env TOKEN=[TOKEN] curl -X GET "https://api.digitalocean.com/v2/account/keys" -H "Authorization: Bearer $TOKEN"`
1. If this is a new cluster, generate a new cluster discovery url [here](https://discovery.etcd.io/new).
1. Copy `coreos_cluster.yml` from `coreos_cluster.sample.yml`
  - And populate it with the token, ssh key id and discovery url you found.
1. Copy `coreos_nodes.sample.yml` and set it up
  - The bare minimum keys are supplied in the sample.
1. Run `COREOS_NODE=[node name] bundle exec ruby create_coreos_node.rb`
  - run the command with the COREOS_EXEC variable set and the script will run the command as well

### If for some reason the script isn't working:

Then, use it to generate the cloud-config YAML and copy this into the appropriate section of the 
DigitalOcean UI when creating your CoreOS node.

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
