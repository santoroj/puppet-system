# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::users::realize
#
class system::users::realize (
  $users    = undef,
  $sys_schedule = 'always',
) {
  if $users {
    realize(User[$users])
  }
  else {
    $hiera_users = hiera_array('system::users::realize', undef)
    if $hiera_users {
      realize(User[$hiera_users])
    }
  }
}
