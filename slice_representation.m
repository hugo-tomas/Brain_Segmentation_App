function slice_representation(slice_info,app,colormap,maximum_range,var,step)

% ======================================================== %
% NAME: slice_representation()
%
% PURPOSE: Apresentação do slice em questão ao nível da aplicação programada, 
% podendo ser sob forma de animação ou repentina;
%
% CATEGORY: Manipulação de dados
% INPUTS: 
% slice_info = Matriz 2D referente à imagem de um slice específico
% app = Localização para onde se pretende representar a imagem resultante
% da segmentação
% colormap = Colormap utilizado para representação da imagem
% maximum_range = Máximo da gama dinâmica estabelecido, para representação da imagem
% var = Valor da variação das intensidades (ex:[0,var] -> Amostragem das intensidades)
% step = Valor de pausa entre apresentação de imagens consecutivas
%
% OUTPUTS: None
% SIDE EFFECTS: Apresentação da imagem ao nível da app programada
% RESTRICTIONS: None
% ======================================================== % 

% Caso em que seja apenas necessário apresentar a imagem sem animação
if (step==0 || var==0)
    imshow(slice_info,'DisplayRange',[0,maximum_range],'parent',app,'Colormap',colormap);

% Aplicação de uma animação a cada imagem. 
% Ou seja, surgimento dos dados referentes a um intervalo de valores de 
% intensidade da imagem, de forma sequencial!

else
    new_slice_info=zeros(size(slice_info));
    maximum=max(max(slice_info));
    for i=0:var:1-var
        index=find(slice_info>=maximum*i & slice_info<=maximum*(i+var));
        new_slice_info(index)=uint16(slice_info(index));
        imshow(new_slice_info,'DisplayRange',[0,maximum_range],'parent',app,'Colormap',colormap);
        pause(step)
    end
end
end