FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y apt-transport-https lsb-release ca-certificates

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg \
    https://packages.sury.org/php/apt.gpg

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" \
    > /etc/apt/sources.list.d/php.list

RUN apt-get update && \
    apt-get install -y php7.1 mc git nano vim

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

USER jenkins

EXPOSE 8080 50000
