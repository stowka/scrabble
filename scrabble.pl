use warnings;
use strict;

sub searchWord {
	my $filename = "english_words.txt";
	my @words;
	my $i = 0;
	my ($set) = @_;
	$set = lc $set;
	my $line, my $lastLine = "";
	open (my $handle, '<', $filename) or die "Error while trying to open $filename stream.";
	while($line = <$handle>) {
		$line = lc $line;
		if ($line eq $lastLine or length($line) == 2) {
			next;
		}
		if ($line =~ m/^(?!.*?(.).*?\1)[$set]*$/) {
			$words[$i] = $line;
			++$i;
		}
		$lastLine = $line;
	}
	close $handle;
	return @words;
}

print "Type the letters you got : ";
my $set = <>;
print "--- --- ---\n";
my @words = searchWord($set);
my $nbResults = scalar (@words);
print "$nbResults result";
if ($nbResults > 1) {
	print "s";
}
print " found.\n";
print "--- --- ---\n";
foreach my $word (@words) {
	print "---> ". uc $word;
}