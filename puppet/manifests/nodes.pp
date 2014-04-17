node default {

  include rbenv

  rbenv::plugin { [ 'sstephenson/rbenv-vars', 'sstephenson/ruby-build' ]: }
  rbenv::build { '1.9.3-p545': global => true }
  rbenv::gem { 'puppet' : ruby_version => '1.9.3-p545' }
  rbenv::gem { 'rspec' : ruby_version => '1.9.3-p545' }
  rbenv::gem { 'cucumber' : ruby_version => '1.9.3-p545' }

}