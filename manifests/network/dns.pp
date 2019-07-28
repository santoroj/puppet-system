# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::network::dns
#
class system::network::dns (
  Optional[Hash] $config = undef,
) {
  if $config {
    assert_type(Hash, $config)
    $_config = $config
  }
  else {
    $_config = hiera_hash('system::network::dns', undef)
  }
  if $_config {
    $domains     = $_config['domains']
    $nameservers = $_config['nameservers']
    $options     = $_config['options']
    assert_type(Array, $domains)
    assert_type(Array, $nameservers)
    assert_types(Array, $options)

    file { '/etc/resolv.conf':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('system/network/dns.erb'),
    }
  }
}
#system::network::dns:
#  nameservers: [ '10.7.96.2'  ]
#  domains:     [ 'domain.com' ]
