function segmentation(slice_info,app,colormap,maximum_range,color,backgroud)

% ======================================================== %
% NAME: segmentation()
%
% PURPOSE: Apresentação do resultado da segmentação da imagem ao nível da
% aplicação programada, podem verificar-se a apresentação da mesma com ou
% sem background
%
% CATEGORY: Processamento de imagem
% INPUTS: 
% slice_info = Matriz 2D referente à imagem de um slice específico
% app = Localização para onde se pretende representar a imagem resultante
% da segmentação
% colormap = Colormap utilizado para representação da imagem
% maximum_range = Máximo da gama dinâmica estabelecido, para representação da imagem
% color = Cor de apresentação do segmento identificado
% backgroud = Presença ou ausência do background
%
% OUTPUTS: None
% SIDE EFFECTS: Apresentação da imagem segmentada ao nível da app programada;
% RESTRICTIONS: None
% ======================================================== %

% Transformação para uma imagem binária
[counts,~] = imhist(slice_info,maximum_range);

% Método otsu - Threshold ideal
T = otsuthresh(counts);
binary_image = imbinarize(slice_info,T);

% Criação das áreas segmentadas segundo a função strel (Elemento de
% estrutura em disco)
SE=strel('disk',7,0);
surfaces=imopen(binary_image,SE);

% Diferenciação dos vários segmentos
segments=bwlabel(surfaces,8);

maxj=0;
index=1;
for j=1:10
    % Escolha do segmento representativo do cérebro 
    % Para tal seleciona-se o segmento existente em +- 4 pixels nas duas 
    % dimensões da imagem em estudo com mais pixeis 
    if (sum(sum(segments(124:132,124:132)==j))~=0 && sum(sum(segments(124:132,124:132)==j))>maxj)
        index=j;
    end
end

% Tornar a intensidade nula em todos os pixels diferentes da zona selecionada 
segments(segments~=index)=0;

% Fecho do segmento escolhido
segments_closed=imclose(segments,strel('disk',5,8));

% Segmento final, tendo por base as intensidades da imagem original 
final_segment=uint16(segments_closed).*slice_info;

hold(app,'on')
% Com background
if backgroud==0
    imshow(slice_info,'DisplayRange',[0,maximum_range],'parent',app,'Colormap',colormap);
% Sem background    
else
    imshow(final_segment,'DisplayRange',[0,maximum_range],'parent',app,'Colormap',colormap);
end

% Ovelap da imagem do segmento
if strcmp(color,'red')
    overlap = cat(3, ones(size(slice_info)),zeros(size(slice_info)), zeros(size(slice_info)));
elseif strcmp(color,'green')
    overlap = cat(3, zeros(size(slice_info)),ones(size(slice_info)), zeros(size(slice_info)));
elseif strcmp(color,'blue')
    overlap = cat(3, zeros(size(slice_info)),zeros(size(slice_info)), ones(size(slice_info)));
elseif strcmp(color,'white')
    overlap = cat(3, ones(size(slice_info)),ones(size(slice_info)), ones(size(slice_info)));
else
    overlap = cat(3, zeros(size(slice_info)),zeros(size(slice_info)), zeros(size(slice_info)));
end

h=imshow(overlap,'DisplayRange',[0,maximum_range],'parent',app);
set(h, 'AlphaData', final_segment*maximum_range/4);
hold(app,'off')
end