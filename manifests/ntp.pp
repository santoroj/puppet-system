# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::ntp
#   
class system::ntp (
  $config   = undef,
  $sys_schedule = 'always',
) {
  if $config {
    if $config['servers'] {
      class { 'ntp':
        servers => $config['servers'],
        iburst  => $config['iburst'],
      }
    }
    elsif $config['country'] {
      class { 'ntp':
        country => $config['country'],
        iburst  => $config['iburst'],
      }
    }
    elsif $config['continent'] {
      class { 'ntp':
        continent => $config['continent'],
        iburst    => $config['iburst'],
      }
    }
    else {
      class { 'ntp': }
    }
  }
  else {
    $servers   = hiera('system::ntp::servers',   undef)
    $country   = hiera('system::ntp::country',   undef)
    $continent = hiera('system::ntp::continent', undef)
    $iburst    = hiera('system::ntp::iburst',    true)
    if $servers {
      class { 'ntp':
        servers => $servers,
        iburst  => $iburst,
      }
    }
    elsif $country {
      class { 'ntp':
        country => $country,
        iburst  => $iburst,
      }
    }
    elsif $continent {
      class { 'ntp':
        continent => $continent,
        iburst    => $iburst,
      }
    }
    else {
      include 'ntp'
    }
  }
}
