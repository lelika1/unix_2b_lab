# Задача B3.

Задайте важную для вас директорию в переменной FDIR (по умолчанию установлена **$HOME**) и однобуквенную аббревиатуру для неё в переменной FDIR_SYM (по умолчанию - **h**).

Для данной директории доступны команды:
* **cdh** - принимает опциональный аргумент поддиректорию
* **mvh** - принимает обязательный аргумент источник (относительно текущей директории) и необязательный приёмник (относительно выбранной директории)
* **cph** - параметры аналогичны mvh
* **mvfh** - принимает обязательный параметр источник (относительно выбранной директории) и необязательный приёмник (относительно текущей директории)
* **cpfh** - аналогично mvfh

Для данных команд реализовано автодополнение параметров.
