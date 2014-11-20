pt-graphite Cookbook
====================

This cookbook installs and configures Graphite on Ubuntu using system packages.

Requirements
------------

### Chef

* Chef 11.16.4
* Ohai 7.4.0

**Notes**: This cookbook has been tested on the listed Chef & Ohai versions. It may work on other versions with or without modifications.

### Platform

* Ubuntu 14.04

**Notes**: This cookbook has been tested on the listed platform. It may work on other versions of Ubuntu with or without modifications.

### Cookbooks

* apache2 `>= 2.0`

Attributes
----------

#### graphite

* `node['graphite']['version']` - The version of the graphite-carbon package we will install. Default is `0.9.12-3`.
* `node['graphite']['enable']` - Whether the carbon service should be enabled or not. Default is `true`. If `false`, carbon services will be stopped and disabled.
* `node['graphite']['cache']['enable_logrotation']` - Whether carbon-cache's daily log rotation should be enabled. Default is `true`.
* `node['graphite']['cache']['line_receiver_interface']` - The interface carbon-cache line receiver listens on. Default is `127.0.0.1`.
* `node['graphite']['cache']['pickle_receiver_interface']`- The interface carbon-cache pickle receiver listens on. Default is `127.0.0.1`.
* `node['graphite']['cache']['cache_query_interface']` - The interface carbon-cache query listens on. Default is `127.0.0.1`.
* `node['graphite']['relay']['line_receiver_interface']` - The interface carbon-relay line receiver listens on. Default is `127.0.0.1`.
* `node['graphite']['relay']['pickle_receiver_interface']` - The interface carbon-relay pickle receiver listens on. Default is `127.0.0.1`.
* `node['graphite']['aggregator']['line_receiver_interface']` - The interface carbon-aggregator line receiver listens on. Default is `127.0.0.1`.
* `node['graphite']['aggregator']['pickle_receiver_interface']` - The interface carbon-aggregator pickle receiver listens on. Default is `127.0.0.1`.
* `node['graphite']['storage_schemas']` - The schemas we configure for carbon-cache. The default is as follows:

```ruby
default['graphite']['storage_schemas'] = {
  'carbon' => {
    'pattern'    => '^carbon\.',
    'retentions' => '60:90d'
  },
  'default_1min_for_1day' => {
    'pattern'    => '.*',
    'retentions' => '60s:1d'
  }
}
```

* `node['graphite']['storage_aggregations']` - The aggregation rules we configure for carbon-aggregator. The default is as follows:

```ruby
default['graphite']['storage_aggregations'] = {
  'min' => {
    'pattern'           => '\.min$',
    'xFilesFactor'      => '0.1',
    'aggregationMethod' => 'min'
  },
  'max' => {
    'pattern'           => '\.max$',
    'xFilesFactor'      => '0.1',
    'aggregationMethod' => 'max'
  },
  'sum' => {
    'pattern'           => '\.count$',
    'xFilesFactor'      => '0',
    'aggregationMethod' => 'sum'
  },
  'default_average' => {
    'pattern'           => '.*',
    'xFilesFactor'      => '0.5',
    'aggregationMethod' => 'average'
  }
}
```

#### graphite_web

* `node['graphite']['web']['version']` - The version of the graphite-web package we will install. Default is `0.9.12+debian-3`.
* `node['graphite']['web']['secret_key']` - Django's secret key. You can read more about it [here](https://docs.djangoproject.com/en/dev/ref/settings/#secret-key). Default is `REPLACE_ME`.
* `node['graphite']['web']['time_zone']` - The time zone used in Graphite Web. Default is `America/Los_Angeles`.

Contributing
------------

1. Fork the repository on GitHub
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Submit a Pull Request using GitHub

Authors
-------------------

Author:: Lee Huffman lee@propertreefacilities.com
