require 'spec_helper_acceptance'

describe 'oracle_webgate class' do

  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'oracle_webgate':
           serverId        => 'testServerId',
           hostname        => 'test.example.com',
           webgateId       => 'testWebgateId',
           port            => '5575',
           password        => 'password',
           passphrase      => 'passphrase',
           certFile        => 'puppet:///modules/oracle_webgate/certFile.pem',
           keyFile         => 'puppet:///modules/oracle_webgate/keyFile.pem',
           chainFile       => 'puppet:///modules/oracle_webgate/chainFile.pem',
           downloadDir     => '/tmp/oracle_webgate_install',
           remoteRepo      => 'https://www.dropbox.com/sh/ugru4frg4yt7xtd/AABIg1_-_rSTbG2DHDnIJzYHa',
           installPackage  => 'Oracle_Access_Manager10_1_4_3_0_linux64_APACHE24_WebGate.zip',
           user            => 'root',
           group           => 'root'
         }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end
  end
end
