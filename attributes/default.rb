#
# Graphite
#
default['graphite']['version']                                 = '0.9.12-3'
default['graphite']['enable']                                  = true
default['graphite']['cache']['enable_logrotation']             = true
default['graphite']['cache']['line_receiver_interface']        = '127.0.0.1'
default['graphite']['cache']['pickle_receiver_interface']      = '127.0.0.1'
default['graphite']['cache']['cache_query_interface']          = '127.0.0.1'
default['graphite']['relay']['line_receiver_interface']        = '127.0.0.1'
default['graphite']['relay']['pickle_receiver_interface']      = '127.0.0.1'
default['graphite']['aggregator']['line_receiver_interface']   = '127.0.0.1'
default['graphite']['aggregator']['pickle_receiver_interface'] = '127.0.0.1'

#
# Graphite Web
#
default['graphite']['web']['version']    = '0.9.12+debian-3'
default['graphite']['web']['secret_key'] = 'REPLACE_ME'
default['graphite']['web']['time_zone']  = 'America/Los_Angeles'

#
# Storage Schemas
#
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

#
# Storage Aggregation
#
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
