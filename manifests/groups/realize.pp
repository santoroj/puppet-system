# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::groups::realize
#
class system::groups::realize (
  $groups   = undef,
  $sys_schedule = 'always',
) {
  if $groups {
    realize(Group[$groups])
  }
  else {
    $hiera_groups = hiera_array('system::groups::realize', undef)
    if $hiera_groups {
      realize(Group[$hiera_groups])
    }
  }
}
