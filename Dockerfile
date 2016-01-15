#
# Dockerfile PHP 5 based on Apache2 image.
#

FROM mmorejon/apache2:latest

MAINTAINER Manuel Morejón <manuel.morejon.85@gmail.com>

ENV MAX_UPLOAD  "50M"

# Install base packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
    curl \
    libapache2-mod-php5 \
    mysql-client \
    php5-mysql \
    php5-mcrypt \
    php5-gd \
    php5-curl \
    php-pear \
    php-apc && \
    
    # Clean files
    apt-get clean && \    
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    
    # Configure mcrypt module
    /usr/sbin/php5enmod mcrypt && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini && \

    # Configure upload size
    sed -i "s/upload_max_filesize = 2M/upload_max_filesize = $MAX_UPLOAD/" /etc/php5/apache2/php.ini && \
    sed -i "s/post_max_size = 8M/post_max_size = $MAX_UPLOAD/" /etc/php5/apache2/php.ini
