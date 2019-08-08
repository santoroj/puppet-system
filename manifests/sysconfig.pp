# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::sysconfig
#
class system::sysconfig (
  Hash   $config       = {},
  String $sys_schedule = 'always',
) {
  class { 'system::sysconfig::clock':
    config   => $config['clock'],
    schedule => $sys_schedule,
  }

  class { 'system::sysconfig::i18n':
    config   => $config['i18n'],
    schedule => $sys_schedule,
  }

  class { 'system::sysconfig::keyboard':
    config   => $config['keyboard'],
    schedule => $sys_schedule,
  }

  class { 'system::sysconfig::puppetdashboard':
    config   => $config['puppetdashboard'],
    schedule => $sys_schedule,
  }

  class { 'system::sysconfig::puppetmaster':
    config   => $config['puppetmaster'],
    schedule => $sys_schedule,
  }

  class { 'system::sysconfig::puppet':
    config   => $config['puppet'],
    schedule => $sys_schedule,
  }

  class { 'system::sysconfig::selinux':
    config   => $config['selinux'],
    schedule => $sys_schedule,
  }
}
