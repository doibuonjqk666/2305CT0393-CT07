-- =====================================================================
-- File tao CSDL cho lab3: bang dang nhap (tbl_user) + bang dang ky mon hoc (records)
-- Chay 1 lan truoc khi chay app.  Mat khau tat ca cac user deu la: 123456
-- =====================================================================

CREATE DATABASE IF NOT EXISTS school
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE school;

-- ---------------- Bang nguoi dung (dang nhap) ----------------
CREATE TABLE IF NOT EXISTS tbl_user (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(100),
    password CHAR(64),        -- SHA-256 dang HEX gom 64 ky tu
    email VARCHAR(100),
    address VARCHAR(100),
    PRIMARY KEY (id)
);

-- Mat khau la 123456 duoc bam bang SHA2(...,256), khop voi PasswordUtil.sha256 ben Java
INSERT INTO tbl_user (username, password, email, address) VALUES
('dhgia', SHA2('123456',256), 'dhgia@dhv.edu.vn', 'HoChiMinh City'),
('admin', SHA2('123456',256), 'admin@dhv.edu.vn', 'HoChiMinh City'),
('user1', SHA2('123456',256), 'user1@dhv.edu.vn', 'HoChiMinh City'),
('user2', SHA2('123456',256), 'user2@dhv.edu.vn', 'HoChiMinh City');

-- ---------------- Bang dang ky mon hoc ----------------
CREATE TABLE IF NOT EXISTS records (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    stname VARCHAR(255),
    course VARCHAR(255),
    fee INT
);

INSERT INTO records (stname, course, fee) VALUES
('Nguyen Van A', 'Lap trinh Java',  1500000),
('Tran Thi B',   'Lap trinh Web',   1200000),
('Le Van C',     'CSDL MySQL',      1000000);
