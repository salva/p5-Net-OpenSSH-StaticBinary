#!/usr/bin/perl

use strict;
use warnings;

use Module::StaticBinaryBuilder;

my @components = ( { name             => 'openssl',
                     driver           => 'autoconf',
                     source           => 'http://www.openssl.org/source/openssl-1.0.0g.tar.gz',
                     md5              => '07ecbe4324f140d157478637d6beccf1',
                     configure_script => 'config',
                     configure_extra  => [qw(-no-shared)],
                   },

                   { name   => 'openssh',
                     driver => 'autoconf',
                     source => 'ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-5.9p1.tar.gz' },
                 );

Module::StaticBinaryBuilder
    -> new( module_name => 'Net::OpenSSH::StaticBinary',
            license     => 'perl',
            components  => \@components )

    -> run;
