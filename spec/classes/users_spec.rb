require 'spec_helper'

describe 'system::users' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

#     let :params do {
#          config: 'undef',
#          sys_schedule: 'always',
#          real: false,
#     }
      it { is_expected.to compile }
#     end
    end
  end
end
