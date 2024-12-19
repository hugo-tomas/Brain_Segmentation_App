function map=all_colormaps(app_colormap)

% =========================================================== %
% NAME: all_colormaps()
%
% PURPOSE: Definição do colormap a aplicar à imagem representada
%
% CATEGORY: Processamento de imagem
% INPUTS: app_colormap = String fornecida ao nível da app desenvolvida, 
% em relação ao colormap escolhido.
%
% OUTPUTS:
% map = Matriz específica do colormap caso escolhido.
%
% SIDE EFFECTS: None
% RESTRICTIONS: None
% ======================================================== %

% Definição do Colormap escolhido
if (strcmp(app_colormap,'gray'))
    map=gray;
elseif (strcmp(app_colormap,'hot'))
    map=hot;
elseif (strcmp(app_colormap,'copper'))
    map=copper;
elseif (strcmp(app_colormap,'turbo'))
    map=turbo;
elseif (strcmp(app_colormap,'bone'))
    map=bone;
end
end
