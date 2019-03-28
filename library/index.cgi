#!/usr/bin/perl -w
use strict;
use File::Basename;
use Getopt::Std;
use URI::Escape;
my $PROGRAM = basename $0;
my $USAGE=
"Usage: $PROGRAM
";

# my $TITLE = "Browse SPARQL templates";
my $TITLE = "SPARQL Template Library";

print "Content-type: text/html\n\n";

print <<HERE;
<!DOCTYPE html>
<html>
<head>
<title>SPARQL Template Library</title>
<link href="/css/common.css" rel="stylesheet">
</head>

<body>
<script type="text/javascript" src="https://dbcls.rois.ac.jp/DBCLS-common-header-footer/common-header-and-footer/script/common-header-and-footer.js" style="display: block" id="common-header-and-footer__script"></script>
<div class="content_wrapper_wide">

<div class="small">
<a href='/' class='link_title'>SPANG</a> >> Library
</div>
HERE

# print "<h1>$TITLE</h1>\n";

# print_space(1);
# print "Templates for each SPARQL endpoint";
# print "Browse templates for each SPARQL endpoint";
# print "Browse SPARQL templates for each endpoint";
# print "Browse for each SPARQL endpoint";
# print "Select specific SPARQL endpoint";
# print "List of target SPARQL endpoints";
print "<h2>Select the target SPARQL endpoint</h2>";

# print "<h2>SPARQL endpoints</h2>\n";
# print "<h2>For each SPARQL endpoint</h2>\n";

print "<div class='content_wrapper'>\n";

open(LIST_DIR, "index.ini") || die;
while (<LIST_DIR>) {
    chomp;
    if (/^\s*#/) {
	next;
    }
    if (/^\s*(\S+)\s+(.*)/) {
	my ($dir, $name) = ($1, $2);
	print "<a href='$dir' class='link_title'>$name</a>";
	print "<br>";
	print "<br>\n";
    } elsif (/^\s*$/) {
	print "<br>";
    }
}
close(LIST_DIR);

print "</div>\n";

# if (1) {
#     print "<h2>Using templates from SPANG</h2>\n";
    
#     print_space(3);
#     print "<a href='http://purl.org/net/spang'>SPANG</a>: a command-line SPARQL client";
    
#     print "<h3>Examples</h3>\n";
#     print_example_command_line("spang mbgd mbgdl:get_ortholog K9Z723");
#     print_example_command_line("spang mbgd mbgdl:list_genes eco");
# }



print <<HERE2;
<br>
</div>
</body>
</html>
HERE2

################################################################################
### Functions ##################################################################
################################################################################

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
