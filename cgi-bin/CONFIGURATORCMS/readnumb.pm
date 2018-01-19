#!/usr/bin/perl
package readnumb;
#use strict;
####ACCESSORS
use CGI;
use Data::Dumper;

my $cgi = CGI->new;

our $accIns_el = sub {
                # make plausibility check with sprintf ...
                my ( $ref, $sql ) = ( shift, shift );
                $ins_post = $sql if $sql ne "";
                $ins_post;
};


####CONSTRUCTOR### 
sub new { 
	my $type = shift;
	my ( $myArgv ) = ( shift );
        my $self = {};
	$self->{myArgv} = $myArgv;       
	$self->{dbh} = $dbh;       
	bless $self, $type;
	#print Dumper $myArgv;
        $self;
}

####END###

sub printProdNumb {
	my($ref) = (shift);
	open(NUMB, "<prodnumb.txt");
	while(<NUMB>){
		print;
	}
	close(NUMB);
}


sub printres {
	my $ref = shift;
	
	print "Content-type: text/json\n\n";
	$ref->printProdNumb;
	
	#print  Dumper $ref->{myArgv};
}
