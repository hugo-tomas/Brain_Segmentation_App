function [sp,cp,tp,maximum]=all_plans()

% =========================================================== %
% NAME: all_plans()
%
% PURPOSE: Subdividir os dados fornecidos ao nível de um volume de MRI, em
% células com os vários slices de cada um dos cortes aplicados (sagital,
% coronal e transversal)
%
% CATEGORY: Manipulação de dados
% INPUTS: A função não tem inputs explicitos, mas na verdade toda a
% informação deriva do volume 'brain_data.nii', intrinseco da função. As
% propriedades específicas deste volume levam a que a função não seja
% adaptável a vários volumes.
%
% OUTPUTS:
% sp = Célula com as várias matrizes das imagens de cortes
% sagitais do volume em estudo;
% cp = Célula com as várias matrizes das imagens de cortes
% coronais do volume em estudo;
% tp = Célula com as várias matrizes das imagens de cortes
% transversais do volume em estudo;
% maximum = Valor máximo de intensidade do volume em estudo
%
% SIDE EFFECTS: None
% RESTRICTIONS: Função apenas para o estudo do volume atual. 
% A aplicação em outros volumes implicaria a adapatação desta mesma função.
% =========================================================== %

% Volume em estudo (dados resultantes de um exame MRI)
% >> Retirado de: http://www.neuromorphometrics.com/?page_id=310 <<
data=niftiread('brain_data.nii');

% Para tornar a matriz volume num cubo (descarte de dados medicamente irrelevantes)
data=data(:,:,39:294);
[sx,sy,sz]=size(data);

% Valor máximo de intensidade do volume em estudo
% (Necessário descobrir para adaptar a gama dinâmica de observação da imagem)
maximum=max(max(max(data)));

% Células iniciais dos vários planos anatómicos em análise
sp=cell(1,sx);
cp=cell(1,sy);
tp=cell(1,sz);

% Anexação das imagens dos vários cortes às respetivas células
for i=1:sx
    sp{i}=squeeze(data(i,:,:));
    cp{i}=squeeze(data(:,:,i))';
    tp{i}=squeeze(data(:,i,:))';
end

