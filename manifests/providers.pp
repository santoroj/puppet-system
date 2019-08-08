# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::providers
#
class system::providers (
  Hash $config   = undef,
) {
  if $config {
    $_config = $config
  }
  else {
    $_config = hiera_hash('system::providers', undef)
  }
  if $_config {
    if $config['host'] == 'augeas' {
      Host { provider => 'augeas' }
    }
    if $config['mailalias'] == 'augeas' {
      include augeasproviders
      Mailalias { provider => 'augeas' }
    }
    if $config['mounttab'] == 'augeas' {
      include augeasproviders
      Mounttab { provider => 'augeas' }
    }
  }
}
