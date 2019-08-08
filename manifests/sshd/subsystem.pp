# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include system::sshd::subsystem
#
class system::sshd::subsystem (
  Hash $config = undef
) {
  if $config {
    include augeasproviders
    $defaults = {}
    create_resources(sshd_config_subsystem, $config, $defaults)
  }
}
