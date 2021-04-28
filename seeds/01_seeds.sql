
INSERT INTO users (name, email, password)
VALUES ('Eva Stanley', 'sebastianguerra@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Louisa Meyer', 'jacksonrose@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Dominic Parks', 'victoriablachwell@outlookcom', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Sue Luna', 'victoriablachwell@outlookcom', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Rosalie Garza', 'victoriablachwell@outlookcom', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Etta West', 'victoriablachwell@outlookcom', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Margaret Wong', 'victoriablachwell@outlookcom', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  ('Leroy Hart', 'victoriablachwell@outlookcom', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');


INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES (1, 'Speed lamp', 'description', 'https://images.pexels.com/photos/2086676/pexelx-photo-2086676.jpeg?auto=compress&cs=timysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexelx-photo-2086676.jpeg', 93061, 6, 4, 8, 'Canada', '536 Namsub Highway', 'Sotboske', 'Quebec', '28142', true),
  (1, 'Blank corner', 'description', 'https://images.pexels.com/photos/2121121/pexelx-photo-2121121.jpeg?auto=compress&cs=timysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexelx-photo-2121121.jpeg', 85234, 6, 6, 7, 'Canada', '651 Nami Road', 'Bohbatev', 'Alberta', '38680', true),
  (2, 'Habit mix', 'description', 'https://images.pexels.com/photos/2080018/pexelx-photo-2080018.jpeg?auto=compress&cs=timysrgb&h=350', 'https://images.pexels.com/photos/2080018/pexelx-photo-2080018.jpeg', 46058, 0, 5, 6, 'Canada', '1650 Hejto Center', 'Genwezuj', 'Newfoundland And Labrador', '44583', true),
  (4, 'Headed know', 'description', 'https://images.pexels.com/photos/1029599/pexelx-photo-1029599.jpeg?auto=compress&cs=timysrgb&h=350', 'https://images.pexels.com/photos/1029599/pexelx-photo-1029599.jpeg', 82640, 0, 5, 5, 'Canada', '513 Powov Grove', 'Jaebvap', 'Ontario', '38051', true),
  (6, 'Port out', 'description', 'https://images.pexels.com/photos/1475938/pexelx-photo-1475938.jpeg?auto=compress&cs=timysrgb&h=350', 'https://images.pexels.com/photos/1475938/pexelx-photo-1475938.jpeg', 2358, 2, 8, 0, 'Canada', '1392 Gaza Junction', 'Upetafpuv', 'Nova Scotia', '81059', true),
  (6, 'Fun glad', 'description', 'https://images.pexels.com/photos/1172064/pexelx-photo-1172064.jpeg?auto=compress&cs=timysrgb&h=350', 'https://images.pexels.com/photos/1172064/pexelx-photo-1172064.jpeg', 34291, 6, 6, 4, 'Canada', '196 Nuwug Circle', 'Vutgapha', 'Newfoundland And Labrador', '00159', true),
  (7, 'Shine twenty', 'description', 'https://images.pexels.com/photos/2076739/pexelx-photo-2076739.jpeg?auto=compress&cs=timysrgb&h=350', 'https://images.pexels.com/photos/2076739/pexelx-photo-2076739.jpeg', 13644, 1, 7, 8, 'Canada', '340 Docto Park', 'Upfufa', 'Nova Scotia', '29045', true),
  (1, 'Game fill', 'description', 'https://images.pexels.com/photos/1756826/pexelx-photo-1756826.jpeg?auto=compress&cs=timysrgb&h=350', 'https://images.pexels.com/photos/1756826/pexelx-photo-1756826.jpeg', 23428, 5, 6, 4, 'Canada', '651 Nami Road', 'Bohbatev', 'Alberta', '38680', true);


INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11', '2018-09-26', 2, 3),
  ('2019-01-04', '2019-02-01', 2, 2),
  ('2021-10-01', '2021-10-14', 1, 4),
  ('2021-10-21', '2021-10-21', 3, 5),
  ('2016-07-17', '2016-08-01', 3, 4),
  ('2018-05-01', '2018-05-27', 4, 8),
  ('2022-10-04', '2022-10-23', 5, 1),
  ('2015-09-13', '2015-09-30', 6, 8),
  ('2023-05-27', '2023-05-28', 5, 1),
  ('2023-04-23', '2023-05-02', 5, 1);


INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (2, 5, 10, 3, 'message'),
  (1, 4, 1, 4, 'message'),
  (8, 1, 2, 4, 'message'),
  (3, 8, 5, 4, 'message'),
  (4, 2, 7, 5, 'message'),
  (4, 3, 4, 4, 'message'),
  (5, 6, 3, 5, 'message');