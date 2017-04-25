drop table if exists log;
CREATE TABLE `log` (
  `fecha` date,
  `hora` time,
  `usuario` char(25),
  `ip` char(32),
  `id` smallint(6)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4

-- insert into log values (curdate(),curtime(),substring_index(current_user(),'@',1),(select host from information_schema.processlist where id=connection_id()),'100');

