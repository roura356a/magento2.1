FROM roura/php-magento:7.0

# Clone 2.1 branch
RUN cd /var/www \
    && git clone -b 2.1 --single-branch --verbose https://github.com/magento/magento2.git html \
    && cd html && composer install \
    && composer require mageplaza/magento-2-blog-extension:2.4.6 \
    && composer require mageplaza/magento-2-banner-slider-extension \
    && chmod u+x bin/magento \
    && mv package.json.sample package.json && npm install \
    && mv Gruntfile.js.sample Gruntfile.js && grunt

COPY cron.sh /var/www/html/
COPY env.php /var/www/html/app/etc
COPY config.php /var/www/html/app/etc
COPY .htaccess /var/www/html

# Setup cron job
RUN touch /var/spool/cron/crontabs/root \
    && crontab -l > newcron \
    && echo "* * * * * /var/www/html/cron.sh" >> newcron \
    && crontab newcron \
    && rm newcron

RUN chown --recursive www-data:www-data /var/www
