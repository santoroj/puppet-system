# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::network::service
#
class system::network::service {
  service { 'network':
    ensure => 'running',
    enable => true,
  }
}
