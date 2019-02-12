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

for my $file (@ARGV) {
    open(FILE, "$file") || die;
    while (<FILE>) {
	chomp;
	my ($wd_entry, $gender, $name, $name_ja, $descr_ja, $descr_en, $birth_date, $death_date) = split("\t", $_, -1);
	if ($wd_entry =~ /^wd:Q(\d+)/) {
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
	    save_edge($parent, $child);
	}
    } elsif ($file =~ /^parent\/(\S+)/ || $file =~ /^ancestor\/(\S+)/) {
	my $child = $1;

	my @parent = `cat $file | cut -f1`;
	chomp(@parent);

	for my $parent (@parent) {
	    save_edge($parent, $child);
	}
    }
}

################################################################################
### Print ######################################################################
################################################################################

my @person = sort keys %GENDER;
my @entry = ();
for my $person (@person) {

    my @field = ();

    push @field, "  \"id\":$person";
    push @field, get_edge($person);
    push @field, "  \"gender\":\"$GENDER{$person}\"";
    $NAME{$person} and push @field, "  \"name\":\"$NAME{$person}\"";
    $NAME_JA{$person} and push @field, "  \"name_ja\":\"$NAME_JA{$person}\"";
    $BIRTH_DATE{$person} and push @field, "  \"birthDate\":$BIRTH_DATE{$person}";
    $DEATH_DATE{$person} and push @field, "  \"deathDate\":$DEATH_DATE{$person}";
    $DESCR{$person} and push @field, "  \"description\":\"$DESCR{$person}\"";

    push @entry, " {\n" . join(",\n", @field) . "\n }";
}
print "[\n";
print join(",\n", @entry);
print "\n]\n";

################################################################################
### Function ###################################################################
################################################################################
sub get_edge {
    my ($parent) = @_;

    my @child = keys %{$REMEMBER_EDGE{$parent}};
    # @child = map { "\"$_\"" } @child;
    if (@child) {
	return "  \"hasChild\":[" . join(",", @child) . "]";
    } else {
	return;
    }
}

sub save_edge {
    my ($parent, $child) = @_;

    $parent =~ s/wd://;
    $child =~ s/wd://;
    $parent =~ s/Q//;
    $child =~ s/Q//;

    # if (! $REMEMBER_EDGE{$parent}{$child}) {
    # 	print "\"$parent\"\t\"$child\"\t:\"hasChild\"\n";
    # }

    $REMEMBER_EDGE{$parent}{$child} = 1;
}
