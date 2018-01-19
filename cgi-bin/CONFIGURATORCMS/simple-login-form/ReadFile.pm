package ReadFile; 
use strict;

# Not necessary if bind this module in a bootstrap-cgi, which already print out the html-header
#print "content-type:text/html\n\n";

sub new {
	my ( $type, $self ) = ( shift, {} );
	bless $self, $type;
	$self;
	
}

sub readFile {
	my ( $self, $file ) = ( shift, shift );
	open( FILE, "<$file") or die "Couldn't open file: $!";
	while(<FILE>){
		print;
	}
	close FILE or die "Couldn't close file: $!";
}

#ReadFile->new()->readFile("index.html");

1;
