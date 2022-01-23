USE [BUDT703_Project_0506_06];

BEGIN TRANSACTION;

SET ANSI_WARNINGS OFF;

INSERT INTO [Master_Lee's.Restaurant] VALUES
('R1019', 'Generous Joe''s Deli', 20, 4.08, '107 Centerway Ste A', 39.00117, -76.87657, 'Greenbelt', 20770, 1, 0),
('R1020', 'Vapiano M Street', 60, 7.48, '1800 M. St NW', 38.90552, -77.04188, 'Washington, DC', 20003, 1, 1);

INSERT INTO [Master_Lee's.Customer] VALUES
('C0092', 'HickoryRidge', 1, '50-64'),
('C0093', 'Lanitac', 0, '35-49'),
('C0094', 'JustinEiseleTravel', 1, '25-34'),
('C0095', 'emped0cles', 1, '35-49'),
('C0096', 'Roya B', 0, '35-49'),
('C0097', 'Marcel H', 1, '35-49'),
('C0098', 'User264339', 1, '50-64'),
('C0099', 'LLQ17', 0, '50-64'),
('C0100', 'Robert J', 1, '65+'),
('C0101', 'craig1086', 1, '25-34');

INSERT INTO [Master_Lee's.Review] VALUES
(3, 'Sometimes, you don''t want eclectic cuisine. Roosevelt Center has an Art Déco vibe with 500 seat one-screen movie theatre, the best bakery anywhere (Chef Lou''s), a grocery store that is TRULY a co-op that is a throwback to the 70s yet with eclectic vittles, TWO performance spaces, decent restaurants, and even a takeout pizza parlor. Sometimes, you just want a good burger, fries, and a drink. That''s Generous Joe''s. Nothing outstanding, but homey, food courtish, and good enough. Y''know? Sometimes, that''s all you want and they give you what you expect. Nothing more, nothing less..', '2018-07-13', 'R1019', 'C0092'),
(5, 'I love this place the food is always fresh and tasty. The side salad is a deal for a low price and is enough to eat. The price and portions are just right.', '2016-04-11', 'R1019', 'C0093'),
(4, 'Generous Joe''s was one of the first Greenbelt places that I tried when coming to practice in Maryland at the end of 2014. It is a great place to get takeout from. I think most of the subs are good. But, I think a few are so good that it is hard to ever get anything else. The eggplant parm is almost good enough to have you not pining for a New York deli if you are in withdraws. It is always fresh and perfectly seasoned. They also make a pretty good steak n'' cheese sub. If you get either, you have to add some fries. Make sure to ask for the fries "crispy".', '2015-11-23', 'R1019', 'C0094'),
(3, 'Went here with some former Greenbelt locals. While the food was good, the wait was very - very long and the place was rather dirty. The trash was overflowing, the bathroom was pretty gross, and the tables / floors were a mess. Note that if I was rating this solely for the food and service, it would easily be 4-5 stars. Would give this place another shot next time, but would probably take the food to go.', '2015-09-06', 'R1019', 'C0095'),
(3, 'We used to be able to walk here from our old house. Not the most fabulous food, or the most clean place, but it''s food, and it''s not too expensive, and it has a small town quirk. Perfect for a quick cheap lunch during an outdoor festival.', '2015-04-21', 'R1019', 'C0096'),
(4, 'You order your Italian menu at the counter - cooks prepare your meal in a few minutes in front of you. Fresh ingredients. Fresh and modern interior. And they have a full bar. Modest prices. Good value for your money. Not for your romantic dinner, but ideal with friends, family or just yourself.', '2020-02-02', 'R1020', 'C0097'),
(5, 'Dined Sunday, 11/10 about 3PM. You get a credit card type card to track your selections & pay when you leave. No waiting as there are many stations to choose—pasta, pizza, salad, etc. Upon ordering, your dish is prepared in front of you allowing for substitutions or alterations of ingredients. We had shrimp & spinach pasta with a creamy pesto sauce. My wife chose a marinara sauce instead of creamy pesto. We split the Greek salad—traditional preparation & loaded with creamy Feta cheese. Fresh herbs are on the tables you can harvest and add to your dish as desired. Very enjoyable meal at moderate prices. Highly recommend!', '2019-11-12', 'R1020', 'C0098'),
(5, 'Fresh pasta cooked to order starting with menu items. The cooks are happy to customize orders. Vapiano serves the only reliably consistent Italian dishes no matter which restaurant you visit.', '2019-10-19', 'R1020', 'C0099'),
(5, 'Loved all the stations and the preparation done after you order. They had bruschetta stations, pasta stations, pizza stations, wine/beverage stations. Fascinating to watch', '2019-09-09', 'R1020', 'C0100'),
(5, 'We came in on a Friday Night for dinner. It was its usual busy, but we only had to wait about 15 mins to place our order. The pasta that we ordered was as good as ever, and the bruschetta to start was fantastic. Sat at the bar, because that was basically the only place to sit, due to it being so crowded. Drinks were great as well. For those that have never been, it''s only a few blocks from a metro stop, so its walkable. For the price, it''s one of the best restaurant deals in D.C. also around the corner from bars & clubs.', '2019-04-07', 'R1020', 'C0101');

INSERT INTO [Master_Lee's.Employ] VALUES
('R1019', 'Self_delivery'),
('R1020', 'Self_delivery'),
('R1020', 'Grubhub'),
('R1020', 'DoorDash'),
('R1020', 'Uber Eats');

INSERT INTO [Master_Lee's.Menu] VALUES
('R1019', 'MC019', 2, 1),
('R1020', 'MC020', 3, 1);

INSERT INTO [Master_Lee's.MenuCuisine] VALUES
('R1019', 'MC019', 'Salads'),
('R1019', 'MC019', 'Wings'),
('R1019', 'MC019', 'Calzone'),
('R1019', 'MC019', 'Pizza'),
('R1019', 'MC019', 'Sides'),
('R1019', 'MC019', 'Subs'),
('R1019', 'MC019', 'Sandwiches'),
('R1019', 'MC019', 'Desserts'),
('R1019', 'MC019', 'Breakfast'),
('R1020', 'MC020', 'Pizza'),
('R1020', 'MC020', 'Salads'),
('R1020', 'MC020', 'Desserts'),
('R1020', 'MC020', 'Panini'),
('R1020', 'MC020', 'Pasta'),
('R1020', 'MC020', 'Risotto'),
('R1020', 'MC020', 'Appetizers'),
('R1020', 'MC020', 'Soups');

SELECT * FROM [Master_Lee's.Restaurant]
SELECT * FROM [Master_Lee's.Customer]
SELECT * FROM [Master_Lee's.Review]
SELECT * FROM [Master_Lee's.DeliveryPlatform]
SELECT * FROM [Master_Lee's.Employ]
SELECT * FROM [Master_Lee's.Menu]
SELECT * FROM [Master_Lee's.MenuCuisine]

SET ANSI_WARNINGS ON;

COMMIT;
