CREATE TABLE IF NOT EXISTS commons_deletions (
    title VARCHAR(255) BINARY NOT NULL,
    deletion_type ENUM('speedy', 'discussion', 'nopermission') NOT NULL,
    state ENUM('new', 'notifying', 'failed', 'notified', 'maybe gone', 'gone') NOT NULL DEFAULT 'new',
    state_time DATETIME NOT NULL DEFAULT now(),
    retries INT NOT NULL DEFAULT 0,
    touched TIMESTAMP NOT NULL DEFAULT now(),

    PRIMARY KEY (title, deletion_type),
    KEY(touched)
) ENGINE=InnoDB DEFAULT CHARSET=BINARY;
