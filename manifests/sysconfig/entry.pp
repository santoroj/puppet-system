# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   system::sysconfig::entry { 'namevar': }
#
define system::sysconfig::entry (
  $file,
  $var,
  $val,
  $nudge = [],
) {
  if $val {
    augeas { "system-sysconfig-${file}-${var}":
      context  => "/files/etc/sysconfig/${file}",
      changes  => "set ${var} \"${val}\"",
      notify   => $nudge,
      schedule => $schedule,
    }
  }
}
