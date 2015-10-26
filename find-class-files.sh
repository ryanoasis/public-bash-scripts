#!/bin/sh
# @author Ryan McIntyre

# e.g. 1
cat lib/model/doctrine/base/*.class.php | sed 's|\r$||' | sort | uniq --all-repeated | uniq --count | grep "class " | grep -v '*'

# e.g. 2
cat lib/model/doctrine/*.class.php | sed 's|\r$||' | sort | uniq --all-repeated | uniq --count | grep "class " | grep -v '*'

# e.g. 3
cat lib/form/doctrine/base/*.class.php | sed 's|\r$||' | sort | uniq --all-repeated | uniq --count | grep "class " | grep -v '*'


# e.g. latest
cat lib/form/doctrine/*.class.php | sed 's|\r$||' | sort | uniq --all-repeated | uniq --count | grep "class " | grep -v '*'