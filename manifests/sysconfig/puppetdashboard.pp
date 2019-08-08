# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::sysconfig::puppetdashboard
#
class system::sysconfig::puppetdashboard (
  Hash $config   = undef,
) {
  if $config {
    $puppetdashboard = $config
  }
  else {
    $puppetdashboard = hiera_hash('system::sysconfig::puppetdashboard', undef)
  }
  if $puppetdashboard {
    system::sysconfig::header { 'puppet-dashboard':
      schedule => $schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-home':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_HOME',
      val      => $puppetdashboard['home'],
      schedule => $schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-user':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_USER',
      val      => $puppetdashboard['user'],
      schedule => $schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-ruby':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_RUBY',
      val      => $puppetdashboard['ruby'],
      schedule => $schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-environment':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_ENVIRONMENT',
      val      => $puppetdashboard['environment'],
      schedule => $schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-iface':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_IFACE',
      val      => $puppetdashboard['iface'],
      schedule => $schedule,
    }
    system::sysconfig::entry { 'puppet-dashboard-port':
      file     => 'puppet-dashboard',
      var      => 'DASHBOARD_PORT',
      val      => $puppetdashboard['port'],
      schedule => $schedule,
    }
  }
}
