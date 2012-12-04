#!/usr/bin/env perl
use warnings;
use strict;

sub newer_than {
	my($dir, $last_file)=@_;
	opendir(my $DH, $dir) || die "Can't open $dir\n";
	my @files=sort grep { $_ !~ /^\.\.?$/ && $_ gt $last_file} readdir($DH);
	close($DH);
	return @files;
}

my $dir='./data';
print "Newer than '':\n";
print join(':', newer_than($dir, ''))."\n";
print "Newer than 'file20121202.xml':\n";
print join(':', newer_than($dir, 'file20121202.xml'))."\n";
