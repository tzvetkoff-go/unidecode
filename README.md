# Unidecode

[![GoDoc](https://godoc.org/github.com/tzvetkoff-go/unidecode?status.svg)](http://godoc.org/github.com/tzvetkoff-go/unidecode)
[![Build Status](https://travis-ci.org/tzvetkoff-go/unidecode.svg?branch=master)](https://travis-ci.org/tzvetkoff-go/unidecode)

`Unidecode` transliterates non-latin characters to their latin equivalents.

This library is a straight port of the [Text::Unidecode](http://search.cpan.org/~sburke/Text-Unidecode-1.27/lib/Text/Unidecode.pm) Perl library.

## Examples

``` go
package main

import (
	"github.com/tzvetkoff-go/unidecode"
)

func main() {
	println(unidecode.Unidecode("北亰"))         // "Bei Jing "
	println(unidecode.Unidecode("Чебурашка"))   // "Cheburashka"
}
```

## License

The `table.go` file is a translation of the original `x*.pm` files, and as such is subject to [their original license](http://search.cpan.org/~sburke/Text-Unidecode-1.27/lib/Text/Unidecode.pm#LICENSE).

Anything else is subject to the [MIT license](https://opensource.org/licenses/MIT).
