FROM php:8.0-apache
MAINTAINER iQuest AB <info@iquest.se>

RUN apt-get update && apt-get install -y libicu-dev libldb-dev libldap2-dev git zip
RUN /bin/sh ./composer-install.sh
RUN mv composer.phar /usr/local/bin/composer
RUN docker-php-ext-install gettext
RUN docker-php-ext-install intl
RUN docker-php-ext-configure ldap
RUN docker-php-ext-install ldap
RUN pecl install mailparse
RUN docker-php-ext-enable mailparse