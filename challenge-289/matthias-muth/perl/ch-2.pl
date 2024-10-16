#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 289 Task 2: Jumbled Letters
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use utf8;
binmode(STDOUT, ":utf8");

sub jumble_string( $str ) {
    my @chars = split "", $str;
    return join "", map { splice @chars, rand( @chars ), 1, () } 0..$#chars;
}

sub jumbled_letters( $str ) {
    return $str =~ s{
            (?<=[A-Za-z]) [a-z]+ (?=[a-z])
        }{
            jumble_string( $& );
        }xegr;
}

use Test2::V0 qw( -no_srand );
use Data::Dump qw( pp );

my $input_text = <<EOF;
According to a researchch at Cambridge University, it doesn’t matter in what
order the letters in a word are, the only importent thing is that the first and
last letter be at the right place.
The rest can be a total mess and you can still read it without problem.
This is because the human mind does not read every letter by itself,
but the word as a whole.
EOF

sub normalize( $str ) {
    return $str =~ s{
            (?<=[A-Za-z]) [a-z]+ (?=[a-z])
        }{
            join( "", sort split "", $& );
        }xegr;
}

my $jumbled = jumbled_letters( $input_text );

say "Original text:\n", $input_text;
say "Jumbled text:\n", $jumbled;
say "Normalized original text:\n", normalize( $input_text );
say "Normalized jumbled text:\n", normalize( $jumbled );

ok $jumbled ne $input_text,
    "Jumbled text and original text differ";
is normalize( $jumbled ), normalize( $input_text ),
    "Normalized jumbled text and normalized original text are equal";

done_testing;
