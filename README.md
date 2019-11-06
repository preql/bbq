# Приложение "Шашлыки" #

## Описание ##
  Учебное приложение для планирования мероприятий, создавайте событие и приглашайте друзей! 
  К событию можно подписаться, комментировать и добавлать к нему фотографии. 
  Можно войти через ваши странцицы в социальных сетях vkontakte и facebook.
  
  `ruby 2.5.5`
  
  `rails 5.2.3`
  
  Использованные технологии:
- Фреймворк `Bootstrap`
- Загрузка и хранение файлов на `AWS`
- Рассылка почты `SendGrid`
- Локализация `i18n`
- Загрузка изображений `carrierwave`
- Авторизация `pundit`
- Аутентификация `omniauth`

## Установка ##
Скачайте или клонируйте приложение, установите гем `bundler` если у вас его нет:

```
gem install bundler
```

Чтобы скачать необходимые библиотеки и подготовить базу данных в дериктории с приложением необходимо выполнить команды:
```
bundle install
bundle exec rake db:migrate
```

Так же нужно указать значения переменных окружения для работы:

 * `Amazon S3`
```
S3_ACCESS_KEY
S3_SECRET_KEY
S3_BUCKET_REGION
S3_BUCKET_NAME
```

 * `Sendgrid`
 ```
 SENDGRID_PASSWORD
 SENDGRID_USERNAME
 ```
 
 * `Omniauth`
 ```
 OMNIAUTH_FACEBOOK_ID
 OMNIAUTH_FACEBOOK_SECRET
 OMNIAUTH_VKONTAKTE_ID
 OMNIAUTH_VKONTAKTE_SECRET
 ```

## Демо ##
Рабочая версия приложения [здесь](https://bbqforall.herokuapp.com/).

## Контактные данные ##
stereotype1@mail.ru
