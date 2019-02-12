#!/usr/bin/perl -w
use strict;
use File::Basename;
use Getopt::Std;
my $PROGRAM = basename $0;
my $USAGE=
"Usage: $PROGRAM
-a: add Japanese name
-j: add Japanese description
-e: add English description
";

my %OPT;
getopts('aje', \%OPT);

print "digraph {\n";
print "charset=\"utf-8\";\n";
print "ranksep=2;\n";
print "\n";

################################################################################
### Nodes ######################################################################
################################################################################
my %GENDER = ();
my %NAME = ();
my %NAME_JA = ();
my %DESCR = ();
my %BIRTH_DATE = ();
my %DEATH_DATE = ();
my %DIRECT = ();

### Read nodes
for my $file (@ARGV) {
    open(FILE, "$file") || die;
    while (<FILE>) {
	chomp;
	my ($wd_entry, $gender, $name, $name_ja, $descr_ja, $descr_en, $birth_date, $death_date) = split("\t", $_, -1);
	if ($wd_entry =~ /^wd:(Q\d+)/) {
	    my $entry = $1;
	    if ($gender =~ /"(male|female)"\@en/) {
		$GENDER{$entry} = $1;
	    } else {
		die;
	    }
	    if ($name =~ /^"(.*)"\@en$/) {
		$NAME{$entry} = $1;
	    }
	    if ($OPT{a}) {
		if ($name_ja =~ /^"(.*)"\@ja$/) {
		    $NAME_JA{$entry} = $1;
		} else {
		    $NAME_JA{$entry} = "";
		    print STDERR "No Japanese name for $entry\n";
		}
	    }
	    $DESCR{$entry} = "";
	    if ($OPT{j}) {
		if ($descr_ja =~ /^"(.*)"\@ja$/) {
		    $DESCR{$entry} = $1;
		}
	    } elsif ($OPT{e}) {
		if ($descr_en =~ /^"(.*)"\@en$/) {
		    $DESCR{$entry} = $1;
		}
	    }
	    if ($birth_date =~ /^"(\d{4})-\d\d-\d\d\S*"\^\^xsd:dateTime$/) {
		$BIRTH_DATE{$entry} = $1;
	    } else {
		$BIRTH_DATE{$entry} = "";
	    }
	    if ($death_date =~ /^"(\d{4})-\d\d-\d\d\S*"\^\^xsd:dateTime$/) {
		$DEATH_DATE{$entry} = $1;
	    } else {
		$DEATH_DATE{$entry} = "";
	    }
	    if ($file =~ /^child/ || $file =~ /^person/ || $file =~ /^ancestor/) {
		$DIRECT{$entry} = 1;
	    }
	} else {
	    print STDERR "WARNING: $_ in $file\n";
	}
    }
    close(FILE);
}

### Print nodes
my @person = sort keys %GENDER;
for my $person (@person) {
    print "$person [";
    print "shape=box, ";
    if ($GENDER{$person} eq "female") {
	print "color=red, ";
    } else {
	print "color=blue, ";
    }
    $DIRECT{$person} or print "style=dashed, fontcolor=\"#666666\", ";
    print "label=\"";
    $NAME{$person} and print "$NAME{$person}\n";
    $NAME_JA{$person} and print "$NAME_JA{$person}\n";
    $BIRTH_DATE{$person} || $DEATH_DATE{$person} and print "($BIRTH_DATE{$person}-$DEATH_DATE{$person})\n";
    print "$DESCR{$person}";
    print "\"";
    print "] ;\n\n";
}

################################################################################
### Edges ######################################################################
################################################################################

my %REMEMBER_EDGE = ();

for my $file (@ARGV) {
    if ($file =~ /^child\/(\S+)/) {
	my $parent = $1;
	my @child = `cat $file | cut -f1`;
	chomp(@child);
	for my $child (@child) {
	    $child =~ s/wd://;
	    if (! $REMEMBER_EDGE{$parent}{$child}) {
		print "$parent -> $child ;\n";
	    }
	    $REMEMBER_EDGE{$parent}{$child} = 1;
	}
    } elsif ($file =~ /^parent\/(\S+)/) {
	my $child = $1;
	my @parent = `cat $file | cut -f1`;
	chomp(@parent);
	for my $parent (@parent) {
	    $parent =~ s/wd://;
	    if (! $REMEMBER_EDGE{$parent}{$child}) {
		print "$parent -> $child [style=dotted] ;\n";
	    }
	    $REMEMBER_EDGE{$parent}{$child} = 1;
	}
    } elsif ($file =~ /^ancestor\/(\S+)/) {
	my $child = $1;
	my @parent = `cat $file | cut -f1`;
	chomp(@parent);
	for my $parent (@parent) {
	    $parent =~ s/wd://;
	    if (! $REMEMBER_EDGE{$parent}{$child}) {
		print "$parent -> $child ;\n";
	    }
	    $REMEMBER_EDGE{$parent}{$child} = 1;
	}
    }
}

print "}\n";
