#!/usr/bin/perl -w
use strict;
use File::Basename;
use Getopt::Std;
my $PROGRAM = basename $0;
my $USAGE=
"Usage: $PROGRAM Q*
-a: get ancestor
-p: get parents of relatives
";

my %OPT;
getopts('api', \%OPT);

### Get argument
if (@ARGV != 1) {
    print STDERR $USAGE;
    exit 1;
}
my $WIKIDATA_ENTRY = shift @ARGV;

### Settings
my $GET_PERSON = "http://spang.dbcls.jp/library/wikidata/get_person_ja.rq~";
my $GET_CHILD  = "http://spang.dbcls.jp/library/wikidata/get_child_ja.rq~";
my $GET_PARENT = "http://spang.dbcls.jp/library/wikidata/get_parent_ja.rq~";

my $DIR_PERSON = "person";
my $DIR_CHILD = "child";
my $DIR_PARENT = "parent";
my $DIR_ANCESTOR = "ancestor";
if (! -d $DIR_PERSON) {
    mkdir $DIR_PERSON;
}
if (! -d $DIR_CHILD) {
    mkdir $DIR_CHILD;
}
if (! -d $DIR_PARENT) {
    mkdir $DIR_PARENT;
}
if (! -d $DIR_ANCESTOR) {
    mkdir $DIR_ANCESTOR;
}

### Get person info
if (! -f "$DIR_PERSON/$WIKIDATA_ENTRY") {
    system "spang wikidata $GET_PERSON wd:$WIKIDATA_ENTRY -a > $DIR_PERSON/$WIKIDATA_ENTRY";
}

### Get children
my @FILE = glob "$DIR_PERSON/*";
get_children(@FILE);
my $COUNT = -1;
while ($COUNT != 0) {
    @FILE = glob "$DIR_CHILD/*";
    $COUNT = get_children(@FILE);
}

### Get ancestor
if ($OPT{a}) {
    @FILE = glob "$DIR_PERSON/*";
    get_parents($DIR_ANCESTOR, @FILE);
    $COUNT = -1;
    while ($COUNT != 0) {
	@FILE = glob "$DIR_ANCESTOR/*";
	$COUNT = get_parents($DIR_ANCESTOR, @FILE);
    }
}

### Get parent two times
if ($OPT{p}) {
    @FILE = glob "$DIR_CHILD/*";
    get_parents($DIR_PARENT, @FILE);
    @FILE = glob "$DIR_PARENT/*";
    get_parents($DIR_PARENT, @FILE);
}

################################################################################
### Functions ##################################################################
################################################################################

sub get_children {
    my @file = @_;

    my $count = 0;

    for my $file (@file){
	open(FILE, "$file") || die;
	while (<FILE>) {
	    chomp;
	    my @f = split("\t", $_);
	    if ($f[0] =~ /^wd:(Q\d+)$/) {
		my $wikidata_entry = $1;
		if (! -f "$DIR_CHILD/$wikidata_entry") {
		    system "spang wikidata $GET_CHILD $f[0] -a > $DIR_CHILD/$wikidata_entry";
		    $count ++;
		}
	    } else {
		print STDERR "WARNING: $f[0] is not wikidata entry\n";
	    }
	}
	close(FILE);
    }

    return $count;
}

sub get_parents {
    my ($out_dir, @file) = @_;

    my $count = 0;

    for my $file (@file){
	open(FILE, "$file") || die;
	while (<FILE>) {
	    chomp;
	    my @f = split("\t", $_);
	    if ($f[0] =~ /^wd:(Q\d+)$/) {
		my $wikidata_entry = $1;
		if (! -f "$out_dir/$wikidata_entry") {
		    system "spang wikidata $GET_PARENT $f[0] -a > $out_dir/$wikidata_entry";
		    $count ++;
		}
	    } else {
		print STDERR "WARNING: $f[0] is not wikidata entry\n";
	    }
	}
	close(FILE);
    }

    return $count;
}
