CREATE TABLE reader
(
    unique_number INT PRIMARY KEY,
    surname       VARCHAR(255),
    name          VARCHAR(255),
    address       VARCHAR(255),
    date_of_birth DATETIME
);

CREATE TABLE publisher
(
    id      INT PRIMARY KEY,
    address VARCHAR(255),
    name    VARCHAR(255)
);

CREATE TABLE library
(
    id      INT PRIMARY KEY,
    address VARCHAR(255)
);

CREATE TABLE category
(
    id   INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE book
(
    isbn            INT PRIMARY KEY,
    publish_year    DATE,
    name            VARCHAR(255),
    author          VARCHAR(255),
    number_of_pages INT,
    publisher_id    INT,
    category_id     INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher (id),
    FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE book_copy
(
    copy_id    INT PRIMARY KEY,
    book_isbn  INT,
    position   INT,
    library_id INT,
    FOREIGN KEY (book_isbn) REFERENCES book (isbn),
    FOREIGN KEY (library_id) REFERENCES library (id)
);

CREATE TABLE takes
(
    id           INT PRIMARY KEY,
    book_copy_id INT,
    reader_id    INT,
    FOREIGN KEY (book_copy_id) REFERENCES book_copy (copy_id),
    FOREIGN KEY (reader_id) REFERENCES reader (unique_number)
);

