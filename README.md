# Автоматизированные тесты для домашних заданий в ОТУС

Тесты представляют собой набор InSpec тестов, запускаемые в travis ci на Pull Request с домашним заданием. Номер домашнего задания определяется по названию ветки. Если ветка с тестом не найдена, считается что тестов нет и тревис становится зеленым.

# Тесты для потоков
[2019-02](https://github.com/express42/otus-homeworks/tree/2019-02)

# Добавление новой группы

Для добавление тестов для новой группы, нужно сделать ветку от ветки предыдущего потока.  

В файле run.sh необходимо изменить значение переменной GROUP указав дату старта группы в формате year-month  
