Задание: 1 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
____
SELECT model, speed, hd
FROM PC 
WHERE price < 500

Задание: 2 (Serge I: 2002-09-21)
Найдите производителей принтеров. Вывести: maker
____
SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer'

Задание: 3 (Serge I: 2002-09-30)
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
____
SELECT model, ram, screen
FROM Laptop
WHERE price > 1000

Задание: 4 (Serge I: 2002-09-21)
Найдите все записи таблицы Printer для цветных принтеров.
____
SELECT code, model, color, type, price
FROM Printer
WHERE color = 'y'

Задание: 5 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
____
SELECT DISTINCT model, speed, hd
FROM PC
WHERE (cd = '12x' or cd = '24x') AND price < 600

Задание: 6 (Serge I: 2002-10-28)
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
____
SELECT DISTINCT Product.maker, Laptop.speed
FROM Product INNER JOIN
Laptop ON Product.model = Laptop.model
WHERE Laptop.hd >= 10

Задание: 7 (Serge I: 2002-11-02)
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
____
SELECT DISTINCT Product.model, price
FROM Product
INNER JOIN PC ON Product.model = PC.model
WHERE maker = 'B'
UNION
SELECT DISTINCT Product.model, price
FROM Product
INNER JOIN Laptop ON Product.model = Laptop.model
WHERE maker = 'B'
UNION
SELECT DISTINCT Product.model, price
FROM Product
INNER JOIN Printer ON Product.model = Printer.model
WHERE maker = 'B'

Задание: 8 (Serge I: 2003-02-03)
Найдите производителя, выпускающего ПК, но не ПК-блокноты.
____
SELECT DISTINCT maker
FROM Product
WHERE type = 'PC'
EXCEPT
SELECT DISTINCT maker
FROM Product
WHERE type = 'laptop'

Задание: 9 (Serge I: 2002-11-02)
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
____
SELECT DISTINCT Maker
FROM Product
INNER JOIN PC ON Product.model = PC.model
WHERE speed >= 450

Задание: 10 (Serge I: 2002-09-23)
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
____
SELECT model, price
FROM Printer
WHERE price =
(SELECT MAX(price)
FROM Printer)

Задание: 11 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК.
____
SELECT AVG(speed) AS Avg_speed
FROM PC

Задание: 12 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
____
SELECT AVG(speed) AS Avg_speed
FROM Laptop
WHERE price > 1000

Задание: 13 (Serge I: 2002-11-02)
Найдите среднюю скорость ПК, выпущенных производителем A.
____
SELECT AVG(speed) AS Avg_speed
FROM PC
INNER JOIN Product ON PC.model = Product.model
WHERE maker = 'A'

Задание: 14 (Serge I: 2002-11-05)
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
____
SELECT Ships.class, name, country
FROM Ships
INNER JOIN Classes ON Ships.class = Classes.class
WHERE numGuns >= 10

Задание: 15 (Serge I: 2003-02-03)
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
____
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(hd) >= 2

Задание: 16 (Serge I: 2003-02-03)
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
____
SELECT DISTINCT pc_1.model, pc_2.model, pc_1.speed, pc_2.ram
FROM PC pc_1, PC pc_2
WHERE pc_1.speed = pc_2.speed AND pc_1.ram = pc_2.ram AND pc_1.model > pc_2.model

Задание: 18 (Serge I: 2003-02-03)
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
____
SELECT DISTINCT Product.maker, Printer.price
FROM Printer
INNER JOIN Product ON Printer.model = Product.model
WHERE Printer.color = 'y' AND Printer.price =
(SELECT MIN(price)
FROM Printer
WHERE color = 'y')

Задание: 19 (Serge I: 2003-02-13)
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.
____
SELECT maker, AVG(screen) AS Avg_screen
FROM Laptop
INNER JOIN Product ON Laptop.model = Product.model
GROUP BY maker

Задание: 20 (Serge I: 2003-02-13)
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
____
SELECT Maker, COUNT(model) AS Count_Model
FROM Product
WHERE type = 'PC'
GROUP BY maker
HAVING COUNT(DISTINCT model) >= 3

Задание: 21 (Serge I: 2003-02-13)
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.
____
SELECT maker, MAX(price) AS Max_price
FROM PC
INNER JOIN Product ON PC.model = Product.model
GROUP BY maker

Задание: 22 (Serge I: 2003-02-13)
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
____
SELECT speed, AVG(price) AS Avg_price
FROM PC
GROUP BY speed
HAVING speed > 600

Задание: 23 (Serge I: 2003-02-14)
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker
____
SELECT DISTINCT maker
FROM Product
INNER JOIN PC ON Product.model = PC.model
WHERE speed >= 750
INTERSECT
SELECT DISTINCT maker
FROM Product
INNER JOIN Laptop ON Product.model = Laptop.model
WHERE speed >= 750

Задание: 25 (Serge I: 2003-02-14)
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
____
SELECT DISTINCT maker
FROM Product

WHERE model IN
(
SELECT model
FROM PC
WHERE ram = 
(
SELECT MIN(ram)
FROM PC
)

AND

speed =
(
SELECT MAX(speed)
FROM PC
WHERE ram =
(
SELECT MIN(ram)
FROM PC
)
)
)

AND 
maker IN
(
SELECT maker
FROM Product
WHERE type = 'Printer'
)

Задание: 27 (Serge I: 2003-02-03)
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
____
SELECT maker, AVG(hd) AS Avg_hd
FROM PC
INNER JOIN Product ON PC.model = Product.model
GROUP BY maker
HAVING maker IN
(SELECT maker
FROM Product
WHERE type = 'Printer')

Задание: 28 (Serge I: 2012-05-04)
Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
____
SELECT COUNT(maker) AS qty
FROM Product
WHERE maker IN
(SELECT maker
FROM Product
GROUP BY maker
HAVING COUNT(model) = 1)

Задание: 30 (Serge I: 2003-02-14)
В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).
____
SELECT point, date, SUM(outs) AS Sum_out, SUM(incs) AS Sum_inc
FROM 
(SELECT point, date, NULL outs, SUM(inc) AS incs
FROM Income
GROUP BY point, date
UNION
SELECT point, date, SUM(out), NULL
FROM Outcome
GROUP BY point, date) AS t
GROUP BY point, date

Задание: 31 (Serge I: 2002-10-22)
Для классов кораблей, калибр орудий которых не менее 16 дюймов, укажите класс и страну.
____
SELECT class, country
FROM Classes
WHERE bore >= 16

Задание: 33 (Serge I: 2002-11-02)
Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship.
____
SELECT ship
FROM Outcomes
LEFT JOIN Battles ON Outcomes.battle = Battles.name
WHERE Battles.name = 'North Atlantic' AND result = 'sunk'

Задание: 34 (Serge I: 2002-11-04)
По Вашингтонскому международному договору от начала 1922 г. запрещалось строить линейные корабли водоизмещением более 35 тыс.тонн. Укажите корабли, нарушившие этот договор (учитывать только корабли c известным годом спуска на воду). Вывести названия кораблей.
____
SELECT DISTINCT name
FROM Ships, Classes
WHERE launched >= 1922 AND type = 'bb' AND displacement > 35000 AND Ships.class = Classes.class

Задание: 36 (Serge I: 2003-02-17)
Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).
____
SELECT name
FROM Ships
WHERE name = class
UNION
SELECT ship AS name
FROM Outcomes, Classes
WHERE Outcomes.ship = Classes.class



