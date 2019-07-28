# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   system::sysconfig::header { 'namevar': }
#
define system::sysconfig::header {
  $file = $title
  exec { "sysconfig-${file}-empty":
    command  => "/bin/echo > /etc/sysconfig/${file}",
    unless   => "/usr/bin/test -s /etc/sysconfig/${file}",
    schedule => $schedule,
  }
  exec { "sysconfig-${file}-header":
    command  => "/bin/sed -i '1i# Managed by puppet' /etc/sysconfig/${file}",
    unless   => "/bin/grep -w '^# Managed by puppet' /etc/sysconfig/${file}",
    require  => Exec["sysconfig-${file}-empty"],
    schedule => $schedule,
  }
}
