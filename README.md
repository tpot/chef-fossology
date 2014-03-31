# fossology-cookbook

This cookbook installs and configures the
[FOSSology](http://fossology.org) open source analysis tool.
FOSSology describes its mission

>  ... to build a community to facilitate the study of Free and Open Source
>  Software by providing free and open source data analysis tools.

Single-server and multi-node configurations are supported by this cookbook.

## Supported Platforms

FOSSology itself supports the following distributions:

* Debian
* RHEL
* Ubuntu
* Fedora

However the cookbook only supports the Ubuntu distribution at this time.

## Attributes

The following attributes are supported by the cookbook:

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['fossology']['server']</tt></td>
    <td>Hash</td>
    <td>Attributes of server node</td>
    <td><tt>{"name" => "localhost, "max_jobs" => 10}</tt></td>
  </tr>
  <tr>
    <td><tt>['fossology']['ssh_public_key']</tt></td>
    <td>String</td>
    <td>Public key for FOSSology user</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>['fossology']['ssh_private_key']</tt></td>
    <td>String</td>
    <td>Private key for FOSSology user</td>
    <td><tt>nil</tt></td>
  </tr>
</table>

## Data bags

### `fossology_hosts`

This data bag defines the attributes of agent nodes, or "hosts" in the
parlance of FOSSology configuration.  Each data bag entry declares the
DNS name or IP address of the host, and the maximum number of jobs
supported by that host.

For example:

```
{
    "id": "10-0-0-2",
    "name": "10.0.0.2",
    "max_jobs: 10
}
```

The FOSSology scheduler automatically disables hosts that are
unreachable so it's possible to define a range of hosts that don't
necessarily exist currently.  The scheduler will enable or disable
these hosts appropriately as they are created or destroyed.

## Usage

### fossology::server

Including this recipe in a node's run list installs and configures the
node to act as a FOSSology server.  At present the server node
includes the front-end web server, NFS file server for storing and a 10 job host.

Incoming TCP connections must be allowed for the following ports:

* HTTP (port 80)
* NFS (ports 32765 - 32768)
* PostgreSQL (port 5432)

### fossology::agent

This recipe installs and configures a worker node that performs jobs
at the behest of the FOSSology scheduler.  Note that this recipe is
not necessary under a single-node configuration as the single node
includes a 10 job agent by default.

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Tim Potter (<tpot@hp.com>)
