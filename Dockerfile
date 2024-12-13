FROM php:8.2-apache

#更新套件並安裝需要的擴充套件
RUN apt-get update && apt-get install -y \
    adduser \
    libzip-dev \
    zip \
    && rm -rf /var/lib/apt/lists/*

#建立非root使用者
RUN adduser --disabled-password --gecos '' appuser

#安裝PHP擴充
RUN docker-php-ext-install pdo_mysql zip

#啟用Apache模組
RUN a2enmod rewrite

#設定工作目錄
WORKDIR /var/www/html

#複製專案檔案
COPY . /var/www/html

#建立並設定Apache虛擬主機配置
RUN echo '<VirtualHost *:80>\n\
    DocumentRoot /var/www/html\n\
    DirectoryIndex index_hp.php\n\
    <Directory /var/www/html>\n\
        Options +Indexes +FollowSymLinks\n\
        AllowOverride All\n\
        Require all granted\n\
    </Directory>\n\
    Alias /health /var/www/html/health.php\n\
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

#設定檔案權限
RUN chown -R appuser:appuser /var/www/html \
    && chown -R appuser:appuser /var/log/apache2 \
    && chown -R appuser:appuser /var/run/apache2

#修改Apache使用者
RUN sed -i 's/www-data/appuser/g' /etc/apache2/apache2.conf

#切換到非root使用者
USER appuser

#暴露80端口
EXPOSE 80

#啟動Apache
CMD ["apache2-foreground"]