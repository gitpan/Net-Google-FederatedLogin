
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Net::Google::FederatedLogin',
                       'DISTNAME' => 'Net-Google-FederatedLogin',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Glenn Fowler <cebjyre@cpan.org>',
                       'BUILD_REQUIRES' => {
                                             'Test::More' => '0',
                                             'Test::Mock::LWP' => '0',
                                             'CGI' => '0'
                                           },
                       'ABSTRACT' => 'Google Federated Login module - see http://code.google.com/apis/accounts/docs/OpenID.html',
                       'EXE_FILES' => [],
                       'VERSION' => '0.1.0',
                       'PREREQ_PM' => {
                                        'Moose::Role' => '0',
                                        'LWP::UserAgent' => '0',
                                        'XML::Twig' => '0',
                                        'URI::Escape' => '0',
                                        'Moose' => '0',
                                        'Carp' => '0'
                                      },
                       'LICENSE' => 'perl'
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



