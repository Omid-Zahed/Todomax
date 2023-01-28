create table board_types
(
    id         integer not null
        primary key autoincrement,
    name       varchar not null,
    created_at datetime,
    updated_at datetime
);

create table failed_jobs
(
    id         integer not null
        primary key autoincrement,
    uuid       varchar not null,
    connection text    not null,
    queue      text    not null,
    payload    text    not null,
    exception  text    not null,
    failed_at  datetime default CURRENT_TIMESTAMP not null
);

create unique index failed_jobs_uuid_unique
    on failed_jobs (uuid);

create table migrations
(
    id        integer not null
        primary key autoincrement,
    migration varchar not null,
    batch     integer not null
);

create table password_resets
(
    email      varchar not null,
    token      varchar not null,
    created_at datetime
);

create index password_resets_email_index
    on password_resets (email);

create table personal_access_tokens
(
    id             integer not null
        primary key autoincrement,
    tokenable_type varchar not null,
    tokenable_id   integer not null,
    name           varchar not null,
    token          varchar not null,
    abilities      text,
    last_used_at   datetime,
    expires_at     datetime,
    created_at     datetime,
    updated_at     datetime
);

create unique index personal_access_tokens_token_unique
    on personal_access_tokens (token);

create index personal_access_tokens_tokenable_type_tokenable_id_index
    on personal_access_tokens (tokenable_type, tokenable_id);

create table sqlite_master
(
    type     text,
    name     text,
    tbl_name text,
    rootpage int,
    sql      text
);

create table sqlite_sequence
(
    name,
    seq
);

create table users
(
    id                integer not null
        primary key autoincrement,
    name              varchar not null,
    email             varchar not null,
    email_verified_at datetime,
    password          varchar not null,
    remember_token    varchar,
    created_at        datetime,
    updated_at        datetime
);

create unique index users_email_unique
    on users (email);

create table workspace_types
(
    id         integer not null
        primary key autoincrement,
    name       varchar not null,
    "index"    varchar not null,
    created_at datetime,
    updated_at datetime
);

create table workspaces
(
    id          integer not null
        primary key autoincrement,
    title       varchar not null,
    description text,
    user_id     integer not null
        references users,
    created_at  datetime,
    updated_at  datetime
);

create table boards
(
    id               integer not null
        primary key autoincrement,
    title            varchar not null,
    description      text,
    background_color varchar not null,
    workspace_id     integer not null
        references workspaces,
    user_id          integer not null
        references users,
    created_at       datetime,
    updated_at       datetime
);

create table rosters
(
    id         integer not null
        primary key autoincrement,
    title      varchar not null,
    "index"    float default '0' not null,
    user_id    integer not null
        references users,
    board_id   integer not null
        references boards,
    created_at datetime,
    updated_at datetime
);

create table tasks
(
    id          integer not null
        primary key autoincrement,
    title       varchar not null,
    "index"     float default '0' not null,
    description text,
    user_id     integer not null
        references users,
    roster_id   integer not null
        references rosters,
    created_at  datetime,
    updated_at  datetime
);

create table comments
(
    id         integer not null
        primary key autoincrement,
    message    text    not null,
    user_id    integer not null
        references users,
    task_id    integer not null
        references tasks,
    parent     integer not null
        references comments,
    created_at datetime,
    updated_at datetime
);

create table labels
(
    id         integer not null
        primary key autoincrement,
    color      varchar not null,
    name       varchar not null,
    task_id    integer not null
        references tasks,
    user_id    integer not null
        references users,
    created_at datetime,
    updated_at datetime
);

create table task_histories
(
    id          integer  not null
        primary key autoincrement,
    task_id     integer  not null
        references tasks,
    user_id     integer  not null
        references users,
    attached_at datetime not null,
    detached_at datetime
);

create unique index user_task_attach
    on task_histories (task_id, attached_at, user_id);

create unique index user_task_detach
    on task_histories (task_id, detached_at, user_id);

