#!/usr/bin/env perl

use Getopt::Long;

sub escape {
	my $val = shift;

	$val =~ s/\\/\\\\/gs;
	$val =~ s/"/\\"/g;
	$val =~ s/([\x00-\x1f])/sprintf("\\x%02x", ord($1))/ges;

	return $val;
}

`wget http://search.cpan.org/CPAN/authors/id/S/SB/SBURKE/Text-Unidecode-1.30.tar.gz`;
`tar xf Text-Unidecode-1.30.tar.gz`;
`mkdir -p pl`;
`mv Text-Unidecode-1.30/lib/Text/Unidecode/x*.pm pl`;

my $input = "./pl/";
my $output = "./";

$result = GetOptions(
	"input=s" => \$input,
	"output=s" => \$output,
);

push(@INC, $input);

open(OUT, sprintf(">%s/table.go", $output));

print OUT "//\n";
print OUT "//go:generate perl generate.pl\n";
print OUT "//\n";
print OUT "\n";
print OUT "package unidecode\n";
print OUT "\n";
print OUT "var Table = map[rune]string {\n";

for (my $n = 0; $n < 256; ++$n) {
	eval(sprintf("require x%02x;\n", $n));

	next unless( $#{$Text::Unidecode::Char[$n]} >= 0 );

	printf OUT "	// 0x%02x00 - 0x%02xff\n", $n, $n;

	my $m = 0;
	for my $t (@{$Text::Unidecode::Char[$n]}) {
		printf OUT "	'\\u%02x%02x': \"%s\",\n", $n, $m, &escape($t);
		$m++;
	}
}

print OUT "}\n";

close(OUT);

`rm -rf Text-Unidecode-1.30*`;
`rm -rf pl`;
