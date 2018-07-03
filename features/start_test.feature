@st

Feature: Тестирование окна входа в BANKEX
# Email можно подставить любой. Проверено на рабочей почте.
# Работа с капча требует больше времени. Обходить каждую нужно индивидуально.

@1
    Scenario: Регистрация
        Given Открываю в браузере BANKEX
        When  Нажимаю "Sign Up"
        And   Ввожу "E-Mail": "Email@Email.email"
        And   Нажимаю подтверждение
        And   Принимаю соглашение на первом этапе
# Прохожу капчу в ручную
        And   Прохожу Captcha
        And   Нажимаю подтверждение

@2
    Scenario: Востановление пароля
        Given Открываю в браузере BANKEX
        When  Нажимаю "Forgot password"
        And   Ввожу "E-Mail": "Email@Email.email"
        And   Прохожу Captcha
        And   Нажимаю подтверждение

@3
    Scenario: Зайти в приложение
        Given Открываю в браузере BANKEX
        And   Ввожу "E-Mail": "Email@Email.email"
        And   Ввожу "Password": "Qwerty1234"
        And   Прохожу Captcha
        And   Нажимаю подтверждение
        When  Нажимаю "Log Out"

@4
    Scenario: Востановление пароля API
        Given Открываю в браузере BANKEX
        When  Нажимаю "Forgot password"
        And   Отправляю запрос для востановления пароля к почте "Email@Email.email"
        Then  Открываю в браузере окно восстановления пароля
        And   Ввожу "New password": "Qwerty1234"
        And   Ввожу "Confirm password": "Qwerty1234"
        And   Нажимаю подтверждение