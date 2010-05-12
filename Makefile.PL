
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Google Federated Login module - see http://code.google.com/apis/accounts/docs/OpenID.html',
  'AUTHOR' => 'Glenn Fowler <cebjyre@cpan.org>',
  'BUILD_REQUIRES' => {
    'CGI' => '0',
    'Test::Mock::LWP' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Net-Google-FederatedLogin',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Net::Google::FederatedLogin',
  'PREREQ_PM' => {
    'Carp' => '0',
    'LWP::UserAgent' => '0',
    'Moose' => '0',
    'Moose::Role' => '0',
    'URI::Escape' => '0',
    'XML::Twig' => '0'
  },
  'VERSION' => '0.3.0',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM}; 
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod}; 
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



