#!/usr/bin/perl -w
use strict;
use File::Basename;
use Getopt::Std;
use URI::Escape;
my $PROGRAM = basename $0;
my $USAGE=
"Usage: $PROGRAM
";

my %KEY_VAL = ();
parse_ini_file("index.ini", \%KEY_VAL);
my $TITLE = "SPARQL templates";
if ($KEY_VAL{title}) {
    $TITLE = "SPARQL templates for " . $KEY_VAL{title};
    # $TITLE = $KEY_VAL{title};
}

print "Content-type: text/html\n\n";

# print "<font face='verdana'>";
print "<font face='Century Gothic'>";

# print "<br>";
print_space(2);
# print "\[ SPANG | Library \]";
# print "<a href='/spang'>SPANG</a> >> <a href='/spang/library'>Library</a>";
print "<a href='/'>Top</a> >> <a href='/library'>Library</a>";
# print "<a href='/spang'>Top</a> | <a href='/spang/library'>Library</a>";
# print "<a href='/spang'>SPANG</a> | <a href='/spang/library'>Library</a>";
# print "<a href='/spang'>SPANG Home</a> | <a href='/spang/library'>Library Top</a>";
# print "<a href='/spang'>SPANG home</a> | <a href='/spang/library'>Library</a>";
# print "<a href='/spang'>SPANG home</a> | <a href='/spang/library'>Library</a>";
# print "<a href='/spang'>SPANG</a> <a href='/spang/library'>Library</a>";

# if ($KEY_VAL{title}) {
#     print " >> $KEY_VAL{title}";
# }

print "<br>";
# print "<br>";

print "<h1>$TITLE</h1>\n";

if ($KEY_VAL{endpoint} and $KEY_VAL{schema}) {
    # print "<h2>Available endpoint</h2>\n";
    # print_space(3);
    # print "<a href='$KEY_VAL{endpoint}'>$KEY_VAL{endpoint}</a>";
    # print "<br>";
    # print "<br>";
    print_space(3);
    print "<a href='$KEY_VAL{schema}'>";
    if ($KEY_VAL{title}) {
	print "$KEY_VAL{title} ";
    }
    print "RDF schema";
    print "</a>";
    print "<br>";
    # print "<br>";

    print "<h2>Templates</h2>\n";
}

my @file = `ls`;
chomp(@file);

for my $file (@file) {
    if ($file =~ /\.(cgi|ini|pl)$/) {
	next;
    }
    if ($file =~ /~$/) {
	next;
    }

    print_space(2);
    print_link_to_file($file);
    print_space(3);
    print "<br>";

    my ($comment, $parameter) = extract_comment($file);

    if ($comment) {
	print_space(3);
	print_description($comment);
    }

    if ($parameter) {
	print_space(3);
	print_parameter($parameter);
	print "<br>\n";
    }
    
    my $query_text = `/home/chiba/etc/spang/bin/spang mbgd $file -q -r /home/chiba/etc/spang/etc/prefix,/home/chiba/.spang/prefix 2> /dev/null`;
    my $query_escaped = uri_escape($query_text);
    if (defined $KEY_VAL{endpoint}) {
	print_space(4);
	print_link_to_result($query_escaped, $KEY_VAL{endpoint});
	if ($KEY_VAL{sparql_editor}) {
	    print_space(1);
	    print "(";
	    print_link_to_editor($file, $query_escaped, $KEY_VAL{sparql_editor}, "edit");
	    print ")";
	}
	print "<br>\n";
    } elsif ($KEY_VAL{sparql_editor}) {
	print_space(4);
	print_link_to_editor($file, $query_escaped, $KEY_VAL{sparql_editor}, "exec");
	print "<br>\n";
    }

    print "<br>\n";
}

if ($KEY_VAL{legend}) {
    print "<h2>Using templates from SPANG</h2>\n";
    
    print_space(3);
    print "<a href='http://purl.org/net/spang'>SPANG</a>: a command-line SPARQL client";
    
    print "<h3>Examples</h3>\n";
    print_example_command_line("spang mbgd mbgdl:get_ortholog K9Z723");
    print_example_command_line("spang mbgd mbgdl:list_genes eco");
}

print "</font>\n";

################################################################################
### Functions ##################################################################
################################################################################

sub extract_comment {
    my ($file) = @_;

    my $comment = "";
    my $parameter = "";

    open(FILE, $file) || die;
    my $line = <FILE>;
    while (<FILE>) {
	chomp;
	if (/^#(param|args|ARGS)\s(.*)/) {
	    $parameter = $2;
	}
    }
    close(FILE);

    if ($line and $line =~ /^# *(.*)/) {
	$comment = $1;
    }

    return ($comment, $parameter);
}

sub print_link_to_file {
    my ($file) = @_;

    my $name = $file;
    $name =~ s/\.rq$//;

    my $pwd = `pwd`;
    my $directory = basename $pwd;

    # print "<font face='symbol'>";
    print "<font face='verdana'>";
    print "<a href='/query/$directory/$file'>$name</a>";
    print "</font>";
}

sub print_parameter {
    my ($parameter) = @_;

    print "<font face='verdana'>";
    # print "(example parameter";
    # print "(ex.param";
    print "(ex.";
    print "<font face='courier new'>";
    print " $parameter";
    print "</font>";
    print ")";
    print "</font>";
}

sub print_description {
    my ($description) = @_;

    print "<font face='Century Gothic'>";
    print "Description: $description";
    print "</font>";
    print "<br>\n";
}

sub print_example_command_line {
    my ($command_line) = @_;

    print_space(3);
    print "<font face='courier'>\n";
    print $command_line, "\n";
    print "</font>\n";
    print "<br><br>\n";
}

sub print_space {
    my ($n) = @_;

    for (my $i=0; $i<$n; $i++) {
	print "&nbsp;";
    }
    print "\n";
}

sub parse_ini_file {
    my ($ini_file, $r_val) = @_;

    if (-f $ini_file) {
	open(FILE, $ini_file) || die;
	while (<FILE>) {
	    chomp;
	    if (/^(\S+)\s+(\S.+)/) {
		my ($key, $val) = ($1, $2);
		${$r_val}{$key} = $val;
	    }
	}
	close(FILE);
    }
}

sub print_link_to_result {
    my ($query_escaped, $endpoint) = @_;

    $query_escaped =~ s/%20/+/g;

    print "<a href='$endpoint?query=$query_escaped'>exec</a>";
}

sub print_link_to_editor {
    my ($file, $query_escaped, $editor, $label) = @_;

    $query_escaped =~ s/"/&quot;/g;

    my $link_to_editor;
    if ($editor eq "yasgui") {
	if (! defined $KEY_VAL{endpoint}) {
	    die;
	}
	my $endpoint = uri_escape($KEY_VAL{endpoint});
	my $title = uri_escape($file);
	$link_to_editor = "http://yasgui.org/#query=${query_escaped}&endpoint=${endpoint}&tabTitle=$title";
    } elsif ($editor eq "mbgd2015") {
	$link_to_editor = "/sparql/search_2015.php?query=${query_escaped}";
    } elsif ($editor eq "mbgd2016") {
	$link_to_editor = "/sparql/search_2016.php?query=${query_escaped}";
    }
    
    # print_space(2);
    # print "<input type='button' value='test' style='cursor:pointer;' onClick=\"location.href='$link_to_editor'\">";
    print "<a href='$link_to_editor'>$label</a>";
}
