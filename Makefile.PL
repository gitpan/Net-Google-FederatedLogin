
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
                                             'Test::More' => '0'
                                           },
                       'ABSTRACT' => 'Google Federated Login module - see http://code.google.com/apis/accounts/docs/OpenID.html',
                       'EXE_FILES' => [],
                       'VERSION' => '0.0.2',
                       'PREREQ_PM' => {
                                        'LWP::UserAgent' => '0',
                                        'XML::Twig' => '0',
                                        'URI::Escape' => '0',
                                        'Carp' => '0',
                                        'Moose' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{BUILD_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.56) };

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



