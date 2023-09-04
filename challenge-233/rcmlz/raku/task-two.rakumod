unit module challenge-nr233::rcmlz::raku::task-two:ver<0.0.1>:auth<rcmlz@github.com)>;

# run in terminal: raku --optimize=3 -I challenge-nr233/rcmlz/raku/ test/challenge-nr233/raku/task-two.rakutest

#|[
You are given an array of integers.

- Write a script to sort the given array in increasing order based on the frequency of the values.
- If multiple values have the same frequency then sort them in decreasing order.
]
our sub solution(@input) is export {
    @input.Bag
          .antipairs
          .sort( { bag-sort($^a, $^b) } )
          .map( { (.value x .key).comb(.value.Str.comb.elems) } )
          .flat;
}
sub bag-sort($a, $b){
    my $c = $a.key cmp $b.key;
    $c eq Same ?? $b.value cmp $a.value !! $c;
}