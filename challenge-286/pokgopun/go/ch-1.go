//# https://theweeklychallenge.org/blog/perl-weekly-challenge-286/
/*#

Task 1: Self Spammer

Submitted by: [56]David Ferrone
     __________________________________________________________________

   Write a program which outputs one word of its own script / source code
   at random. A word is anything between whitespace, including symbols.

Example 1

If the source code contains a line such as: 'open my $fh, "<", "ch-1.pl" or die;
'
then the program would output each of the words { open, my, $fh,, "<",, "ch-1.pl
", or, die; }
(along with other words in the source) with some positive probability.

Example 2

Technically 'print(" hello ");' is *not* an example program, because it does not
assign positive probability to the other two words in the script.
It will never display print(" or ");

Example 3

An empty script is one trivial solution, and here is another:
echo "42" > ch-1.pl && perl -p -e '' ch-1.pl

Task 2: Order Game
#*/
//# solution by pokgopun@gmail.com
