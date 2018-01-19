#!/usr/bin/perl -w
package LoginForm;
use lib "/var/www/cgi-bin/CONFIGURATORCMS/simple-login-form";
use ReadFile;

print "Content-type:text/html\n\n";
ReadFile->new()->readFile("simple-login-form/index.html");

