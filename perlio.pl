#!/usr/bin/perl -w
# perlio.pl ~/kit/Cheatsheets/input.txt


$filename=$ARGV[0];

# ### Reading in scalar context
#
# Reads the next (incl. newline) into Scalar.
# $line = <FH>;
# 

open FH, '<', $filename || die $!;
while(<FH>){
    print;
}
# equivalent
while(defined ($_ = <FH>)){
    print;
}

print $_ while <FH>;

map print,<FH>;
map { print $_} <FH>;

close FH;

# ### Reading with diamond <>
#
#
# Command line arguments in @ARGV

@ARGV=('/home/ben/kit/Cheatsheets/input.txt', '/home/ben/kit/Cheatsheets/bash.txt');
print $_, "\n"  foreach @ARGV;

# while (<>) loops through all lines in all files in @ARGV

# $ARGV: the current filename
# $_: the current line
# $.: the current line nummer
#
while(<>){
    print "$ARGV: $_ " if $. == 1;
}
#


# ### Reading in list context
#

open FH, '<', $filename || die $!;

# Reads all lines into array, more memory intensive.
@data = <FH>;
close FH;


# Writing to files
# ----------------
#
# 
@ARGV=('/home/ben/kit/Cheatsheets/input.txt', '/home/ben/kit/Cheatsheets/bash.txt');
$infile = shift;
$outfile = shift;

open APP, '>>', "$outfile.app" || die $!;
print APP "append this line";
close APP;

open IN, '<', $infile || die $!;
open OUT, '>', "$outfile.txt" || die $!;

while(<IN>){
    print OUT $_;
}
close IN;
close OUT;
