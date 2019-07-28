# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   system::network::route { 'namevar': }
#
define system::network::route (
  String[1] $interface,
  Stdlib::IP::Address $via,
) {
  $to = $title
  assert_type(String[1], $to)
  concat::fragment { "route-${interface}-${to}":
    target  => "/etc/sysconfig/network-scripts/route-${interface}",
    content => template('system/network/route.erb'),
  }
}
