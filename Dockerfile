FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y apt-transport-https \
    lsb-release ca-certificates sudo

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg \
    https://packages.sury.org/php/apt.gpg

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" \
    > /etc/apt/sources.list.d/php.list

RUN apt-get update && \
    apt-get install -y php7.1 php7.1-cli php7.1-curl \
    php7.1-xml php7.1-intl php7.1-mbstring php7.1-json \
    php7.1-bcmath php7.1-mysql php7.1-sqlitemc \
    git nano vim

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

USER jenkins

EXPOSE 8080 50000
