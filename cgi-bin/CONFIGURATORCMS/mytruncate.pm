#!/usr/bin/perl
package mytruncate;
#use strict;
 
####DB-LOGIN-DATA
my ( $db_user, $db_pass, $db_name ) = ("root", "t00rt00r", "CONFIGURATORCMS");

my ( $table ) = ( "elems" );

####END###

#SQL-QUERIES AS VARs

my $trunc_el = "TRUNCATE TABLE ". $table .";";
my $sel_categs = "SELECT el FROM " . $table . " WHERE cat=?;";
my $ins_price = "INSERT INTO " . $table . " (total_price) VALUES (?);";
# this query select id from assigned categorie ( which is to an simple element ) and the column cat gonna be use to check is it zero, cause just then it can be used as a category for other elements
my $price = "SELECT total_price FROM ".$table.";";
####END###

####ACCESSORS


our $accins_price = sub {
                # make plausibility check with sprintf ...
                my ( $ref, $sql ) = ( shift, shift );
                $ins_post = $sql if $sql ne "";
                $ins_post;
};


####END###

####CONSTRUCTOR### 
sub new { 
	my $type = shift;
        my $self = {};       
	bless $self, $type;
        $self;
}

####DB-METHODS###

sub printres {
	my $self = shift;
	my $args = shift;
	print "Content-type: text/json\n\n";
	
	my $inst = db_manager->new("CONFIGURATORCMS", "root", "t00rt00r");
	
	$dbh = $inst->con( $inst->{"db_name"}, $inst->{"user"}, $inst->{"pw"} );

	$inst->db_crud( $dbh, $trunc_el, [] );
	
}
###################TODO - TRANSFORM PERL-ARRAY INTO JSON

1;
