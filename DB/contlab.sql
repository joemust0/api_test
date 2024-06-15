-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/06/2024 às 06:40
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `contlab`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `balancos`
--

CREATE TABLE `balancos` (
  `num_balanco` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nome_balanco` varchar(255) NOT NULL,
  `descricao_balanco` text DEFAULT NULL,
  `data_criacao` date NOT NULL,
  `data_modificacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `balancos`
--

INSERT INTO `balancos` (`num_balanco`, `id_usuario`, `nome_balanco`, `descricao_balanco`, `data_criacao`, `data_modificacao`) VALUES
(1, 2, 'Balanço Exemplo 2', 'balanço exemplo 6', '2024-05-19', '2024-05-27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `lancamentos`
--

CREATE TABLE `lancamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_balanco` int(11) NOT NULL,
  `num_nf` int(11) NOT NULL,
  `serie_nf` int(3) NOT NULL,
  `chave_nf` bigint(44) NOT NULL,
  `data_criacao` date NOT NULL,
  `data_entrada` date NOT NULL,
  `c_debito` varchar(255) DEFAULT NULL,
  `v_debito` decimal(15,2) DEFAULT NULL,
  `c_credito` varchar(255) DEFAULT NULL,
  `v_credito` decimal(15,2) DEFAULT NULL,
  `id_plano_de_contas` int(11) NOT NULL,
  `conta_analitica` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `planodecontas`
--

CREATE TABLE `planodecontas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `periodo_c` varchar(50) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `conta` varchar(255) DEFAULT NULL,
  `conta_sintetica` varchar(50) DEFAULT NULL,
  `conta_analitica` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `planodecontas`
--

INSERT INTO `planodecontas` (`id`, `tipo`, `periodo_c`, `modelo`, `conta`, `conta_sintetica`, `conta_analitica`) VALUES
(1, 'Ativo', 'circulante', 'disponivel', 'caixa', '1.1.1', '1.1.1.1'),
(2, 'Ativo', 'circulante', 'disponivel', 'Bancos Conta Movimentos', '1.1.1', '1.1.1.2'),
(3, 'Ativo', 'circulante', 'disponivel', 'Aplicação de liquidez Imediata', '1.1.1', '1.1.1.3'),
(4, 'Ativo', 'circulante', 'CRÉDITOS DE VENDAS DE IMÓVEIS', 'Notas Promissórias a Receber', '1.1.2', '1.1.2.1'),
(5, 'Ativo', 'circulante', 'CRÉDITOS DE VENDAS DE IMÓVEIS', 'Repasses do SFH a Formalizar', '1.1.2', '1.1.2.2'),
(6, 'Ativo', 'circulante', 'CRÉDITOS DE VENDAS DE IMÓVEIS', 'FGTS a Repassar', '1.1.2', '1.1.2.3'),
(7, 'Ativo', 'circulante', 'CRÉDITOS DE VENDAS DE IMÓVEIS', 'Juros Contratuais a Receber', '1.1.2', '1.1.2.4'),
(8, 'Ativo', 'circulante', 'CRÉDITOS D OBRAS POR EMPREITADA ', 'Faturas a Receber', '1.1.3', '1.1.3.1'),
(9, 'Ativo', 'circulante', 'CRÉDITOS D OBRAS POR EMPREITADA ', 'Serviços Executados a Faturar', '1.1.3', '1.1.3.2'),
(10, 'Ativo', 'circulante', 'CRÉDITOS D OBRAS POR EMPREITADA ', 'Provisão p/ créd. Liquid. duvidosa', '1.1.3', '1.1.3.9'),
(11, 'Ativo', 'circulante', 'TÍTULOS DESCONTADOS', 'Duplicatas', '1.1.6', '1.1.6.1'),
(12, 'Ativo', 'circulante', 'CRÉDITOS DIVERSOS ', 'Adiantamentos a Fornecedores', '1.1.7', '1.1.7.1'),
(13, 'Ativo', 'circulante', 'CRÉDITOS DIVERSOS ', 'Adiantamentos a Funcionários ', '1.1.7', '1.1.7.2'),
(14, 'Ativo', 'circulante', 'CRÉDITOS DIVERSOS ', 'Adiantamentos a Terceiros ', '1.1.7', '1.1.7.3'),
(15, 'Ativo', 'circulante', 'CRÉDITOS DIVERSOS ', 'Antecipação de Impostos ', '1.1.7', '1.1.7.4'),
(16, 'Ativo', 'circulante', 'CRÉDITOS DIVERSOS ', 'Títulos e valores mobiliários ', '1.1.7', '1.1.7.5'),
(17, 'Ativo', 'circulante', 'CRÉDITOS DIVERSOS ', 'Outros créditos', '1.1.7', '1.1.7.9'),
(18, 'Ativo', 'circulante', 'IMÓVEIS A COMERCIAL. E ESTOQUES ', 'Estoque de Materiais ', '1.1.8', '1.1.8.1'),
(19, 'Ativo', 'circulante', 'IMÓVEIS A COMERCIAL. E ESTOQUES ', 'Terrenos a Comercializar ', '1.1.8', '1.1.8.2'),
(20, 'Ativo', 'circulante', 'IMÓVEIS A COMERCIAL. E ESTOQUES ', 'Imóveis em Construção   ', '1.1.8', '1.1.8.3'),
(21, 'Ativo', 'circulante', 'DESPESAS ANTECIPADAS', 'Custos e Despesas Antecipadas ', '1.1.9', '1.1.9.1'),
(22, 'Ativo', 'REALIZÁVEL A LONGO PRAZO', 'CRÉDITOS COM PESSOAS LIGADAS', 'Créditos com Sócios ou Diretores', '1.2.9', '1.2.9.1'),
(23, 'Ativo', 'REALIZÁVEL A LONGO PRAZO', 'CRÉDITOS COM PESSOAS LIGADAS', 'Créditos com Empresas Ligadas ', '1.2.9', '1.2.9.2'),
(24, 'Ativo', 'REALIZÁVEL A LONGO PRAZO', 'INVESTIMENTO ', 'Créditos com Empresas Controladas', '1.2.9', '1.2.9.3'),
(25, 'Ativo', 'PERMANENTE ', 'INVESTIMENTO ', 'Participação em Empresas Coligadas', '1.3.1', '1.3.1.1'),
(26, 'Ativo', 'PERMANENTE ', 'INVESTIMENTO ', 'Participação em Empresas Controladas ', '1.3.1', '1.3.1.2'),
(27, 'Ativo', 'PERMANENTE ', 'INVESTIMENTO ', 'Participações por Incentivos Fiscais', '1.3.1', '1.3.1.3'),
(28, 'Ativo', 'PERMANENTE ', 'INVESTIMENTO ', 'Participações Diversas', '1.3.1', '1.3.1.4'),
(29, 'Ativo', 'PERMANENTE ', 'INVESTIMENTO ', 'Imóveis de Renda ', '1.3.1', '1.3.1.5'),
(30, 'Ativo', 'PERMANENTE ', 'INVESTIMENTO ', 'Outros Investimentos', '1.3.1', '1.3.1.9'),
(31, 'Ativo', 'PERMANENTE', 'IMOBILIZADO ', 'Imobilizações Técnicas Tangíveis ', '1.3.2', '1.3.2.1'),
(32, 'Ativo', 'PERMANENTE', 'IMOBILIZADO ', 'Depreciações Acumuladas', '1.3.2', '1.3.2.2'),
(33, 'Ativo', 'PERMANENTE', 'IMOBILIZADO ', 'Consórcios para aquisições de Bens', '1.3.2', '1.3.2.3'),
(34, 'Ativo', 'PERMANENTE', 'IMOBILIZADO ', 'Adiantamentos a Fornecedores de Imobilizado', '1.3.2', '1.3.2.4'),
(35, 'Ativo', 'PERMANENTE', 'DIFERIDO ', 'Despesas Pré-Operacionais ', '1.3.3', '1.3.3.1'),
(36, 'Ativo', 'PERMANENTE', 'DIFERIDO ', 'Amortizações Acumuladas ', '1.3.3', '1.3.3.2'),
(37, 'PASSIVO', 'circulante', 'DÉBITOS DE FUNCIONAMENTO', 'Fornecedores', '2.1.1', '2.1.1.1'),
(38, 'PASSIVO', 'circulante', 'DÉBITOS DE FUNCIONAMENTO', 'Adiantamento de Clientes', '2.1.1', '2.1.1.2'),
(39, 'PASSIVO', 'circulante', 'DÉBITOS DE FUNCIONAMENTO', 'Recuperações a Pagar', '2.1.1', '2.1.1.3'),
(40, 'PASSIVO', 'circulante', 'DÉBITOS DE FUNCIONAMENTO', 'Obrigações Sociais a Recolher', '2.1.1', '2.1.1.4'),
(41, 'PASSIVO', 'circulante', 'DÉBITOS DE FUNCIONAMENTO', 'Obrigações Tributárias a Recolher ', '2.1.1', '2.1.1.5'),
(42, 'PASSIVO', 'circulante', 'DÉBITOS DE FUNCIONAMENTO', 'Parcelamento de Tributos ', '2.1.1', '2.1.1.6'),
(43, 'Passivo', 'circulante', 'DÉBITOS DE FINANCIAMENTO', 'Financiamentos de Capital de Giro ', '2.1.2', '2.1.2.1'),
(44, 'Passivo', 'circulante', 'DÉBITOS DE FINANCIAMENTO', 'Financiamentos de Bens do Ativo Permanente', '2.1.2', '2.1.2.2'),
(45, 'Passivo', 'circulante', 'DÉBITOS DE FINANCIAMENTO', 'Financiamentos de Construção - SFH', '2.1.2', '2.1.2.3'),
(46, 'Passivo', 'circulante', 'DÉBITOS DE FINANCIAMENTO', 'Financiamentos de Origem Externa', '2.1.2', '2.1.2.4'),
(47, 'Passivo', 'circulante', 'DÉBITOS DE FINANCIAMENTO', 'Financiamentos p aquisição de Imóveis', '2.1.2', '2.1.2.5'),
(48, 'Passivo', 'circulante', 'DÉBITOS DE FINANCIAMENTO', 'Financiamentos Diversos', '2.1.2', '2.1.2.9'),
(49, 'Passivo', 'circulante', 'OUTRAS EXIGIBILIDADES', 'Custos Orçados', '2.1.3', '2.1.3.1'),
(50, 'Passivo', 'circulante', 'OUTRAS EXIGIBILIDADES', 'Custos Contratados', '2.1.3', '2.1.3.2'),
(51, 'Passivo', 'circulante', 'OUTRAS EXIGIBILIDADES', 'Provisões', '2.1.3', '2.1.3.3'),
(52, 'Passivo', 'circulante', 'OUTRAS EXIGIBILIDADES', 'Débitos Diversos', '2.1.3', '2.1.3.4'),
(53, 'Passivo', 'PASSIVO EXIGÍVEL A LONGO PRAZO ', 'DÉBITOS DEFINANCIAMENTO', 'Financiamentos para aquisição de Imóveis', '2.2.2', '2.2.2.5'),
(54, 'Passivo', 'PASSIVO EXIGÍVEL A LONGO PRAZO ', 'DÉBITOS DEFINANCIAMENTO', 'Débitos de Sócios da Empresa', '2.2.2', '2.2.2.6'),
(55, 'Passivo', 'PASSIVO EXIGÍVEL A LONGO PRAZO ', 'DÉBITOS DEFINANCIAMENTO', 'Débitos com Empresas Ligadas ', '2.2.2', '2.2.2.7'),
(56, 'Passivo', 'PASSIVO EXIGÍVEL A LONGO PRAZO ', 'DÉBITOS DEFINANCIAMENTO', 'Débitos de Empresas Controladas', '2.2.2', '2.2.2.8'),
(57, 'Passivo', 'PASSIVO EXIGÍVEL A LONGO PRAZO ', 'DÉBITOS DEFINANCIAMENTO', 'Débitos de Empresas Coligadas', '2.2.2', '2.2.2.9'),
(58, 'Passivo', 'RESULT. DE EXERCÍCIOS FUTUROS', 'RECEITAS DIFERIDAS', 'Receitas Diferidas de Vendas de Imóveis ', '2.3.1', '2.3.1.1'),
(59, 'Passivo', 'RESULT. DE EXERCÍCIOS FUTUROS', 'RECEITAS DIFERIDAS', 'Receitas Diferidas de Obras em Sociedade', '2.3.1', '2.3.1.2'),
(60, 'Passivo', 'RESULT. DE EXERCÍCIOS FUTUROS', 'RECEITAS DIFERIDAS', 'Receitas Diferidas de Juros', '2.3.1', '2.3.1.3'),
(61, 'Passivo', 'RESULT. DE EXERCÍCIOS FUTUROS', 'CUSTOS DIFERIDOS ', 'Custos Diferidos de Vendas de Imóveis', '2.3.2', '2.3.2.1'),
(62, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'CAPITAL SOCIAL', 'Capital Realizado  ', '2.4.1', '2.4.1.1'),
(63, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESERVAS DE CAPITAL ', 'Reservas de Correção Monetária Do Capital  ', '2.4.2', '2.4.2.1'),
(64, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESERVAS DE CAPITAL ', 'Reservas de Ágio   ', '2.4.2', '2.4.2.2'),
(65, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESERVAS DE CAPITAL ', 'Reservas de Reavaliação  ', '2.4.2', '2.4.2.3'),
(66, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESERVAS DE REAVALIAÇÃO ', 'Reservas de Reavaliação de Bens Próprios ', '2.4.3', '2.4.3.1'),
(67, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESERVAS DE REAVALIAÇÃO ', 'Reserva de Reavaliação de Bens de Coligadas', '2.4.3', '2.4.3.2'),
(68, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESERVAS DE LUCROS', 'Reservas Contratuais', '2.4.4', '2.4.4.1'),
(69, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESERVAS DE LUCROS', 'Reservas para Contingências ', '2.4.4', '2.4.4.2'),
(70, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESERVAS DE LUCROS', 'Reserva especial CM IPC/90', '2.4.4', '2.4.4.3'),
(71, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESERVAS DE LUCROS', 'Outras Reservas ', '2.4.4', '2.4.4.9'),
(72, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESULTADOS ACUMULADOS', 'Lucros Acumulados  ', '2.4.9', '2.4.9.1'),
(73, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESULTADOS ACUMULADOS', 'Prejuízos Acumulados', '2.4.9', '2.4.9.2'),
(74, 'Passivo', 'PATRIMÔNIO LÍQUIDO', 'RESULTADOS ACUMULADOS', 'Lucros ou Prejuízos do Período', '2.4.9', '2.4.9.9'),
(75, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'RECEITAS OPERACIONAIS ', 'Receitas de Vendas de Terrenos ', '3.1.1', '3.1.1.1'),
(76, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'RECEITAS OPERACIONAIS ', 'Receitas de Obras por Empreitada', '3.1.1', '3.1.1.3'),
(77, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'RECEITAS OPERACIONAIS ', 'Receitas de Obras por Administração ', '3.1.1', '3.1.1.4'),
(78, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'RECEITAS OPERACIONAIS ', 'Receitas de Aluguéis de Imóveis ', '3.1.1', '3.1.1.5'),
(79, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'RECEITAS OPERACIONAIS ', 'Receitas de Vendas de Material ', '3.1.1', '3.1.1.6'),
(80, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'RECEITAS OPERACIONAIS ', 'Receitas de Prestação de Serviços  ', '3.1.1', '3.1.1.7'),
(81, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'RECEITAS OPERACIONAIS ', 'Devoluções de vendas/serviços ', '3.1.1', '3.1.1.9'),
(82, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'CUSTOS OPERACIONAIS ', 'Custos dos Terrenos Vendidos ', '3.1.2', '3.1.2.1'),
(83, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'CUSTOS OPERACIONAIS ', 'Custos dos Imóveis Vendidos', '3.1.2', '3.1.2.2'),
(84, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'CUSTOS OPERACIONAIS ', 'Custos das Obras Por Empreitada', '3.1.2', '3.1.2.3'),
(85, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'CUSTOS OPERACIONAIS ', 'Custos das Obras por Administração ', '3.1.2', '3.1.2.4'),
(86, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'CUSTOS OPERACIONAIS ', 'Custos com Imóveis Locados ', '3.1.2', '3.1.2.5'),
(87, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'CUSTOS OPERACIONAIS ', 'Custos dos Materiais Vendidos ', '3.1.2', '3.1.2.6'),
(88, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'CUSTOS OPERACIONAIS ', 'Recuperação de Custos de Exercícios anteriores', '3.1.2', '3.1.2.9'),
(89, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'DESPESAS OPERACIONAIS  ', 'Despesas Administrativas', '3.1.3', '3.1.3.1'),
(90, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'DESPESAS OPERACIONAIS  ', 'Despesas Comerciais', '3.1.3', '3.1.3.2'),
(91, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'DESPESAS OPERACIONAIS  ', 'Despesas Financeiras Líquidas ', '3.1.3', '3.1.3.3'),
(92, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'DESPESAS OPERACIONAIS  ', 'Despesas Tributárias ', '3.1.3', '3.1.3.4'),
(93, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'DESPESAS OPERACIONAIS  ', 'Amortizações e Depreciações  ', '3.1.3', '3.1.3.5'),
(94, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'DESPESAS OPERACIONAIS  ', 'Recuperação de Despesas ', '3.1.3', '3.1.3.6'),
(95, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'EFEITOS INFLACIONÁRIOS', 'Correção Monetária de Balanço ', '3.1.4', '3.1.4.1'),
(96, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'RECEITAS NÃO OPERACIONAIS', 'Ganhos de Equivalência Patrimonial', '3.2.1', '3.2.1.1'),
(97, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'RECEITAS NÃO OPERACIONAIS', 'Receitas Diversas ', '3.2.1', '3.2.1.9'),
(98, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'DESPESAS NÃO OPERACIONAIS ', 'Perdas de Equivalência Patrimonial  ', '3.2.2', '3.2.2.1'),
(99, 'RESULTADO ', 'RESULTADO OPERACIONAL ', 'DESPESAS NÃO OPERACIONAIS ', 'Despesas Diversas ', '3.2.2', '3.2.2.2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `instituicao` varchar(255) DEFAULT NULL,
  `responsavel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `nickname`, `email`, `senha`, `instituicao`, `responsavel`) VALUES
(2, 'ADM', 'ADM', 'ADM@gmail.com', 'ADM123', 'ADM', 'Test');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `balancos`
--
ALTER TABLE `balancos`
  ADD PRIMARY KEY (`num_balanco`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `num_balanco` (`num_balanco`),
  ADD KEY `id_plano_de_contas` (`id_plano_de_contas`),
  ADD KEY `c_debito` (`c_debito`),
  ADD KEY `c_credito` (`c_credito`),
  ADD KEY `conta_analitica` (`conta_analitica`);

--
-- Índices de tabela `planodecontas`
--
ALTER TABLE `planodecontas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `conta` (`conta`),
  ADD UNIQUE KEY `conta_analitica` (`conta_analitica`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `balancos`
--
ALTER TABLE `balancos`
  MODIFY `num_balanco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `planodecontas`
--
ALTER TABLE `planodecontas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `balancos`
--
ALTER TABLE `balancos`
  ADD CONSTRAINT `balancos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `lancamentos`
--
ALTER TABLE `lancamentos`
  ADD CONSTRAINT `lancamentos_ibfk_1` FOREIGN KEY (`num_balanco`) REFERENCES `balancos` (`num_balanco`),
  ADD CONSTRAINT `lancamentos_ibfk_2` FOREIGN KEY (`id_plano_de_contas`) REFERENCES `planodecontas` (`id`),
  ADD CONSTRAINT `lancamentos_ibfk_3` FOREIGN KEY (`c_debito`) REFERENCES `planodecontas` (`conta`),
  ADD CONSTRAINT `lancamentos_ibfk_4` FOREIGN KEY (`c_credito`) REFERENCES `planodecontas` (`conta`),
  ADD CONSTRAINT `lancamentos_ibfk_5` FOREIGN KEY (`conta_analitica`) REFERENCES `planodecontas` (`conta_analitica`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
