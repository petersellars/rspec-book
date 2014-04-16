node default {

  class { 'rbenv': }

  rbenv::plugin { [ 'sstephenson/rbenv-vars', 'sstephenson/ruby-build' ]: }
  rbenv::build { '1.9.3-p545': global => true }

}