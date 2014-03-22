#!/bin/bash
set -e

echo; echo;
echo "# Installations PHP Dev Tools"
echo "# =========================================="
echo;


cd /usr/local/bin

echo "# conposer"
curl -sS https://getcomposer.org/installer | php && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

# echo "# PHPUnit"
# wget --no-check-certificate https://phar.phpunit.de/phpunit.phar && chmod +x phpunit.phar && mv phpunit.phar /usr/local/bin/phpunit

# echo "# PHPUnit-Skelgen"
# wget --no-check-certificate https://phar.phpunit.de/phpunit-skelgen.phar && chmod +x phpunit-skelgen.phar && mv phpunit-skelgen.phar /usr/local/bin/phpunit-skelgen

# echo "# PHPLoc"
# wget --no-check-certificate https://phar.phpunit.de/phploc.phar && chmod +x phploc.phar && mv phploc.phar /usr/local/bin/phploc

# echo "# PDepend"
# wget --no-check-certificate http://static.pdepend.org/php/1.1.0/pdepend.phar && chmod +x pdepend.phar && mv pdepend.phar /usr/local/bin/pdepend

# echo "# PHpcpd"
# wget --no-check-certificate https://phar.phpunit.de/phpcpd.phar && chmod +x phpcpd.phar  && mv phpcpd.phar /usr/local/bin/phpcpd

# echo "# PHPDox"
# wget --no-check-certificate http://phpdox.de/releases/phpdox.phar && chmod +x phpdox.phar && mv phpdox.phar /usr/local/bin/phpdox


__install-php-dev()
{
    local URL="$1"
    local FNAME="$2"

    if [ -f "/usr/local/bin/${FNAME}" ]; then
        echo "Ignoring installed ${FNAME}"
        return
    fi

    echo "# $FNAME"
    wget --no-check-certificate "$URL" && chmod +x "${FNAME}.phar" && mv "${FNAME}.phar" "/usr/local/bin/${FNAME}"    
}



__install-php-dev https://phar.phpunit.de/phpunit.phar              phpunit
__install-php-dev https://phar.phpunit.de/phpunit-skelgen.phar      phpunit-skelgen
__install-php-dev https://phar.phpunit.de/phploc.phar               phploc
__install-php-dev http://static.pdepend.org/php/1.1.0/pdepend.phar  pdepend
__install-php-dev https://phar.phpunit.de/phpcpd.phar               phpcpd
__install-php-dev http://phpdox.de/releases/phpdox.phar             phpdox