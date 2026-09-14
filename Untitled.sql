CREATE TABLE `cliente` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `telefone` varchar(255),
  `endereco` varchar(255),
  `data_cadastro` timestamp
);

CREATE TABLE `restaurante` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(255),
  `endereco` varchar(255),
  `nota_media` decimal,
  `ativo` boolean DEFAULT true
);

CREATE TABLE `entregador` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(255) UNIQUE,
  `veiculo` varchar(255),
  `telefone` varchar(255),
  `disponivel` boolean DEFAULT true
);

CREATE TABLE `pedido` (
  `id` integer PRIMARY KEY,
  `cliente_id` integer NOT NULL,
  `restaurante_id` integer NOT NULL,
  `entregador_id` integer,
  `data_pedido` timestamp NOT NULL,
  `valor_total` decimal NOT NULL,
  `forma_pagamento` varchar(255),
  `status` varchar(255)
);

ALTER TABLE `pedido` ADD CONSTRAINT `pedido_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

ALTER TABLE `pedido` ADD CONSTRAINT `pedido_restaurante` FOREIGN KEY (`restaurante_id`) REFERENCES `restaurante` (`id`);

ALTER TABLE `pedido` ADD CONSTRAINT `pedido_entregador` FOREIGN KEY (`entregador_id`) REFERENCES `entregador` (`id`);
