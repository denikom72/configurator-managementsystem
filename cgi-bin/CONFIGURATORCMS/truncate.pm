#!/usr/bin/perl
package mytruncate;
#use strict;
use Data::Dumper;
#use lib '/var/www/cgi-bin/CONFIGURATORCMS';
use modules;

my $cgi = CGI->new;
####ACCESSORS


our $accIns_el = sub {
                # make plausibility check with sprintf ...
                my ( $ref, $sql ) = ( shift, shift );
                $ins_post = $sql if $sql ne "";
                $ins_post;
};

####CONSTRUCTOR### 
sub new { 
	my $type = shift;
        my $self = {};       
	bless $self, $type;
        $self;
}

sub printres {
	my $self = shift;
	my $args = shift;
	print "Content-type: text/json\n\n";

	$DB_DATA::inst->db_crud( $DB_DATA::dbh, $DB_DATA::trunc_el, [] );
	
}

1;
