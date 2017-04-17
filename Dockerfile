FROM aranga/php5:1.0

LABEL "Author"="MayTech"
LABEL "Date Created"="17/03/2017"

COPY conf/000-default.conf /etc/apache2/sites-enabled


RUN apt-get -y install libapache2-modsecurity 
COPY conf/modsecurity.conf /etc/modsecurity
WORKDIR /usr/share/modsecurity-crs/activated_rules
RUN ln -s /usr/share/modsecurity-crs/base_rules/modsecurity_crs_41_sql_injection_attacks.conf .

WORKDIR /var/www
RUN mv /var/www/html  /var/www/public
