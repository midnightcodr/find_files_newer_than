#!/usr/bin/env perl
use warnings;
use strict;

sub newer_than {
  my ($dir, $reg, $last_file)=@_;
  opendir(my $DH, $dir) || do {
    die "Can't open $dir\n";
    return;
  };
  my @files=sort grep { ! /^\.\.?$/ && /^$reg$/ && $_ gt $last_file} readdir($DH);
  close($DH);
  return @files;
}

my $dir='./data';
my $reg='file\d+\.xml$';
print "Newer than '':\n";
print join(':', newer_than($dir, $reg, ''))."\n";
print "Newer than 'file20121202.xml':\n";
print join(':', newer_than($dir, $reg, 'file20121202.xml'))."\n";
