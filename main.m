%% FINAL PROJECT - API - 2022/2023
% NAME: Hugo Tomás Pereira Alexandre
% Nº: 2019235256
%
% PURPOSE: O objetivo do atual trabalho passa pela segmentação do cérebro
%          em tempo contínuo ou isolado ao nível de uma só imagem. 
%          Este procedimento será executado nos 3 cortes (coronal, sagital e axial). 
%          Com a interface gráfica ("GUI_API_FinalProject.mlapp") será possível 
%          visualizar os resultados do atual trabalho prático.
%
% CATEGORY: Análise e Processamento de Imagem
% ---

% Apenas é necessário correr este programa e terá acesso à app,
% desenvolvidada para o trabalho atual
run GUI_API_FinalProject.mlapp

% Breve TUTORIAL sobre a app:
%
% Slice Mode - É possível, através da alteração do slice nas caixas
%              numéricas superiores, visualizar um corte específico, sendo este feito
%              (na ausência da opção de segmentação) por meio de uma representação
%              sequencial por ordem de intensidades de cada pixel;
%
% Movie Mode - Apresentação dos slices de uma forma dinâmica. De realçar 
%              que após o término a app retorna aos slices centrais;
%
% Brain Segmentation Mode - Possíbilidade de deliniarização do cérebro, com
%              e sem background. A combinação deste modo com o Movie mode é exequível,
%              apesar do algoritmo usado conter alguns algumas fraguilidades do ponto de
%              vista dinâmico, mais propriamente para certos slices.
