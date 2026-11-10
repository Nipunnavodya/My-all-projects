CREATE TABLE `customers`(
    `customer_id` INT NOT NULL,
    `full_name` VARCHAR(100) NULL,
    `email` VARCHAR(100) NULL,
    `phone` VARCHAR(20) NULL,
    `city` VARCHAR(50) NULL,
    `created_at` TIMESTAMP NULL,
    PRIMARY KEY(`customer_id`)
);
CREATE TABLE `categories`(
    `category_id` INT NOT NULL,
    `category_name` VARCHAR(50) NULL,
    `slug` VARCHAR(50) NULL,
    PRIMARY KEY(`category_id`)
);
CREATE TABLE `products`(
    `product_id` INT NOT NULL,
    `category_id` INT NULL,
    `sku` VARCHAR(30) NULL,
    `title` VARCHAR(150) NULL,
    `unit_price` DECIMAL(10, 2) NULL,
    `stock_quantity` INT NULL,
    PRIMARY KEY(`product_id`)
);
CREATE TABLE `orders`(
    `order_id` INT NOT NULL,
    `customer_id` INT NULL,
    `order_date` DATETIME NULL,
    `status` VARCHAR(20) NULL,
    `shipping_city` VARCHAR(50) NULL,
    PRIMARY KEY(`order_id`)
);
CREATE TABLE `order_items`(
    `order_item_id` INT NOT NULL,
    `order_id` INT NULL,
    `product_id` INT NULL,
    `quantity` INT NULL,
    `unit_price_at_purchase` DECIMAL(10, 2) NULL,
    PRIMARY KEY(`order_item_id`)
);
CREATE TABLE `payments`(
    `payment_id` INT NOT NULL,
    `order_id` INT NULL,
    `payment_method` VARCHAR(20) NULL,
    `payment_status` VARCHAR(20) NULL,
    `amount` DECIMAL(10, 2) NULL,
    `paid_at` TIMESTAMP NULL,
    PRIMARY KEY(`payment_id`)
);
ALTER TABLE
    `order_items` ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`order_id`);
ALTER TABLE
    `order_items` ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`product_id`);
ALTER TABLE
    `products` ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`category_id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY(`customer_id`) REFERENCES `customers`(`customer_id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`order_id`);