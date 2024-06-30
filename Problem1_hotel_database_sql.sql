CREATE TABLE `Hotels` (
  `hotel_id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `address` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `country` varchar(255),
  `postal_code` varchar(255),
  `contact_number` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `Rooms` (
  `room_id` int PRIMARY KEY AUTO_INCREMENT,
  `hotel_id` int,
  `room_number` varchar(255),
  `type` varchar(255),
  `capacity` int,
  `price` decimal,
  `status` varchar(255)
);

CREATE TABLE `Customers` (
  `customer_id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `phone_number` varchar(255),
  `date_of_birth` date,
  `address` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `country` varchar(255),
  `postal_code` varchar(255)
);

CREATE TABLE `Reservations` (
  `reservation_id` int PRIMARY KEY AUTO_INCREMENT,
  `customer_id` int,
  `room_id` int,
  `check_in_date` date,
  `check_out_date` date,
  `status` varchar(255),
  `total_price` decimal,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `Payments` (
  `payment_id` int PRIMARY KEY AUTO_INCREMENT,
  `reservation_id` int,
  `payment_date` timestamp,
  `amount` decimal,
  `payment_method` varchar(255),
  `status` varchar(255)
);

CREATE TABLE `Employees` (
  `employee_id` int PRIMARY KEY AUTO_INCREMENT,
  `hotel_id` int,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `phone_number` varchar(255),
  `position` varchar(255),
  `hire_date` date,
  `salary` decimal
);

CREATE TABLE `Services` (
  `service_id` int PRIMARY KEY AUTO_INCREMENT,
  `hotel_id` int,
  `name` varchar(255),
  `description` text,
  `price` decimal
);

CREATE TABLE `Service_Usage` (
  `usage_id` int PRIMARY KEY AUTO_INCREMENT,
  `service_id` int,
  `reservation_id` int,
  `quantity` int,
  `total_price` decimal
);

ALTER TABLE `Rooms` ADD FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`hotel_id`);

ALTER TABLE `Reservations` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`);

ALTER TABLE `Reservations` ADD FOREIGN KEY (`room_id`) REFERENCES `Rooms` (`room_id`);

ALTER TABLE `Payments` ADD FOREIGN KEY (`reservation_id`) REFERENCES `Reservations` (`reservation_id`);

ALTER TABLE `Employees` ADD FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`hotel_id`);

ALTER TABLE `Services` ADD FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`hotel_id`);

ALTER TABLE `Service_Usage` ADD FOREIGN KEY (`service_id`) REFERENCES `Services` (`service_id`);

ALTER TABLE `Service_Usage` ADD FOREIGN KEY (`reservation_id`) REFERENCES `Reservations` (`reservation_id`);
