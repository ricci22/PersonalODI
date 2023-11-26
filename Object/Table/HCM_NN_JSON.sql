create table HCM_NN_JSON(
    id          number    generated always as identity,
    fetched_at  timestamp default systimestamp,
    document    clob,
    constraint document_isjson check (document is json)
);