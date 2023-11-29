# frozen_string_literal: true

require 'spec_helper'

describe 'issue_543' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:pre_condition) do
        <<~END
          if $facts['networking']['fqdn'].empty {
            fail("No fqdn fact: networking => ${facts['networking']}")
          }
        END
      end
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
